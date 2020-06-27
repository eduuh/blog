## Typescript  Workshop

### Getting Started with Typescript.

 Typescript compiles into javascript. javascript is what you are actually going to execute (either in the browser or server). You are going to need the following.

     * Typescript compiler.
     * A typescript editor.

  Typescript = JavaScript + A Type system 

  We are going  a vast amount of time learning about **A type system**.

#### The goal of the type system

1. Helps us catch erros during development.
2. Uses type annotation to analyze our code.
3. Only active during development.
4. Doesn't provides any performance optimization.

### What happens when we write Typescript.

1. You and I write **javascript code** JavaScript with types annotations.
2. The source code is fed into the **Typscript compiler**
3. The typescript compiler emmits **Plain Old Javascript**
5. The plain old Js is **executed on the browser.**

#### Summary.

* Writing Typscript is the same as writing JavaScript with some 'extra documentation'.
* Typscript has no effect on how our code gets executed by the browser or Node.
* It is best to think of typescript as being like a friend sitting behind you while you are coding.

Writing typescripting is like writing typescript together with a pair programmer.

### Environment Setup



#### Installing the TypScript compiler.

Since we are learning typescript, let make use of the nightly version.

    npm install -g typescript@next ts-node

If you get a "EACCESS" error, add sudo infront of the command.

### Why Typescript

  * provides an optional type system for javascript.
  * Provides planned features from future javascript editions to current javascript engines

### The TypeScript type system.

You might be wondering "Why add types to JavaScript?"

Types have proven ability to enhance code quality and understandability. Large teams (Google, Microsoft, Facebook) have continually arrived at this conclusion.

* Types increase your agility when doing refactoring . It's better for the compiler to catch errors that to have things fail at runtime.
* Types are one of the best form of documentation you can have. This function signature is a theorem and the function body is the proof.

However, types have a way of being unnecessarily ceremonious.


### Your JavaScript is TypeScript.

Typescript provides compiler time type safety for your javascript code. This is no surprice given its name. The great thing is that the typse are completely optional. Your javascript code .js file can be renamed to ts. file and typescript will still givi you back valid .js equivalent. 

### Types can be Implicit(Not necessary specified).

TypeScript will try to infer as much of the type information as it can in order to give you type safety with miniamal cost of productivity during code development.

### Types can be explicit (specified).

TypeScript will infer as much as it can safely. However, you can use annotations to:

1. Help along the compiler, and more importatly document stuff for the next developre who has to read your code (that might be future you!).
2. Enforce that what the compiler sees, is what your thought is should see. That is your understanding of the code matches an algorithmic analysis of the code.
 
### Types errors do not prevent Javascript emit.

This means that you can icrementally upgrade your javascript to Typscript. This is very different from how many other language compiler work and yet another reason to move to TypeScript.

### Future Javascript => Now

Typescript provides a number of features that are planned in ES6 from current Javascript enginges(that only support ES5).

### Your Javascript is Typescript

There were (and wiill continue to be ) a lot of competitor is some syntax to javascript compilers. typscript is different from them in that Your javascript is **typescript**.

However , it does mean that you need to learn Javascript (the good news is you **only** need to learn javascript.) Typescript is just standardizing all the way you provide good documentation on js.

TypeScript is just Javascript with docs.

JSNEXT is open to interpretation - not everything proposed for the next version of JS actually makes it to browsers.

Typscript only add support for proposals once they reach **stage 3**.

### You Still need to learn javascript.

That said Typescript is very pragramtic about the fact that you do write javascript so there are some things about javascript that you still need to know in order to not be caught off-guard. Let's discuss them next.


### Javascript concept to Note.

#### 1. Equality.

One thing to be careful about in Javascript is the difference between ==  and ===. As javascript tries to be resilient against programing errors == tries to do type coercion between two variables e.g. converts a string to a number so that you can compare with a number.

```javascript
console.log(5 == "5"); // true , TS Error
console.log(5=== "5");  // false , TS Error
```
The choices Javascript makes are not always ideal. For example, in the below example the first statement is false because "" and "0" are both strings and are clearly not equal. However, in the second case both 0 and the empty string ("") are falsy (i.e behave like **false**).


```javascript
console.log("" == "0");
console.log(0 == "");

console.log("" === "0");
console.log(0 === "");
```
Note that **string==number** and **string === number** are both compile time errors inTypescript, so you don't normally need to worry about this.

similar to == vs. ===, there is != vs !===

**So proTip: Always use === and !== except for null checks, which we cover**.

### Structural Equality.

If you want to compare two objects for structural equality == / === are not sufficient.

