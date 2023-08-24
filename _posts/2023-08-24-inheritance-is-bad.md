---
layout: post
title: Inheritance is bad 
author: Carlos Kelkboom
date: 2023-08-24
published: true
tags: Programming OOP
---

I hate inheritance! There, I've said it. It's true, I absolutely hate it. Inheritance destroys any
chance you have of understanding your code. And it always starts with such good intentions. You start
by defining a bit of functionality. Now you add another class and you see that same functionality 
happening in two places. Before you actually realise what has happened, you now have a base class
and two concrete classes. Life seems good right?

Unfortunately, it never ends there. Your program always changes, and the base class which seemed to
give you standard functionality is now hindering you. I am not sure if examples are going to help
with illustrating this point, because it is very hard to see an example of evolving code. It's the 
insidiousness of inheritance, it looks beautiful in an example, but it destroys productivity in 
real life. 

Still, let me try:

```csharp
public class Message {
    public string Url { get; }
    public Task Send() {
        // send the message
    }
}
public class Player : Message {
    private const string url = "/player";
    public Player() : base(url) {
        // construct something
    }
} 
public class LogMessage : Message {
    private const string url = "/log";
    public LogMessage() : base(url) {
        // the ctor
    }
}
```

This seems great right? We can now send random classes to the server! That sounds like a great plan!
But it is not, what we have done is, we've tightly coupled the `Player` class to a `Message`. What we 
are trying to do is that we're trying to add functionality to the classes which it should not have. 

## Purpose is everything
The `Player` class has a purpose. It's to give my game some information about the player. For example:
the handle, the last time they played, the last character they selected. This is the goal of the `Player`
class. 

We will also need to sync that data between server and client. This is what your networking code is for.
It is not that the `Player` class cannot and should not be used as a message. It's that it's not it's
responsibility. By giving the `Player` class the responsibility of being able to send itself, we tightly
couple functionalities. 

So, how can we solve this? We solve this by designing the system differently. Instead of inheritance we
use a concept called *composition*. A very clean approach to this is a *traits* system. It's clean, it's
super and it's easy to understand. Here's a bit of rust showing the power of the trait system:

We define our classes, notice how there is no information about the url in the struct:

```rust
struct Player;
struct LogMessage;
```

We define a trait:

```rust
pub trait SendMessage {
    fn send(&self) -> String;
}
```

Now, let's define the classes again:
```rust
impl SendMessage for Player {
    fn send(&self) -> String {
        let url = "/player";
        format!("Sending PlayerMessage to {}", url)
    }
}

impl SendMessage for LogMessage {
    fn send(&self) -> String {
        let url = "/log";
        format!("Sending LogMessage to {}", url)
    }
}
```
You can even define these traits in a separate module to keep things tight and clean.
We have moved the url to the implementation of the trait, could this be even cleaner?
Of course, but this code serves the purpose of telling the story, everything related
to sending a `struct` to the server is contained in the implementation of the trait 
and is not scattered into my business object.

I would use this something like:

```rust
fn main() {
    let player_msg = PlayerMessage;
    let log_msg = LogMessage;

    print_message(&player_msg);
    print_message(&log_msg);
}

fn print_message<T: SendMessage>(message: &T) {
    println!("{}", message.send());
}
```

Why would I do this? What does it matter? What is the harm in sprinkling some extra
functionality onto a object? The crux of the problem is that when you sprinkle extra 
functionality onto an object through inheritance, you're not just adding code. You're 
adding complexity. You're altering the design contract of that object. Let's dig a bit 
deeper.

### The Myth of the All-Powerful Object

