---
title: "Jsupandgoing"
date: 2020-02-08T08:13:40+03:00
draft: true
linktitle: "Javascript dipe dive"
title: "Javascript deep Dive , Understanding the basic concepts"

series: ["javascript"]

author: eduuh # author name
authorEmoji: 🤖 # emoji for subtitle, summary meta data
authorImage: "/images/edd.jpg" # image path in the static folder
authorImageUrl: "" # your image url. We use `authorImageUrl` first. If not set, we use `authorImage`.
authorDesc: Selftaught Web and Mobile Developer # author description

---

## Javascript deep dive tutorial

This note are inspired by `KYLE SIMPSON` javascrip book series. I like how the ideas in the book are shared.
I have being doing c# for the backend and to complete my journey for becoming a `full stack developer`.
I needed to do alot of javascript, so immediately i started using typescript for my web development and i would say the experience with typescript is supper great. I was reading up on 'react' and realized the documentation is not in `typescript`, and decided to do some research and answer the question

`when should i use typescript?` read the [Alex blog](https://www.freecodecamp.org/news/when-should-i-use-typescript-311cb5fe801b) about the topic.

I wount go into the detail of when i should use typescript. That could be a subject for another post. Being a student i have alot time to learn
so i decide to at least spend some time learning javascript in a deep way to try and understand commonly misunderstood concepts. Hope you code along me when performing this examples.

### Up and Going

In this deep dive you will learn about:

1. Webstandards
2. Sematic markup
3. Well commented code

The code isn't just your Job anymore, its your craft

we will be intrested with javascript `syntax` and `understanding the terminology`. You already know javascript to be the foundation of `interactive expriences on the web`. I have come to understand that javascript is one of the easiest language to get started with, i had let the typescript advertisement get to me. I dont say typescript is not awesome , but it is transpiled to javascript eventually.
The trouble with `javascript` is that is can be used without understanding how the internal works, the understanding of language is never attained.

#### We get Answers of How and why

The language behave the way it does but before that let me promote the language first

- Javascript is awesome.
- Javascript is easy to learn and much harder to learn completely

When we developers encounters confusion we usually tend to blame the language instead of their lack of understanding.

#### when i say javascript what to i mean?

Yes! a programming language with a specific `syntax` used to write the `source code`.

1. Syntax -> the rule for valid format and combination of instructions.
2. Source code -> A set of instructions to tell the computer what task to perform.

#### Statements

A group of words , numbers and operators that performs a specific task . Example

```Js
a = b * 3;

```

1. 3 -> literal value
2. a & b are variables (sybolic placeholders for the values themselves.

Most Javascript statements ends with a semicolon ; at the end.

Programs are usually just a collection of many such statements which together describe all the steps.

#### Expressions

An expression is any reference to a variable or value , or a set of variables and values combined with operators.

let take the above example

```JS
   a = b *3;
```

The above statement contains four expressions in it.

1. 2 -> literal value
2. b -. variable expression (used to retrieve its current value
3. b \* 3 -> arithmetic expression which in this case its (multiplication)
4. a = b _ 3 -> assignment oxpressions (assings the result of b _ 3 to a )

#### Executing a Program

Executiong is also refered to as `running the program`.

statement like `a = b * 3` are good for developers to read and write code but not very uselful to the computer. A special utility on the computer can
either be an `interpreter or a compiler` is used to translate the code you write into command that computer can understand..

Translation is done ahead of time is called `compiling code` so whe the program run later what is runnind is actually the compiled source code.
Javascript is interpreted because your Js code is processed each time it's runs. This is not completely accurate since the JS engine actually compiles
programm on the fly and then immediately runs the compied code.

#### Output

```JS
  console.log( a );
  // using the dom api
  alert( a );
```

#### Input

Receivind information from the users most common is to use html elememt like a text boxes to the user that she can type into and then JS to read those
values.

```JS

 age = prompt ( 'please tell me your age' );

```

#### Operators

| Operators                 | Examples of Operators                                                                  |
| ------------------------- | -------------------------------------------------------------------------------------- |
| 1. Mathematical operators | + , - , / , \*                                                                         |
| 2. Assignement operators  | a = 3                                                                                  |
| 3. Compound assignment    | += , -= , and /= ie a +=2                                                              |
| 4. Increment /decrement   | ++ (increment ) , --(decrement ) a++                                                   |
| 5. Equality operators     | ==(loose equals) , ==== (strict equals) != (loose not equals) , !== (strict not equal) |
| 6. Comparison operators   | < (less than ) , > (greater than) , <=(less than or loose equals )                     |
| 7. Logical operators      | & (and) ,                                                                              |  | (or) |

#### Values and Types

| Type    | values examples        |
| ------- | ---------------------- |
| numbers | 45, 4, 35, 33, 555.45, |
| strings | "Edwin" , 'Muraya'     |
| boolean | true , false           |

Combination of the Types and Values form `arrays and Objects`.

#### Coersion Between types.

This can be done explictly or implicit.

#### Code comments

The choices you make about how to write program that works correctly but programs that make sense when examined.
Code comments are bits of text in your program that inserted purely explains things to a human being reading your code.

The interpreter/ compiler will ingnore these comments.
A general guideline to writing comments in the code.

1. code without comments is suboptimal
2. Too many comments is probably a sign of poorly written code.
3. Comment should explain why not what .

types of comments

```Js

// single line comments

/* multi line
     comments
          */

```

#### Variables (containers)

Holds a specific type of a value. JS uses dynamic typing meaning variables can holds value of any type without any type enforment.

```JS
  var amount = 99.99;
  amount = amount * 3;
  console.log( amount );

  amount = "$" + String( amount );
  console.log( amount );

```

Amount holds a running value that changes ove the course of the program. Primary purpose of the variables is to manage the state of the
application. (program state management).

`const` -> useful just like variables with unchanged values except that constant also prevent accidentally changing value initially set.

#### Block

A group or a series of statement together which we often call a block. {}

```JS
{
  amount = amount * 2;
  console.log( amount );
}
```

Blocks are usualyy attached to some other control statements such as an if statement.

```JS
var amount = 99.99;
if( amount > 10 ){
   amount = amount * 2;
   console.log( amount );
   }

```

#### Conditionals

```JS
 var bank_balance = 302.12;
 var amount = 99.99;
 if( amount < bank_balance){
    console.log(' I want to bu this ");
    }
    else {
     console.log( 'No thanks' );
     }

```

Other conditionals include the Switch statement.

#### Loops

Repeats a set of conditions until a certain condition fails, repeats only when condition holds.

A loop includes a condition check as wells as a bloc of statements and each time a loop block executs , it called a `interation` .

example

```Javascript
 // while loop code
 while( numofCustomer > 0) {
    console.log('how may i help you?');
    numofCustomer -=1;
    }
 // do loop code
 do{
   console.log( 'how may i help you');
   numberofCustomer = numberofCustomer - 1;
   } while(numberofCustomer > 0);
```

If condition is false , a while loop will not run but a do while loop will run just for the first time.

The condition is tested on each iteration and you could use `break` statement to stop a loop.

Example of another loop is the For loop.

```Js
for( var i = 0; i < 9; i=i+1) {
   console.log( i );
   }
```

the loop contains the following.

1. initialization clause var i = 0
2. conditional test clause i<9
3. update clause i=i + 1O

### Transpiling

There's no way to polyfill new syntax that been added to the language. The new syntax would throw an error in the old JS engine os recognisezed/invalid.
The better option is to use a tool that convert your newer code into older equivalents.A process called "transpiling" a term for transforming + compiling.

Your source code is authored in the new syntax form, but what is deploy to the browser is the transpiled code in old syntax form.
The transpiler is inserted to your buil process, similar to your code linter or your minifier. Then why would you write new syntax only to have it
transpiled away to older code- why not just write the older code directly?

> some reasons for this are

1. The new syntax added to language is designed to make your code more readable and maintainable. You would prefer writing new syntax not only for
   yourselve but also for your development team.
2. If you transpile only for older browsers, but serve the new syntax to the newest browsers, you get to take advantage of browser perfomance optimization
   with the new syntax. This also lets browser makes have more real-world code to test their implementations and optimizations on.
3. New syntax allows it to be tested more robustly in the real world , which provides earlier feedback to the Javascript committee.

```Javascript
// ES6  code
function foo( a = 2 ){
  console.log( a );
  }

foo( ); // prints 2
foo(5); //prints 5

// transpiled to the code below
function foo() {
  var a = arguments[0] !==(void 0) ? arguments[0] : 2;
  console.log( a );
}

```

As you see it checks to see if the arguments[0] value is void 0 (aka undefined) and if so provides the 2 default value; otherwise, it assigns whatever was
passed. Transpilers should now be thought of as a standar part of the JS developmend ecosystem and process. JS is going to continue to evolve, much more
quickly than before, so every few months new syntax and new features will be added.

> Examples of transpilers for you to choose from. Here are good ones to try.

1. BABEl
   - Transpiles ES6+ into ES5
2. Traceur
   - Transpiles ES6 , ES7 and beyound into ES5

#### Non-JavaScript

The reality of this language is written to run in and interact with environments like browsers. A good chunk of the stuff that you write in your code is,
strictly speaking, not directly controlled by Javascript. That probably sounds a little strange. A good example is the Dom Api for example.

```Js
 var el = document.getElementByID('foo');

```

The `document` varible exist as a `global variable` when your code is running in the browser. It's not provided by the Js engine, nor is
it particulary controlled by the Javascript specification. It takes the form of something that looks an awful lot like a normal JS object, but it's not really exactly that. It's a special object, often called a `host object`.

The getElementByID(..) method on document looks like a normal JS function, but it's just a thinly exposed interface to built-in method provided by the DOM
from your browser. In newer browser the layer my be in JS but in older browser the layer is in `c/c++`.

Another example could be the input/output (I/O).
The `alert()` pops us a message box in the user's browser window. alert() is provided to your JS program by the browser, not by the JS engine itself.
The call you make sends the message to the browser internals and it handles drawind and displayind the message box.

The same goes to `console.log()` your browser provides such mechanisms and hooks them up to the developers tools.

#### Review

The first step to learning Js flavor of programming is to get a basic understanding ot its core mechanisms like :

1.  values
2.  types
3.  function
4.  closure
5.  this
6.  prototypes.

Serious developers in other languages expect to put the effort to learn most of all of the language(s) they primarily write in, but JS developers
seem to stant out from the crowd in the sence of typically not learning very much of the language. This is not a good thing, and it's not something
we should continue to allow to be the norm.

At this moment, am going to ask you guys.

Are you up for the challenge, or do you want to learn the most minimum of js to get you started in code?

Here is my answer, i would love to invest my time know to learn the internal of js and be able to answer the why question in code.

So let go into it.

we are going to go in this order and what we will cover in each step.

1. Scope and Closures

   - how scoping of variables really works in javascript.
   - common misconceptions that js is an 'interpreted language' and therefore not compiled.
   - Deeper understanding of the compiler approach, how to find and deal with variables and functions declarations.
   - Scope management (hoisting)
   - lexical scope and closure as the main important concept of js

2. this and Object prototypes.

   - Understant the this keyword and common mistakes.
   - Prototype behaviour pattern, behaviour delegation

3. type & Grammar

   - Type coersion. implicit coercion and explicit coersion.
   - What part of coeasion make complete sense if given the time to learn. do you want to keep following what the crowds say or are you willing to
     set all the assumptions aside and look at coersion with a fresh perspective.

4. Async & Performance
   - Asynchrony programming in not only critical to the performance of our applications , it's increasingly becoming the critical factor in writabiliy
     and maintainability.
   - callbacks
   - inversion of control.
   - promises and generators.
   - Parallelism with Web workers techniques.
   - Performance optimization.

5) ES6 & Beyond
   - Destructuring
   - default paremeter values,
   - symbols
   - concise methods
   - Computed properties
   - arrow functions
   - block scoping
   - promises
   - generators
   - iterators
   - Modules
   - proxies
   - weakmaps