```javascript
console.log({a:123} == {a:123}) //false
console.log({a:123} === {a:123}) //false
```
To do such checks use the **deep-equal** npm package e.g.


```javascript
import * as deepEqual from "deep-equal";
console.log(deepEqual({a:123} == {a:123}));
 ```
 However, quite commonly you don't need deep checks and all you really need to check by some **id** e.g.

```javascript
type IdDisplay = {
  id: string,
  display: string
}
const list: IdDisplay[] = [
{
  id: 'foo',
  display: 'Foo Select'
},
{
  id: 'bar',
  display: 'Bar select'
}
]
const fooIndex = list.map(i => i.id).indexOf('foo');
console.log(fooIndex);
```

### References.

Beyond literals, any Object in Javascript (including functions, array, regexp) are references. This means the following.

#### Mutations are across all references.

```javascript
var foo = {};
var bar = foo; // bar is a reference
var baz = {};  // baz is a *new object* distinct from 'foo'


console.log(foo === bar);
console.log(foo === baz);
``` 
### Null and Undefined.

Javascript (and extension Typscript) has two bottom types: **null and undefined**. They are intended to mean different things.

  * Something hasn't been initialized: **undefined**.
  * Something is currently unavailable. **null**.

### checking for either

Fact is you will need to deal with botn. Intrestingly in Javascript with == , **null** and **undefined** are only equal to  each.

```javascript
console.log(null == null);
console.log(undefined == undefined);
console.log(null == undefined);


//You don't have to worry about falsy values making through this check.
console.log(0 == undefined);
console.log('' == undefined);
console.log(false == undefined);
```
Recommend **==null** to check for both **undefined** or **null**. You generally don't want to make a distinction between the two.

```javascript
function foo(arg: string | null | undefined) {
  if (arg != null){
    // arg must be a string as '!=' rules out both nul and undefined
    }}
```
> You could also do **'==', undefined** but == null is more coventional/shorter.

One exception root level **undefined** values which we discuss next.

#### Checking for root level undefined.

Remember how I said you should use **==null**. Of course you do (cause I just said ^). Don't use if for root level things. In strict mode if you use **foo and foo** is undefined you get a **ReferenceError** exception and the whole call stack unwinds.

  > you should use strict mode.. and in fact the TS compiler will insert it for you if you use modules.. more on those later >

So to check of a variable is defined or not at a **global** level you normally use **typeof :*

```Javascript
if (typeof somglobal !== 'undefined') {
  // someglobal is now safe to use.
  }
```

### Limit explict use of Undefined

Because Typescript gives you the opportunity to document your structure separately from the value instead of stuff like.

```Javascript
function foo(){
  //if something
  return {a:1, b:2};
  // else
  return {a:1, b:undefined}
  }
```
you should use a type annotations.

```Javascript
function foo():{a:number, b?:number}{
  //if something
  return {a:1, b:2};
  //else
  return {a:1};
  }
```

### Node Style callbacks

Node style callbacks functions (e.g (err, somethingElse)=> {/*something*/}) are generally called with *err* set to null if there isn't an error You generally just use a truthy check for this anyways:

```javascript
fs.readFile('someFile', 'utf8', (err,data) ==> {
  if(err){
    }
    else {
    }
   });
```
When creating your own APIs it's okay to use *null* in this case for consistency. In all sincerity for your own APIs you should look at promise, n that case you actually don't need to bother with obsent error values (you handle them with .them ) vs .catch..


### Don't use undefined as a means of denoting validity.

For example an awful functions like this:

```Javascript
functions toInt(str: string){
  return str? parseInt(str): undefined;
  }
```

Can be much better written

```javascript
functions toInt(str: string): {varlid: booleam, int?: number}{
  const int = parseInt(str);
  if(isNaN(int)) {
    return {valid: false};
    }
    else {
      return {valid: true, int};
      }
  }
```
### JSON and serialization.

The json standard has supported for encoding *null* but not *undefined*. When JSON -encoding an object with an attribute that *null.*, the attribute will be included with its null value, whereas an attribut with an *undefined*.

```javascript
JSON.stringify({willStay: null, willBeGone: undefined});
```
As a result, JSON-based databases may support null values but not undefined values. Since attributes set to *null** aer encoded, you can transmit the intent to clear an attribute by setting its value to **null** before encoding and transmitting the object to a remote store.

### Final thoughts.

TypeScript team doesn't use null: TypeScript coding guidelines. `Douglas Crokford` think `null` is a bad idea and we should all just use `undefined`.

