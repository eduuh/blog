---
title: 'Object Oriented Design'
date: 2021-02-08T07:41:06-07:00
draft: true
description: 'Reload the colemak Keyboard layout on my arch distributions and Remaping caps lock to function primary as Escape on short presses and Control when pressed with other keys'
categories: ['Productivity']
tags: ['design']
categories: ['design']
author: eduuh # author name
authorEmoji: 😎 # emoji for subtitle, summary meta data
authorImage: '/images/edd.jpg' # image path in the static folder
authorImageUrl: '' # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
---

### Object Oriented Design.

The idea beind object-oriented computing is that is make thinking about and discussing
programming similar to thinking about the real world. So to ask what's an object in a computer
program, **start by asking, what's an object in the real world?**. Example of real world
object could include:

1. A mug.
2. A cookie.
3. A television

All the above and what you can touch are actually **things**. What about two mugs? Are the two
mugs the same object? **No**, although they're similar mugs, they are not the same object.

Every object have characteristics, inherent properties that that describe its current state.
For example **a mug can be full, empty, or somewhere in between**. Filling one mug with coffee
does not mean all of the mugs in the world get filled. The current states of the mug being
full is independent of this other empty mug because they're are separate objects. But there's
more to a mug than whether it's empty or full. \*What about its size? Wait or color\*\* - Well,
most objects will have multiple attributes like whether it's full or empty are likely to
change over the mug's lifetime.

We can use the term **properties** to describe characteristics. Sure. **Attributes or
properties, characteristics, states, fields, variable** those are all related terms that
you'll often hear programmers use interchangeably. Their exact meaning may differ slightly
depending on the situation and specific context through languages for me , I'll stick with the
term attributes. But I still prefer **properties\***. So it's easy to think of the mug asn an
object since it's a **single thing**. But what about something complex like a cellphone which
has hundreds of components and electronic parts?. Well , being an object has nothing to do
with complexity. And Is's possible for one object to contain other objects.

I can talk about your phone as a thing in the real worl so I cah think of it as a computing
objects with attributes like **color, size, and weight**. In addition to that your cellphone
has behaviours. **It can ring, and it can send text messages**. But the mug can't call ring or
text. So those behaviours are specific to my cellphone object. I would not try to use my
cellphone to hold coffee. **Identity, attributes and behaviours**. Thos are the three things
that describe object in an **object-oriented programmin languages**. Every object in a
computer progra are self-contained so it has its own identity separate from other objects, Its
own attributes to describe its current state and its own behaviours, the things it can do.

The example we have used **mug , cookie, television**, they're all things that we can see and
touch. But software often describe things that don't have a **tangible representation**. So
can object in a program represent more than physical things?. **Good point**. In programming ,
the idea of an object extends further to describe non-tangible things too. Like a **date**,
**a timer**, or **a bank account**. You can't touch and holp a back account in real like but
it's still a well-defined idea that meats the definition of an object. It has and
**identity**, one bank account is separate from another bank account**. It hass attributse
like an account number and a balance. And it has behaviours, you can **deposit to a bank
account and withdraw from it**. One of the challenge of object-oriented design is fuguring out
if something in your application should be represented as an object. That's easy when your
application needs something like a **mug**, an object? )well, just ask yourself, is it a
**noun**?. Nouns aren't just physical things, but also **people, places, and ideas or
concepts\*\*.

As a simple test, if you were talking about it in a conversation could you put the word
**the** in front of it? **The mug**, **The person**, **The document**. Sure, but also, **the
back account**, **the timer**, **the event**. Those works too, those could be objects.
However, you would not say **the ringing** or **the texting**. Those are verbs that describe
the behaviours or an object, no the object itself. We need to identify those verbs as well
because a program without any behaviours isn't very program, we tend to focus on the **nouns**
first.

## Classes

Objects don't just magically appear in a program. We have to create them, and we do so from
**classes**. A class is the detailed description, the definition, the template of what an
object will be but isn't the object itself. Once we've written a class and defined it, we can
use it to create as many objects on that class as we want.

Different classe let us create different types of objects. Classes are like our collection of
**cookie cutters**. A particular cookie cutter could be used to create circular cookies. It
defines how the cookie will look. But the cutter itself is not a cookie. And we only need this
one cutter to create a tray full of round cookies, each a separate object ready for the oven.
**Remember that the class always comes first**. You can't make round cookies without the
circular cutter\*\*.

