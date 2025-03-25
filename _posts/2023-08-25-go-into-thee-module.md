---
layout: post
title: Go Modules, Packages and Files - A Guide for C# and JavaScript Developers 
author: Carlos Kelkboom
date: 2023-08-26
published: true
tags: Programming Go
---

The guide explains how Go’s approach to code organization contrasts with that of C# and JavaScript by emphasizing a directory-driven structure where every file belongs to a single package, and related packages are grouped into modules. Unlike C#—which compiles projects into DLLs and uses namespaces—and JavaScript—where each file typically acts as its own module with dependencies managed via package managers—Go mandates that all files within a directory share the same package, manages dependencies through a go.mod file, and restricts visibility to only those items that are capitalized. This framework not only simplifies dependency management by avoiding circular imports but also introduces a clear separation between public and internal code, encouraging developers to think of code organization in terms of packages and modules rather than namespaces or isolated files.

* TOC
{:toc}


## How Go Organization Differs from C# and JavaScript

If you're coming from C# or JavaScript, Go's approach to code organization will feel different. Let's compare:

### In C#:
- Projects compile to DLLs
- You reference other projects by referencing their DLLs
- Code is organized into namespaces
- You import with `using Namespace`
- Circular dependencies between projects are not allowed

### In JavaScript:
- Code is organized into files or modules
- You import with `import` or `require`
- Dependencies are managed with npm/yarn and package.json
- Each file is its own module

### In Go:
- Code is organized into **packages** (similar to namespaces)
- Related packages are grouped into **modules** (similar to NuGet packages)
- A single file belongs to exactly one package
- All files in the same directory must belong to the same package
- No explicit compilation to DLLs - Go builds executables directly
- Dependencies are managed through `go.mod` files

## Go Packages Explained

In Go, a package is a collection of source files in the same directory that are compiled together. It's similar to a namespace in C#, but with important differences:

```go
// This declares that this file belongs to the "main" package
package main

// Import other packages to use their functionality
import (
    "fmt"  // Standard library package
    "strings"  // Another standard library package
)

func main() {
    // Using functions from the imported packages
    message := "hello, world"
    fmt.Println(strings.ToUpper(message))
}
```

**Key differences from C#:**
1. Every Go file must start with a `package` declaration
2. All files in the same directory must belong to the same package
3. You import packages, not namespaces
4. Only exported (capitalized) items are accessible outside the package

## Go Modules: Managing Dependencies

A Go module is a collection of related packages with versioning information. It's roughly equivalent to a C# project or a JavaScript npm package.

### Creating a Module

```bash
# Create a new module named "github.com/yourusername/yourproject"
go mod init github.com/yourusername/yourproject
```

This creates a `go.mod` file, which is like a combination of a C# project file and a NuGet package reference list:

```go
module github.com/yourusername/yourproject

go 1.20
```

### Directory Structure Example

```
myproject/                     # Project root
├── go.mod                     # Module definition
├── go.sum                     # Dependency checksums (like packages.lock.json)
├── main.go                    # Package "main" 
├── utils/                     # Directory for "utils" package
│   ├── helpers.go             # Part of "utils" package
│   └── formatters.go          # Also part of "utils" package
└── internal/                  # Special directory for private packages
    └── config/                # Package "config" that can't be imported externally
        └── settings.go
```

### Key Concepts Unique to Go

#### 1. One Package Per Directory
All files in a single directory must belong to the same package. This is fundamentally different from C# where a directory can contain multiple namespaces.

#### 2. Package vs. Directory Names
The package name doesn't have to match the directory name, but it's good practice:

```
myproject/
├── stringutils/   # Directory name
    └── format.go  # Contains: package stringutils
```

#### 3. The `internal` Directory
Any package under an `internal/` directory can only be imported by code in its parent module:

```
myproject/
├── internal/
│   └── auth/      # Can only be imported by code in "myproject"
└── api/
    └── handlers.go  # Can import "myproject/internal/auth"
```

This is similar to internal visibility in C# but enforced at the module level.

#### 4. Importing Packages Within Your Module

If your module is `github.com/username/myproject`, you import packages like this:

```go
import (
    "github.com/username/myproject/utils"  // Full module path
)
```

This is different from C# where you just use the namespace without the project name.



## Common Gotchas for C# and JavaScript Developers

1. **No Circular Dependencies**: Like in C#, circular imports between packages are not allowed in Go.

2. **Capitalization Matters**: In Go, only names that start with a capital letter are exported (public). This is equivalent to `public` vs `private` in C#:
   ```go
   func PublicFunction() {}  // Accessible outside package
   func privateFunction() {} // Only accessible within package
   ```

3. **No File-Level Scope**: Unlike JavaScript modules, there's no file-level scope. Everything at the package level is shared among all files in that package.

4. **No Partial Classes**: Unlike C#, Go doesn't have partial classes. Each type must be fully defined in a single file.

5. **Import Paths**: Import paths are based on module paths plus relative path, not just namespaces as in C#:
   ```go
   // In C# you might do:
   // using MyApp.Utils;
   
   // In Go you do:
   import "github.com/username/myapp/utils"
   ```

## Practical Example: Creating a Multi-Package Application

Let's create a simple application with multiple packages:

### Directory Structure

```
myapp/
├── go.mod                 // Contains: module github.com/username/myapp
├── main.go                // Contains: package main
├── calculator/
│   ├── add.go             // Contains: package calculator
│   └── subtract.go        // Contains: package calculator
└── formatter/
    └── display.go         // Contains: package formatter
```

### go.mod
```go
module github.com/username/myapp

go 1.20
```

### main.go
```go
package main

import (
    "fmt"
    "github.com/username/myapp/calculator"
    "github.com/username/myapp/formatter"
)

func main() {
    result := calculator.Add(5, 3)
    formatted := formatter.Format(result)
    fmt.Println(formatted)
}
```

### calculator/add.go
```go
package calculator

// Add returns the sum of two integers
func Add(a, b int) int {
    return a + b
}
```

### calculator/subtract.go
```go
package calculator

// Subtract returns the difference between two integers
func Subtract(a, b int) int {
    return a - b
}
```

### formatter/display.go
```go
package formatter

import "fmt"

// Format converts a number to a formatted string
func Format(n int) string {
    return fmt.Sprintf("The result is: %d", n)
}
```

## Building and Running

Unlike C# where you compile to DLLs, Go builds directly to executables:

```bash
cd myapp
go build    # Creates an executable
./myapp     # Run the executable
```

Or run directly:

```bash
go run .    # Compile and run in one step
```

## Summary

- **Packages** are Go's equivalent to namespaces, but tied to directories
- **Modules** are collections of packages with versioning (like NuGet packages)
- Files in the same directory must belong to the same package
- Import paths include the full module path
- Only capitalized names are exported (public)
- No explicit compilation to DLLs - Go builds executables directly

Coming from C# or JavaScript, the biggest adjustments are understanding the package/module relationship and getting used to organizing code by directory structure rather than just by namespaces.
