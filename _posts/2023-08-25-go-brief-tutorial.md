---
layout: post
title: GoLang, a brief tutorial 
author: Carlos Kelkboom
date: 2023-08-25
published: true
tags: Programming Go
---
* TOC
{:toc}

> This post is going to be a bit longer than my normal posts. It is 
  also going to be more technical than my normal posts. This is because
  I truly enjoy writing [GoLang](https://go.dev/). The language is a
  breath of fresh air and in this post I want to share this feeling with you 
  by going over a few of the powerful features of go.

What shall we start with? I want something which really shows the power of
GoLang. I want something which is useful. Let's create a small game server!

> Disclaimer: this is *not* the way to create an actual game server for
  an MMO RPG, this is a tutorial on GoLang, not game servers.

## Things we'll need to know
In this chapter we will go into some details of the language. I will not
describe things like addition or multiplication. But only things which make
go special.

### `:=` vs `=`
One thing in Go which immediately pops out is the use of either the `:=` or
the `=`. The difference is simple:

* `=` assign a value to an already defined variable
* `:=` define the variable and assign a value immediately

Remember that programs are concerned with memory, if I want to retrieve the 
value of an `int32` I know that I need to start somewhere and retrieve the 
next 32 bits. This is why we declare a variable beforehand, preparing the 
runtime to allocate a specific amount of memory like so:

```go
var i int
i = 4
```

We can use the syntactic sugar of Go and write that as:

```go
i := 4
```

We infer the type, because at the time of assigning the value we know the type
of the value and know how much memory we need to reserve. 

We can also assign multiple values at once:

```go
a, b := 2, 4
```

> Here be dragons! I personally dislike this syntax, yes, it saves you a line
  but what does it actually bring you? Nothing much in my honest opinion, just
  more things your eyes need to get used to. Here's my advice, try to write code
  like it's 1965, one statement per line!

### Type conversions

In the intricate tapestry of programming, the type of data stands as a sentinel, 
ensuring that we, the programmers, are aware of what we're working with. Go, 
unlike some dynamically-typed languages, is statically-typed. This means that 
the type of a variable is known at compile-time, bringing with it both robustness 
and responsibility. With robustness comes the safety net of type-checking, 
preventing many runtime errors. With responsibility, though, comes the need 
for explicit type conversions.


#### The Basic Premise

In Go, unlike some other languages where conversions might occur automatically 
(often termed as "type coercion"), you must be explicit about type conversions.

> Go is proud not to have type coercion which is *implicit* type conversion, while
  go has *explicit* type conversions.

Consider two integer types: `int` and `int64`. Even if they're both integer types, 
you cannot assign a value of type int to a variable of type `int64` without a type conversion.

```go
var x int = 42
var y int64
y = x  // This will raise a compile-time error
```

To successfully assign the value of `x` to `y`, a type conversion is needed:

```go
y = int64(x)  // This is correct
```

#### Why so strict?
You might wonder: if both are integers, why fuss about the conversion? Here's where we tread back in time, embracing the lessons from the punch card era. The need for clarity and the intentional action is paramount. Automatic type coercion can lead to unpredictable results and hard-to-trace bugs, especially when precision and memory layouts come into play. Go’s philosophy prioritizes clarity over assumed convenience.

Type conversions aren't limited to numerical types. Let's venture into converting between other data types.

Strings to byte slices:

```go
s := "hello"
b := []byte(s)
```

And back:

```go
b := []byte{'h', 'e', 'l', 'l', 'o'}
s := string(b)
```

#### Closing thoughts
In the programming landscapes of yesteryears, there was a deeply ingrained need for 
precision, borne out of the constraints of the technology of the time. With punch cards, 
every line had to matter, and clarity was not just a virtue but a necessity. Go, in its 
design, seems to hark back to those principles.

An absolute beast of an argument is that the compiler has fewer ambiguities to wrestle with. 
It knows precisely what is expected and doesn't need to infer or decide on potential type coercions.
Go's compiler is extremely fast and things like this are the reason why!

While modern tooling and programming languages have moved towards flexibility and convenience, 
often at the expense of clarity, Go stands somewhat apart. By making type conversions explicit, 
it ensures that programmers are always in control, always aware, and never taken by surprise 
by implicit decisions made on their behalf.

Remember, in the world of software, clarity ensures longevity, readability, and often, reliability. 
Embrace it, even if it means typing a few extra characters.




### Deferred statements

A deferred statement is executed right before the function exits, in reverse 
order. This means that you can add these deferred statements to clean things
up. GoLang is garbage collected, but that does not mean that we need to be
sloppy.

```go
func example() {
    fmt.Println("Start")
    defer fmt.Println("Middle")
    defer fmt.Println("Middle 2")
    fmt.Println("End")
}
```

If we execute this program, we will get the following output:

```go
Start
End
Middle 2
Middle
```
Another great example is handling a connection from a TCP server. This example
will bring us closer to the actual server we will be implementing:

```go
func handleConnection(conn net.Conn) {
    defer conn.Close()

    // create a buffer of fixed size 1024
    buffer := make([]byte, 1024)
    // read from stream
    length, err := conn.Read(buffer)
    //echo the message
    _, err2 := conn.Write(buffer[:length])
}
```

I have removed all the error handling, this is because it would obfuscate the
code. But in go, you will have to use a variable if you assign it. This code
will not build:

```
> go build .
# test
.\main.go:58:10: err declared and not used
.\main.go:60:5: err2 declared and not used
```

More importantly, the defer statement at the top of the function makes sure 
that we close the connection before exiting the function. Another thing to
note is that `conn.Read(buffer)` is a blocking operation. This means that 
if we put this code in a loop:

```go

func handleConnection(conn net.Conn) {
    defer conn.Close()

    for {
        buffer := make([]byte, 1024)
        // ...
    }
}
```

The function will run until there is a network error, or some other failure in
the system, at which point, the deferred statement will be executed and the 
connection will be closed. 

### Multiple return values
Go is refreshingly different, in that in Go, you can return multiple values. 
You might have seen this happening where `conn.Read()` would return both the `length`
and a potential error. Combine this with the fact that you *have* to use a 
variable once you've declared it, and this makes for some robust error handling.

> Many people find this way of enforcing error handling tedious, but it makes
  for a robust and utterly transparent way of working. Combine this with an
  aversion to generics, so no Monads, and you have an amazingly consistent and
  simple language in which you can write very performant, garbage collected, 
  easy to maintain solutions. The downside is the amount of boilerplate.

Look at this example:


```go
func foo() (int, string) {
	return 2, "wow!"
}
```

Some might recognize this pattern as being similar to returning a tuple 
in other languages and then destructuring it. However, Go doesn’t have 
traditional tuples. The syntax just gives the feel of returning multiple 
values directly.

Another powerful example is:

```go
import (
    "math"
    "errors"
    "fmt"
)
func sqrt(i int) (float64, error) {
	if i < 0 {
		return -1, errors.New("must be non negative")
	} else {
		return math.Sqrt(float64(i)), nil
	}
}
```

In this basic example, we force the user of our `sqrt` function to handle the error
if we pass in a negative number.

You would use it like this:

```go
func main() {
    value, err := sqrt(-2)
    if err != nil {
        fmt.Println(err)
    } else {
        fmt.Println("Well done! " + fmt.Sprintf("%f", value))

        // alternatively
        fmt.Println("Well done! %f\n", value)
    }
}
```

## Working with collections 
Let's define a player type first[^1]:

```go
type Player struct {
    Id          uuid.UUID
    Connection  net.Conn
}
```

If we wanted to store a player in an array, in go we call this type a slice
because it does not have a fixed length, we can create a variable which holds 
references[^2] to `Player` objects:

```go
var players []*Player
```

We can now change our connection code to add the player to the players. This code
will also include a bit of the boilerplate code you will need to start a TCP 
server in Go.

```go
func startServer(address string) {
    // start the tcp listener and close it when the function
    // goes out of scope. 
    listener, err := net.Listen("tcp", address)
    if err != nil {
        fmt.Println("Error starting server:", err)
        os.Exit(1)
    }
    defer listener.Close()

    fmt.Println("Server started on", address)

    // create an infinite loop where we keep 
    // accepting connections to our TCP server
    for {
        conn, err := listener.Accept()
        if err != nil {
            fmt.Println("Connection error:", err)
            continue
        }

        // Create the new player
        playerId := uuid.New()
        newPlayer := &Player{
            Id:         playerId,
            Connection: conn,
        }
        // append the player to the players slice
        // notice how it's a simple function and not
        // a method on the players slice itself.
        // It also return the new slice, you need to
        // assign it to the variable again.
        players = append(players, newPlayer)

        // Handle the connection in a go routine
        go handleConnection(newPlayer)
    }
}
```

A lot of interesting things are happening here. If you want to skip ahead to 
[go routines](#go_routines) I won't hold it against you, they are fascinating!
But for those who want to keep on reading about arrays and slices will hopefully
be rewarded as well.

### Arrays
An array in Go is a sequence of elements defined with a specific, fixed length. The length is part of the array's type, which means arrays of different lengths are considered different types.

```go
var arr [3]int // Declares an array of three integers
arr[0] = 1
arr[1] = 2
arr[2] = 3
fmt.Println(arr)  // Outputs: [1 2 3]
```

### Slices
Slices, on the other hand, are dynamic. They don't have a fixed size like arrays. Under the hood, a slice references a section (or the entirety) of an array. Slices are more common in Go than arrays due to their flexibility.

```go
var s []int = arr[:2] // Creates a slice from the first two elements of our previous arr
s = append(s, 4)      // Appends 4 to the slice
fmt.Println(s)        // Outputs: [1 2 4]
```

## Structs

In Go, we can define our own types. I call these *product types* because the type
can contain the cross product of all the field's values. Take for example this struct:

```go
type Vector3 struct {
    X int
    Y int
    Z int
}
```

This `Vector3` can have all the combined values of all integers. 

Now, we might want to add a method on this struct, for example, we might want to 
calculate the length of the vector:

```go
func (v Vector3) Length() int {
    return math.Sqrt(v.X * v.X + v.Y * v.Y + v.Z * v.Z)
}
```

### Interfaces
Interfaces are another great example of simplicity in Go:

```go
type vector interface {
    Length() int
}
```

Now that we have defined the interface `vector`. Our Vector3 struct automatically 
implements this interface.

> This concept is called *Duck Typing*. If it walks like a duck and if it 
  quacks like a duck...

### Types of receivers
If we look back at the code for the length of the vector. We might think we can 
modify it. Imagine the following method:

```go
func (v Vector3) ScalarMultiply(i int) {
    v.X = v.X * i
    v.Y = v.Y * i
    v.Z = v.Z * i
}

func main() {
    vec := Vector3{
        X: 3,
        Y: 4,
        Z: 5,
    }
    vec.ScalarMultiply(2)

    fmt.Println("What is x? %d", vec.X)
}
```

First off, I will get a warning:

```
ineffective assignment to field Vector3.Z (SA4005)go-staticcheck
```

This warning shows that lines 2 to 5 are ineffective, they do not modify the 
vector passed in. 

Secondly, the value printed to the screen would be:

```
What is x? 3
```

This shows that we have not mutated the vector being passed in. This is something
to realize when working with Go, the *Value Receiver* receives the value as a copy. 
You cannot change the values of the original directly.

If you wanted to, you could either return a new Vector3:

```go
func (v Vector3) ScalarMultiply(i int) Vector3 {
	return Vector3{
		X: v.X * i,
		Y: v.Y * i,
		Z: v.Z * i,
	}
}
```

Or, you could create a *Pointer Receiver*:

```go
func (v *Vector3) ScalarMultiply(i int) {
    v.X = v.X * i
    v.Y = v.Y * i
    v.Z = v.Z * i
}
```

By passing in a reference (a pointer[^2]) to a `Vector3` object, we can mutate the values.
This distinction is essential to grasp in Go. It provides a powerful and clear way to 
specify whether a method can modify an object's values.



## Go Routines {#go_routines}

Now, the moment you have all been waiting for. The true reason we all want to learn Go:
***Concurrency***!


In Go, we have two concepts, the concept of a *go routine* and the concept of a *channel*.
You can't explain the first without the second and vice versa. So this is going to be a 
heavy chapter. 

A *go routine* is a light-weight concurrency[^3] model managed by the Go runtime. You should 
not think of it as multithreading or other types of parallelism, but think of them
as fleeting, small, functions you can execute independently of each other. I know it's 
hard to understand the definition, and I am being "loosy-goosy" with the terms, but I 
am convinced that the definitions become easier when we dive into some code. 

> Please feel free to play around with this code, the more you play, the more you learn!

Imagine the standard [Fizz Buzz](https://en.wikipedia.org/wiki/Fizz_buzz) problem. Now, let's
solve that using go and move from there to a concurrent model.

```go
func fizzBuzz(i int) {
    if i%15 == 0 {
        fmt.Printf("%d FizzBuzz\n", i)
    } else if i%5 == 0 {
        fmt.Printf("%d Buzz\n", i)
    } else if i%3 == 0 {
        fmt.Printf("%d Fizz\n", i)
    }
}
func main() {
    const max = 100
    for i := 1; i <=max; i++ {
        fizzBuzz(i)
    }
}
```

This code runs and runs well. But we want more, we want to update the UI independently
of the checking of the Fizz Buzz state. We want to split this code into small, self-
executing parts.

Let's execute `fizzBuzz` as a go routine! The only thing we need to do is to add the 
keyword `go` in front of the fizzBuzz function call.

```go
func fizzBuzz(i int) {
    if i%15 == 0 {
        fmt.Printf("%d FizzBuzz\n", i)
    } else if i%5 == 0 {
        fmt.Printf("%d Buzz\n", i)
    } else if i%3 == 0 {
        fmt.Printf("%d Fizz\n", i)
    }
}
func main() {
    const max = 100
    for i := 1; i <=max; i++ {
        go fizzBuzz(i)
    }
}
```

That's it, we now execute this function concurrently! If you run it, you will probably 
notice that the console only prints one or two "Fizz" "Buzz" statements. This is because
spawning a go routine 100 times is much, much faster than the IO for printing the result.
This is where channels come in. We can signal the system that we are done. 

> Channels are a way to transfer data safely from one go routine to another. In other 
  languages, there is always a problem in receiving data from one concurrent process and
  use that data in another process, for example the main or UI process. Channels give you
  a powerful tool with a simple API to manage this complexity.

```go
func fizzBuzz(i int, done chan<- bool) {
	if i%15 == 0 {
		fmt.Printf("%d FizzBuzz\n", i)
	} else if i%5 == 0 {
        fmt.Printf("%d Buzz\n", i)
    } else if i%3 == 0 {
        fmt.Printf("%d Fizz\n", i)
    }

	if i == 100 {
		done <- true
	}
}
func main() {
	const max = 100
	done := make(chan bool)
	for i := 1; i <= max; i++ {
		go fizzBuzz(i, done)
	}

	<-done
}
```

We now have a signal which we get trough the channel named `done`. This signal
is awaited in the `main` function with this code: `<-done`
Once we receive a signal on the `done` channel, the function exits.

Now let's see if we can go one step further, spin up a single go routine and
send the numbers to this go routine for processing. I will introduce two new
channels: numbers and messages.

The numbers channel will be used to send the numbers to the fizzBuzz function,
while the messages channel will receive the messages from the fizzBuzz function
for printing. Let's start by looking at the full code:

```go
type Message struct {
	Value int
	Text  string
}

func printer(messages <-chan Message, done chan bool) {
	for m := range messages {
		fmt.Printf("%d %s\n", m.Value, m.Text)
	}
	done <- true
}
func fizzBuzz(numbers <-chan int, messages chan<- Message) {
	for n := range numbers {
		if n%15 == 0 {
			messages <- Message{Text: "FizzBuzz", Value: n}
		} else if n%5 == 0 {
			messages <- Message{Text: "Buzz", Value: n}
		} else if n%3 == 0 {
			messages <- Message{Text: "Fizz", Value: n}
		}
	}
	close(messages)
}

func main() {
	const max = 1000000

	done := make(chan bool)
	numbers := make(chan int, max)
	messages := make(chan Message)

	go printer(messages, done)
	go fizzBuzz(numbers, messages)

	for i := 1; i <= max; i++ {
		numbers <- i
	}
	// we can close the numbers channel after
	// sending all the numbers
	close(numbers)

	<-done
}
```
When all the numbers are send through the channel, we can close the numbers channel.
This signals the fizzBuzz function that it's done. Exiting the for loop.
When the all numbers are processed and pushed through the messages channel, the 
messages channel is closed, signaling that the for loop in the printer is finished. 
When that is done, we signal that we are done and the program stops. 

### Waiting on multiple go routines

One of my earlier examples had the following code:

```go
if i == 100 {
    done<- true
}
```

This was wrong, if the number 100 was somehow processed before the other, we 
would signal that we were done. The solution is wait groups.

```go
func fizzBuzz(i int, wg *sync.WaitGroup) {
	defer wg.Done()  // Signal that this goroutine is done once it exits

	if i%15 == 0 {
		fmt.Printf("%d FizzBuzz\n", i)
	} else if i%5 == 0 {
		fmt.Printf("%d Buzz\n", i)
	} else if i%3 == 0 {
		fmt.Printf("%d Fizz\n", i)
	}
}

func main() {
	const max = 100
	var wg sync.WaitGroup  // Create a new WaitGroup

	for i := 1; i <= max; i++ {
		wg.Add(1)  // Increment the WaitGroup counter
		go fizzBuzz(i, &wg)  // Pass a pointer to the WaitGroup
	}

	wg.Wait()  // Block until all goroutines have finished executing
}
```

> go routines are a lightweight concurrency model. In another article
  I will go deeper into what that means, how to use it in a larger
  system and how to use locks in order to avoid breaking your application.

## APPENDIX

This appendix is to add extra information I do not want to keep around in the
actual article because it would bloat the article.

### Working with UUIDs {#working_with_uuids}
[^1]: [Working with UUIDs](#working_with_uuids)
To install the package write:

```
go get github.com/google/uuid
```

In your imports add:

```
"github.com/google/uuid"
```

### Working with pointers {#pointers}
[^2]: [Working with pointers](#pointers)
In computer programming, understanding how data is stored and accessed is fundamental. At the most basic level, every piece of data—be it a number, character, or complex data structure—occupies a location in memory. Sometimes, direct access to this data is sufficient. But in other cases, especially when dealing with large datasets or when optimizing performance, we might not want to manipulate the data directly. Instead, we'd prefer to work with references to that data. These references, often called 'pointers' in languages like Go, allow us to interact with data indirectly, providing both flexibility and efficiency. This tutorial will introduce you to the concept of references in Go, explaining how they can be used to enhance your programs.

Take the following code example:

```go
func sayHi() {
    var message string
    message = "Welcome!"
    fmt.Println(message)
}
```

The variable message is no longer used after the function returns. The scope is
bounded by the scope of the function. In this case, the message variable could, potentially,
be put on the stack. A stack is a data structure where we can push things on and
pop things off. It is last in, first out.

Now, if we wanted to store the message for a longer period, for example:


```go
var message string

func sayHi() {
    fmt.Println(message)
}

func main() {
    message = "Welcome!"
    for {
        sayHi()
    }
}
```

This message would be used fo the duration of the program. In this case, infinitely.
The message variable would possibly be put on the heap. Which is more difficult to access,
harder to clean up, but has a longer life. 

The heap also has a funny thing we can do, we can actually reference the location in
memory where something is stored. This is called a pointer. If we wanted to pass a
pointer to the message to the `sayHi` function we could write it like this:


```go
var message string

func sayHi(m *string) {
    fmt.Println(*m)
}

func main() {
    message = "Welcome!"
    for {
        sayHi(&message)
    }
}
```

In go, the `*` symbol has two purposes. The firs, when used when declaring a type
is to indicate that it is a pointer to a certain type. When the `*` is used as a
prefix to a variable, as in `*m`, it dereferences the pointer and gives the value.

The `&` symbol gives you the address of a variable, essentially turning the variable
into a pointer.

> The reason why I say things like *potentially* and *probably* is because I am 
  writing a tutorial and I want to explain he concepts. The Go runtime is complicated
  and we can never be sure the variables are actually put on a stack or a heap, or 
  even a data segment, which is different from both. 
  All I am saying is, don't take the location literally, take the ideas of pointers
  and referencing/dereferencing and read the location where a variable is stored
  as a suggestion.


### Concurrency vs Parallelism {#concurrency}
[^3]: [Concurrency vs Parallelism](#concurrency)
Concurrency and parallelism, while often used interchangeably, capture distinct concepts in computing:

Concurrency: Refers to the ability of a system to *deal* with multiple tasks at the same time. It's 
about structuring a program or system to handle multiple tasks, whether they're executed simultaneously 
or not. This doesn't necessarily imply that tasks are being executed at the same time.

Parallelism: Refers to the ability of a system to *do* multiple tasks at the same time. It involves 
executing multiple threads or processes simultaneously, typically on systems with multiple processors 
or cores.

Go is adept at handling both scenarios. It's vital to understand the difference:

For instance, managing multiple tasks in a non-blocking manner on a single thread, as JavaScript does 
with its event loop, exemplifies concurrency. On the other hand, spinning up multiple threads that 
run simultaneously and coordinate their results back to the main thread illustrates parallelism.