Now, there are three components that make up a class in **object-oriented programming**. Each
class has a name, literally what is it?. For example, **a round cookie**. A class can have
**attributes to describe that object** such as **weight, color and whether or no the cookie
has icing**. And it can have behaviours, **then things that objects can do** like **decorate**
or **consume**.

You might encounter somewhat interchangeable, terms for these words. Instead o name, you might
see type, because each class creates objects of a particular type. Attributes reffers to
properties as seen earlier or more generically as **data**. And behaviours are also referred
to as operations. Whe we actually write those behaviours as code, they're typically called **a
method**.

**The textbook definition of a method** is a block of code or procedure that can be called to perform some action, and it may return a value or code that performs some action and returns a value. \*What's the difference between methods and functions?\*\* Well, methods are basically functions with the key differences that methods are definend as part of the class. So they're included in any object in that class. And, since methods exist as part fo an object, they can only access data that is know to that object.

The concepts of **classes and objects** can be confusing at first. So lets look at an example
using the **round cookie cutter**. You will often see a diagram that looks something like this
to sketch out a class, with the **name** on top, **attributes** in the middle, and behaviours
on the bottom. And we'll look at these diagrams in details later.Although the class says that
each round cookie will have a **size**, **a color** and **possibly icing**, It doesn't specify
the actual values for **size, color, and icing**. It's just providing a definition. But after
defining the class, I can create objets based on it through a process called
**instantiation**. And it's called that because each object has its own identity, independent
from other objects. **Its own Data**. The class says that each round cookie has **a color**,
but individual objects say that my cookie is red and Olivia's cookie, which doesn't have
icing, **is brown**. An if I haven't defined the class myself, someone else needs to have
already defined it form me. Fortunately, most **object-orented languages** comes with a
collection of predifined classes. So you can start creating object right away. Basic usuful
things like **strings**, **dates** and **arrays** are often include as provides classes, so
you don't have to begin each progrm by defining the same common classes over and over again.

These classes are defined and then gathered together into frameworks or libraries. In Java/C#
you have the **Java Class Library** with about 6000 classes available to you. And the **.Net
Framework** for C# and VB.net have ever more than that.

### Abstraction

There are four fundamental idea in object-orentend programing to keep in mind when creating
classes. And they have the wonderful names **Abstraction, Polymorphism, Inheritance and
Encapsulation**. And one way I like to remember these terms is with a good acronym
**A-P-I-E**, A pie! Now, these four words can sound intimidating, but you probably do most
of them already in daily thought and coversation even if you don't user thes fancy academic
terms to describe them.

The first one **Abstraction**. If I say, "person" you know what I mean. I didn't specify who I
was thinking of. I didn't even dsecribe the persion. **Male or Female**, **Tall or Short**.
You might have imagined someone in particular. That's OK. But I don't have to get that
specific because you undestand the idea of a Person. You've encountered enoguh real people to
abstract the idea of what a person means.

**Abstraction** means we focus on the essential qualities of something rathar than one
specific example. By using abstraction, we automatically discard what's unimportant or doen't
have flavor or icing. Those are things that makes If I was describing a cookie, but completely
separate from any specific instance. It's what we do all of the time in coversatiion.

And it's at the heart of Object-oriented programming because it's what we're doing when we
make a class essential qualities of the Idea I care about and I write one persion class.I'll
focuss on the essential quailities of the idea I care about and I write one person class. I'll
focus on the each person has a **name**, **a height** and a **gender**. And because I always
want to discard what's unimportant, it's never just , what dose a person class look like?
**It's about what should a person class look like for this application?**.

So it might be true that every person has a height, but if my application doesn't care about
that piece of information, then I don't need that attributes defined in my class.

#### Encapsulation

The idea of encapusulatio is about containing the elements of an object. Not just to keep them
together, but also protect them. Ow! We bundle an objects's attributes or data along with the
methods that operate on that data within the same unit or the same class. One reason for doing
that is to restrict access to some of the object's components. One reason for doing that is to **restrict access to some of the object's components.** - Like how you're restricting me from taking a cookie? - No, you can have a cookie, but you'll have to use my method to get to it. **My cookie jar class has an attribute that represents the number of cookies in the jar**. When I create an instance of my cookie jar, I don't want you or any other part of my application to be able to reach in and directly change the number of cookies. _Oh, come on. You can trust me._ It's not only about trust. If I let you directly change things, like the number, **you might unknowingly change it to something invalid, like a negative one.** That value doesn't make sense for the number of cookies and might cause my program to crash. Another reason to restrict access is that, well, maybe I want to limit the number of cookies you can have.