However, NodeJS style code bases uses *null* for Error arguments as standard as it denotes *something is currently unavailable*. I personally don't care to distinguish between the two as most projects use libraries with differing opinions and just rule out both with *==null*.

### this.

Any access to *this* keyword within a functions is controlled by how the function is actually called. It is commonly referred to the `calling context.`.

Here is an example.

```javascript
functions foo(){
  console.log(this);
  }
  foo();
  let bar = {
    foo
  }
  bar.foo();
```
So be mindful of your usage of this. if you want to disconnect *this* in a class from the calling context use an arrow functions.

### Closure.

The best thing that javascript ever got was closure. A function in javascript has access to any variable defined in the outer scope. closure are best explained with examples.


```javascript
function outerFunctions(arg) {
  var variableInOuterFunction = arg;

  function bar(){
  console.log(variableInOuterFunction);
  }
  bar();
}

outerFunctions('hello closure');
```
#### Reason why it's awesome.

```Javascript
function createCounter() {
  let val = 0;
  return {
    increment() { val++},
    getVal() { return val}
  }
}

let counter = createCounter();
counter.increment();
console.log(counter.getVal());
counter.increment();

console.log(counter.getVal()); 
``` 

### Number
Here are a few critical pieces of information about numbers in Javascript that you soud be awae of .

#### Core Type.

JavaScript has only one number type. It is double precision 64-bits Number.

#### Decimals

console.log(.1 + 2);

#### Interger
The integer limits represent by the built in number type are *Number.MAX_SAFE_INTEGER* and *Number.MIN_SAFE_INTEGER*

### big.js

Whenever you use math of financial calculations (e.g GST calculation, money with cents, additions) use a library like *big.js* which is designed for.
   * Perfect decimal math
   * Safe out of bound interger values.

```javascript
import { Big } from 'big.js';

export const foo = new Big('111.1111111111111111111111');
export const bar = foo.plus(new Big('0.99999999999999999292929'));

const x:number = Number(bar.toString());
```

>Note: Do not use this library for math used for UI/performance intensive purpose e.g charts, canvas drawing

### NaN

When some number calculation is not representable by a valid number. Javascript returns a special nan value. A classic example is imaginary numbers;

```javascript
console.log(Math.sqrt(-1));
```
note: equality checks don't work on nan values. Use Number.isNaN instead.
 
```javascript
console.log(Number.MAX_VALUE);
console.log(-Number.MAX_VALUE)

// values outside of range where precision isn't changed
console.log(Number.MAX_VALUE + 1 == Number.MAX_VALUE);
console.log(-Number.MAX_VALUE - 1 == -Number.MAX_VALUE); 

// values outside range wher precision is changed resolve to special values.

console.log(Number.MAX_VALUE + 10*1000); // Infinity
console.log(-Number.MAX_VALUE - 10**1000); // - Infinity
// special infinity value

console.log(1/0);   // infinity
console.log(-1/0);  // -infinity

console.log(Number.POSITIVE_INFINITY === Infinity);
console.log(Number.NEGATIVE_INFINITY === -Infinity );

console.log(Infinity > 1);
console.log(-Infinity < -1);
```
### Infinitesimal

The smallest not-zero value representable in Number is available as a static *Number.MIN_VALUE*

  console.log(Number.MIN_VALUE);

Values smaller that *MIN_VALUE* ("underflow values") are converted to 0.

  console.log(Number.MIN_VALUE / 10) //0 

### Truthy

Javascript has a concept of `truthy` things that evaluate like true would in certain position (e.g if condition and the boolean && || operator). The following things are truthin.

```javascript
if (123) { // will be treated like 'true'
  console.log('any number other than 0 is truthy');
}
```

Something that isn't truthy is called falsy

Here's handy table for your reference.

Variable Types |  When it is falsy   | When it is truthy   |
---------------|--------------------|---------------------|
boolean | false  | true  |
string |  ''(empty string) | any other string |
number | always           | never            |
undefined | always | never |
{}, []  | never | always  |

## Being explicit.
> The !! pattern
Quite commonly it help to be explicit that the intent is to treat the value as a boolean and convert it into a *true boolean*  true | false. You can easily convert value to a true boolean by prefixing it with !! e.g !!foo.

It is common to use this pattern in lots of places e.g

```javascript
const hasName = !!name;

const someObj = {
  hasName: !!name
}

{!!someName && <div>{someName}</div>}
```

###  Future Javascript : Now

One of the main selling poing of TypeScript is that it allows you to use a bunch of features from ES6 and beyond in current (ES3 and ES5 level) javascript engines(like current browser and Node.js)

### Classes.