The thought process behind inheritance often stems from the idea of creating this 
"super object" that can do multiple things. It’s tempting, right? Create a class 
that's not just an entity but can also manage its own persistence, validation, 
transformation, and so forth. The problem is, this leads to objects that have multiple 
responsibilities and violate the 
[Single Responsibility Principle (SRP)](https://en.wikipedia.org/wiki/Single-responsibility_principle).

For me, this SRP is the single most important guideline against complexity. A large
system is very complex, if your objects have a lot of responsibilitites it will be
extremely difficult to change the system. If your object do only one thing, this will
become a lot easier.

Before we go into the details of how inheritance make changing code extremely difficult, 
let's go over a few of the pitfals of these *God Objects*.

#### Tight coupling
Objects that inherit functionalities are more tightly coupled. This means, when a base 
class changes, all the derived classes can potentially break. This makes the code less 
flexible and harder to maintain. Now, imagine you have a chain of inheritance, and one 
change in the foundational class cascades across dozens of classes derived from it. 
It's a maintenance nightmare.

I always have the guidline that a change should only effect the minimal number of files 
and classes. With inheritance, when you touch a base class, you need to recompile every
class inheriting from that base class. This breaks my guideline.

#### Information hiding
Inheritance often hides dependencies and through that, information. When you inherit from 
a base class, you might inadvertently inherit behaviors that aren't immediately visible. 
These hidden behaviors can introduce bugs that are hard to trace because they don't 
originate from the derived class's code but from somewhere up the inheritance chain.

It also, literally, hides information. The number of times I have stared at a piece of 
code, amazed at the bug and wondering where it came from, only to discover that the 
actual code which is wreaking havok on my product is hidden deeply in a inheritance
tree; are too many to count. I like to see what something does. I want everything in 
a single file. I want to set a break-point or `printf` some debug info and know what is
happening where.

#### The illusion of Reusability
One of the main reasons developers opt for inheritance is reusability. While inheritance 
can provide reusability, it often comes at the cost of flexibility. As shown in the example, 
it's much cleaner to use composition where each class or trait does one thing and does it
well. It is easier to reuse a small, well-defined component than a large, monolithic one.

Reuse comes in multiple forms, reuse of data and reuse of fuctionality. When you reuse data
you are reusing information either to display it differently, or to act upon differently.
This is not bad, it is easy to refactor and easy to maintain. Reuse of functionality leads
to all manner of type information being spread throughout the code. Generics, Generic type
guards and interfaces all pop up becuase we want to reuse. All of these features make 
refactoring your code a lot harder than it needs to be.

#### Example of frailty

Suppose there's a new requirement: Players can now have premium and non-premium statuses. 
Premium players' messages must be sent to a different URL and also need an extra header 
for authentication.

We would write something like:

```csharp
public class PremiumPlayer : Player {
    private const string premiumUrl = "/premium-player";
    public string AuthenticationHeader { get; }

    public PremiumPlayer(string authHeader) : base(premiumUrl) {
        this.AuthenticationHeader = authHeader;
    }

    // Overriding Send method to include the new header
    public override Task Send() {
        // include the AuthenticationHeader
        // send the message
    }
}
```
By overriding the Send method, we now bypass the original implementation and have forced
the code to behave differently. We can still use the `PremiumPlayer` as if it is a `Player`
because of polimorphism. But we can no longer clearly see what is happening. If we want
to change the `Send` behavior to always have a header called `x-github-id`, we need to 
make this change in two places. Increasing the chance at bugs. 

Again, it is hard to find a good *static* example of this, but if you've ever maintained 
a code-base with multiple layers of inheritance you should feel your palms start to sweat
a little by now.


## Solution

How should we solve this problem? We still need to send data to the server, how should 
we do that? There are two ways to approach this problem. I will only describe *composition*,
but there is a second way, you can make an object per purpose and map between them.

Let's look at composition. CSharp does not have a trait system, which sucks. It literally
is one of the best ways to do composition, but alas. Let's look at interfaces first and afterwards 
I will also give an example of moving your functionality to a class which takes a message 
as a parameter.

### Interfaces

```csharp
using System.Threading.Tasks;

public interface IMessageSender {
    Task Send(string url, string payload, string? header = null);
}

public interface IMessage {
    Task SendMessage();
    string Serialize();
}

public class Player : IMessage {
    public string Url { get; } = "/player";
    protected readonly IMessageSender _sender;

    public Player(IMessageSender sender) {
        _sender = sender;
    }

    public virtual Task SendMessage() {
        string payload = Serialize();
        return _sender.Send(Url, payload);
    }

    public virtual string Serialize() {
        // Implementation for Player class.
        // For now, return a placeholder string.
        return "Serialized Player Data";
    }
}

public class PremiumPlayer : IMessage {
    public string Url { get; } = "/premium-player";
    public string AuthenticationHeader { get; }
    private readonly IMessageSender _sender;

    public PremiumPlayer(IMessageSender sender, string authHeader) {
        _sender = sender;
        AuthenticationHeader = authHeader;
    }

    public Task SendMessage() {
        string payload = Serialize();
        return _sender.Send(Url, payload, AuthenticationHeader);
    }

    public string Serialize() {
        // Implementation for PremiumPlayer class.
        // For now, return a placeholder string.
        return "Serialized PremiumPlayer Data";
    }
}
```

We are passing the `IMessageSender` to the `IMessage` class and with that service we are injecting
we can send the message. This is a more natural way of writing the code. I still do not like it
that the `Player` and `PremiumPlayer` classes have these methods which are strictly for sending them, 
like the `SendMessage` method and the `Serialize` method, but at least they beling to the `IMessage`
interface and not longer to the class itself.

### Layers or Services
Another way to structure this is by making the `MessageSender.Send` a function we can call with
the correct parameters. We can even make separater methods, making sure we handle the messages
correctly, no matter what the message is.

```csharp
public interface ISerializable {
    string Serialize();
}
```

Our data classes:

```csharp
public class Player : ISerializable {
    public string Name { get; set; }
    public int Score { get; set; }

    public string Serialize() {
        // Convert the player data to a string (e.g., JSON)
        return System.Text.Json.JsonSerializer.Serialize(this);
    }
}

public class PremiumPlayer : ISerializable {
    public string Name { get; set; }
    public int Score { get; set; }
    public string AuthenticationHeader { get; set; }

    public string Serialize() {
        // Convert the premium player data to a string (e.g., JSON)
        return System.Text.Json.JsonSerializer.Serialize(this);
    }
}
```


The `MessageSender`:

```csharp
public class MessageSender {
    public Task Send(string url, ISerializable payload, string? header = null) {
        var serializedData = payload.Serialize();
        // do your thing
        return Task.CompletedTask; 
    }
}
```

Now we add a proxy layer, something we go through just for the sake of sending the message:

```csharp
public class PlayerService {
    private readonly MessageSender _messageSender;

    public PlayerService(MessageSender messageSender) {
        _messageSender = messageSender;
    }

    public Task SendPlayer(Player player) {
        string url = "/player";
        return _messageSender.Send(url, player);
    }

    public Task SendPremiumPlayer(PremiumPlayer premiumPlayer) {
        string url = "/premium-player";
        string authenticationHeader = "yo-I-am-he!";
        return _messageSender.Send(url, premiumPlayer, authenticationHeader);
    }
}
```

This comes a lot closer to a nice separation of concerns. One other thing to notice is that 
I do not have to use interfaces. I just pass in the actual classes. The code is so simple that
I even have a hard time advocating for a lot of tests. I would however run large integration
and black box tests in a system like this.

## Should you really never use inheritance?

Inheritance is a contentious subject for many reasons, but there is one application of inheritance 
that I do wholeheartedly endorse: the inheritance of pure data classes. Let me elaborate.

Consider a scenario where many entities in your system need a unique identifier, a creation 
timestamp, or some other common set of properties. In these cases, it makes sense to have a base 
class like an Entity that represents the common attributes shared by multiple domain objects.

```csharp
public abstract class Entity {
    public Guid Id { get; private set; }
    public DateTime CreatedAt { get; private set; }

    public Entity() {
        Id = Guid.NewGuid();
        CreatedAt = DateTime.UtcNow;
    }
}
```

In this example, our Entity class has two properties: an identifier (`Id`) and a timestamp indicating 
when the entity was created (`CreatedAt`). Let’s take a look at our earlier `Player` class and see how 
it could inherit from this `Entity` class.

```csharp
public class Player : Entity {
    public string Name { get; set; }
    public int Score { get; set; }
}
```

This now means that every `Player` object will automatically have an `Id` and `CreatedAt` property without 
us having to define it explicitly in the `Player` class. And it’s not just `Player` - any other class in 
our system that needs these properties can simply inherit from Entity.

# Conclusion

While inheritance is inherently evil. Like all tools in the programmer's toolkit, it has its time and place.
The key *is* understanding when and how to use it effectively. For behavior-based functionality, composition, 
interfaces, and other patterns usually offer a more flexible and maintainable approach. But for pure data 
classes where there's a clear, shared set of attributes across multiple objects, inheritance can be a 
practical solution. Just be sure always to use it judiciously and remain mindful of its potential pitfalls.