So what do I do to get a **cookie**? Well, to control access to that attribute, I'll hide it so it's only accessible from inside the cookie jar object itself. Then, I'll add a method called 'request cookie' that can be accessed from other parts of the application. When you use the 'request cookie' method, you'll get a cookie, and the method will modify the number of cookies attribute accordingly.

One of the **principles of encapsulation** is that an object should not make anything about itself available except what is absolutely necessary for other parts of the application to work. This is a concept referred to as 'black boxing'. I'm closing off the inner workings of the cookie jar and only revealing specific inputs and outputs. You don't need to know how the 'request cookie' method is implemented under the hood to use it.

But I'm an engineer. I need to know how everything works. **Do you know how your phone works?** - Well, sure. I just punch the number into the keypad and it makes a call. - Do you know how it works internally? - Well, you see- - It doesn't matter. If you get a new cellphone, the inner workings can be completely different. But it has the same buttons to press. So you can still use it. One of the main benefits with object orientation is that it allows us to more safely change the way the object works without changing the rest of the application.

I don't have to worry about breaking the other 20 parts of my application that have been using the 'request cookie' method to grab cookies. I'll just need to modify the 'request cookie' method and the class to handle the change. Well, if you're the person writing these classes, why would you want to hide your own code? Why keep secrets from yourself? - It's not about being secretive. It's about reducing dependencies between different parts of the application. The change in one place won't cause a domino effect and require multiple changes elsewhere. - Then how much should you hide? - Well, different languages have different levels of support for hiding properties and methods. But the general rule is to encapsulate as much as possible.

#### Inheritance

When I need to create a new class it may not always be necessary to build it from scratch. If my program has an existing class that's similar to what I need, then I can use inheritance to base my new class on that existing one. Inheritance enables a new class to receive or inherit the attributes and methods of existing classes using the same implementation which is a great form of code reuse.

Let's say for example I want to model the characters present in a bakery. I might start by defining a class for customers, which has attributes for the **customer's name**, **phone number,** **email address,** and a **customer ID number**. Additionally I give that customer class a method to update their contact information, and a method to purchase items. The bakery also has employees so I create an employee class with attributes for the employee's name, phone number, email address, and employee ID number. The employee can update their contact information, get promoted, or retire. All of it's attributes and behavior's without having to write any extra code.

You'll also hear these described as the **parent class,** and the **child class**, which is typically used when there's only a single level of inheritance, or the base class and the derived class. Which better captures the concept of inheritance that's multiple levels deep. That said there's no limit to the number of child classes I can create based off of a single parent. If I later realize my shop needs another class for the courier that delivers packages, that's easy to add. I'll just create the courier as a subclass of person, and give it a unique method to deliver packages.

In addition to **benefiting from code reuse**, the great thing about inheritance is that if I make a change in a super class, it will automatically filter down and effect all of the subclasses. So when I realized I should have been keeping track of each person's email address all along, because it's the twenty first century, I only need to add that attribute to the person class, and then the customer, employee, and courier classes will all get the email attributes too. Changing code in one place is much easier then having to change it in three. Now a few languages like Python, and C++, allow you to inherit from more then one super class. Bringing in attributes and behaviors from multiple other classes. However, multiple inheritance can get confusing so it's much more common to see single inheritance where a subclass only inherits from one parent or superclass. Languages like Java, C#, Swift, and Ruby enforce single inheritance with classes and that's what we'll be using in this course.

#### Polymorphism

Our fourth and final **object-oriented concept** is polymorphism which is a complicated sounding word that simply means having many forms. There are multiple forms of polymorphism. One form, **called dynamic** or **run-time polymorphism**, allows us to access methods using the same interface on different types of objects that may implement those methods in different ways.

Think of a basic **coffee maker** as a class with a method to brew coffee. The input parameters for that brew method are a scoop of ground coffee beans and water. I wait a bit for it to brew and the output is a fresh cup of hot coffee. If prefer to use a different type of coffee maker. **A French press.** My French press also has a brew method with the exact same inputs and outputs as Baron's basic coffee maker. I input a scoop of ground coffee and some water.Then after a little while, I press down the plunger and the output is a fresh cup of hot coffee. Now, although these two coffee makers have the exact same type of inputs and outputs, the way that they brew is very different. My coffee maker uses a filter whereas Olivia's French press strains the coffee with a metal screen.

When it comes to actually implementing this type of polymorphism in code, there are several ways it could be done. The fancy FrenchPress could inherit all of the attributes and methods from my BasicCoffeeMaker. But then, it replaces the brew method it inherited from the BasicCoffeeMaker through a process called **overriding**. That allows the FrenchPress to redefine its own unique version of the brew method. Or perhaps both of these coffee makers inherit from the same abstract class with an abstract brew method.