The reason why it's important to have classes in *Javascript* as a first class item is that. 
1. classes offer a useful structure abstraction.
2. Provides a consistent way to developers to use classes instead of every framework (emberjs, reactjs etc) cominp up with their own version.
3. Object Oriented Developer already understanding classes.

```javascript
class Point {
  x: number;
  y: number;

  constructor(x:number, y:number){
    this.x=x;
    this.y=y;
  }
  add(point: Point){
    return new Point(this.x + point.x, this.y + point.y );
  }
}

var p1 = new Point(0, 10);
var p2 = new Point(10, 20);
var p3 = p1.add(p2); 

// Inheritance

class Point3D extends Point {
  z: number;
  constructor(x:number, y:number, z:number){
    super(x,y);
    this.z = z;
  }
  add(point: Point3D) {
    var point2D = super.add(point);
    return new Point3D(point2D.x, point2D.y, this.z +point.z);
  }
}
```
### static

TypeScript classe support static properties that are shared by all instances of the class. A natual place to put (and access them in on the class itself and that is what TypeScript) does.

```javascript 
class Something {
  static instances = 0;
  constructor() {
    something.instances++;
  }
}

var s1 = new Something();
var s2 = new Something();
console.log(something.instances);
```
### Access Modifiers.
TypeScript support access modifiers *public, private and protected* which determine the accessibility of a *clas* as shown.  

 accesible on      | public            | protected             | private            |
-------------------|-------------------|-----------------------|--------------------|
class | yes | yes |yes
class children | yes |yes |no |
class instance | yes | no | no |

If an access modifier is not specified it is implicitly *public* as that matches the convenient nature of JavaScript.

```JavaScript
class FooBase {
  public x: number;
  private y: number;
  protected z: number;
}

//effect on Instances
var foo = new FooBase();
foo.x; //okay
foo.y; //ERROR : private
foo.z; // Error : protected.

// EFFECT ON CHILD CLASSES
class FooChild extend FooBase {
  constructor(){
    super();
    this.x; //okay
    this.y; // Error: private
    this.z; // Okay
 }}
```
### Abstract.

*abstract* can be thought as an acces modifier. We present it separately because opposed to the previously mentioned modifiers it can be on a `class` as well as any members of the class. Having an abstract modifier primarily means that such functionality cannot be directly invoked and a child class must provide the functionality.

  * Abstract classe cannot be directly instantiated. Instead the user must create some class that inherits from the abstract class
  
### What's Up with the IIFE

Immediately-Invoked Function Expression (IIFE). 

```javascript
(function (){
   // BODY
   return Point;
})()
```
hast to do with inheritance. It allows TypeScript to capture the base as a variable *_super* e.g

Notice that the **IIFE** allows TypeScript to easily capture the base class point in a *_super* variable and that is used consitently in the class body.

### _extends

You will notice that as soon as you inherit a class TypeScript also generate the following functions.

Here *d* refers to the derived class and *b* refers to the base class. This function does two things.


### Arrow Functions.

lovingly called the fat arrow (because -> is a thin arrow and => if a fat arrow) and also called a labda function (because of other language.)
Another commonly used feature is the fat arrow function *()=>someting*.The motivation for a fat arrow. 

  1. You don't need to keep typing *function*.
  2. It lexically capture the meaning of *this*.
  3. It lexically capture the meaning of *arguments*

 
#### Tip: Arrow Function Need

Beyond the terse syntax, you only need use the fat arrow if you are going to give the function to someone eles to call.

Effectively:


### Class in ts to Js

When you create a class in Typescript like the following.

```Typescript
class Foo {
  members = [];
  firstname:string;
  lastname:string;
  add(x){this.members.push(x)}
  constructor(public x:number){}
}
```

```JavaScript
var Foo = /** @class */ (function () {
    function Foo(x) {
        this.x = x;
        this.members = [];
    }
    Foo.prototype.add = function (x) { this.members.push(x); };
    return Foo;
}());
```
The above class leads to creation of a fuction with returns a fuction with local variables.

### Property initializer
Tis is a nifty feature supported by typescript from ES7 actually. You can initialize any member of the class outside a constructor, useful to provide default (notice members=[])

### What's up with the IIFE

The js generated for the class could have been:
 
```JavaScript
function Point(x,y) {
   this.x = x;
   this.y = y;
}
Point.prototype.add = function (point) {
  return new Point(this.x + point.x, this.y + point.y);
}
```
The reson it's wrapped in an Immediately-Invoked Function Expression (IIFE) i.e

```javascript
(function(){
  // BODY
  return Point;
  })
```