Or they both agree to implement the same interface. **Inheritance, abstract classes, and interfaces** are all possible implementations of polymorphism.

**The benefit of dynamic polymorphism** here is that it enables me to use any form of coffee maker as long as it has a brew method that takes coffee grounds and water as inputs and returns a cup of coffee.

The other common form of polymorphism is called **static or compile-time polymorphism.** And it uses a feature of many object-oriented programming languages called method overloading, not to be confused with method overriding. Overloading allows you to implement multiple methods within a class that have the same name, but a different set of input parameters. If I give the brew method of the French press, coffee and water as input arguments, I'll get back a cup of coffee. But if I change the type of inputs, from coffee and water to tea leaves and water, that's a different set of parameters so the French press will execute a different version of the brew method that gives me back a cup of hot tea. Brew with coffee and water and brew with tea and water are two different methods with two different signatures.And the FrenchPress will automatically execute the appropriate one depending on what you give it. In most cases, those overloaded methods will provide different, but very similar functionality. So those are the different forms of polymorphism. Defining different classes that can be used with the same interface. - Or overloading a method from the same class that can take different sets of parameters.

### Analysis , design and programming

When you see the words object-oriented, there's usually another word right beside
it, object oriented programing , object oriented design, or object oriented
analysis. These are all connected and refer to the idea that to develop any piece
of sotware. You will need three things.

1. Understand your problem.
2. Plan your solutions and finally build it, analysis , design and programming.

**Analysis and design** are usually talked about together because they encompass
everything that should happen before you write a single line of code. Analysis
answers the question what do you need to do?. **What the problem you're trying to
solve?.**

The design process aims to produce some deliverables, the conceptual design that
you or maybe a separate team of programmers, can take and use to build a
solution.

**Conceptual is the key word here**. We are not writing any code.

What about drawing diagrams? Sure.
Sketches on a whiteboard? Those are great.
Written description? but no code.

The methodology used to come up with the **conceptual design**.

1. Start by gathering requirements o figure out what our application needs to do.
   - Flesh out the problem you're trying to solve.
2. Describe the application. Build a narrative in plain, conversation language
   for how the people will use it.
3. Identifying he most important objects, which is the starting point for
   identifying actual classes.
   - once those objects have been idetified, formally describe the interactions
     between them, undestanding each object's responsibilities.
4. Create a class diagram, which serves as the main output from the five-step
   process.
   - The class diagram is a visual representation of the classes in the
     application, and creating it is where the object oriented principles like
     inheritance and polymorphism really came into play.

#### UML Diagram

I will be using a few common diagramming techniques for drawing classes and their
interactions. _It's a graphical nottation for drawing diagram to visualize object
oriented systems._ The class diagram gives a very simple graphical representation
of a class. It has three sections;

1. The name of the class.
2. The attributes of fields.
3. The behaviors or methods.

It allows someone to quickly sketch out an idea that's readable and
undertandable regaradless of which programming language. UML includes over a
dozen diffreerent types of structural and behavioral diagrams. You should never
be asking the question of where can i write the sequence diagrams? Instead, you
should simply realize that one would come in handy when thinking about or
discussing a situation that isn't clear. UML is not the goal here and knowing
more UML will not necessarily make your a better object oriented developer. In
fact, knowing a little UML may actually be more useful than knowing a lot of UML
because knowing a lot of UML can lead o an over emphasis on the diagrams
themselves. These diagrams should be a quick, useful **communication tools**. A
support system for your brain, not the other way around.

I'm a big fan of drawing on paper or a whiteboard at least in the initial stages
of a project. With that said.There are a lot of tools to choose from her with
commercial and open soruch option across every platform. They capability ranges
from simple drawing tools to help you build diagram.

### Functional Requirements

The first step to any design process is to gather your requirements. Figure out
what your application or product needs to do.

What's the problem you're trying to solve?
Why are you building the application in the first place?
At the core what are the application's functional requirements?
What dose it need to do?
What are the necessarily features and capabilities?

In addition to those, there may be also **non-functional** requirements that
place constraints on how the application should function. For example **an
application that handles banking could be peformance requirements such as
response time** or how many user can be supported simultaneously.

Support requirements, if there's and issue with the application at two A.M on a
sunday moring, what needs to happen? And Security can be considered as either a
**non-functional or functional requrement depending on the applcation**
