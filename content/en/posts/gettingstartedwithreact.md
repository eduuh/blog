---
title: "Getting Started With React"
description: "React is a JavaScript library for building user interfaces. It is maintained by Facebook and a community of individual developers and companies. React can be used as a base in the development of single-page or mobile applications"
date: 2020-01-29T05:16:56+03:00
draft: true
linktitle: ""
title: "Quickstart to Installing React and React ES6 Review"
categories: ["Javascript","Frontend"]
tags: ["React"]
weight: 30
author: eduuh

image: images/react.png
---
## Quickstart to React

* React is a `Javascript` library created by Facebook.
* React is a `User Interface` (UI) library.
* React is a tool for building `UI components`
* React is used to build single page components
* React allow us to create reusable components.
You see how i repeat myself here. You get the point Its react! am writing about.



Before jumping to react you will need to have the basics of the following:

1. what is `HTML`
2. What is `CSS`
3. What is `Dom`
4. what is `ES6`
5. What is  `Node.js`
6. What is `npm`

If you cant answer the question ,jump to [freecode camp  org](https://www.freecodecamp.org/) to get started.

## How does React Work
1. React creates a  `virtual dom in memory`. 
    - Instead of manipulation the browsers Dom directly, React create a virtual dom in memory,where it does all the necessary manipulatiog,before making the changes in the browser Dom.
2. React change only what needs to be changed
  - React finds out what changets have been made, and changes only what needs to be changet.

### Create React App

In order to learn and test react you will need to have `React Environment` installed in your local computer.
You will need to install `node.js` ,`npm` and `create-react-app`.

#### [Node.js](https://nodejs.org/en/)
Node.js is a javascript runtime built on `chrome's V8 Javascript engine`. Go to the site and you will find installation guide.

#### [npm]()
Npm is a software registry where `Open source developer` , `Organisations` from any continent share or borrow packages. Npm is used to manage pakage release, versioning and even dependency trees.

### create-react-app
The create-react-app is an officially supported ways to create react applications.
If you have `NPM` and `Node.js` installed, you can create a React application by first installind the
command line tool `create react app`
Install `create-react-app` by running the command in the terminal.
```
    npm install -g create-react-app   
```      
After the install is complete, You are now ready to create your first react application!.
Run this command to create your react application named `myreactapp`.
```
   npx create-react-app myreactapp  # create a react application inside myreactapp folder.
```
The `create-react-app` will set up everything you need to run a react application.

### Running your first react application
If you followed the two commands above,you are ready to run your first react application. Go back to the command line  and move to the directory `myreactapp`.
```
 cd myreactapp   # cd => change directory
 npm start       # This will start a development server with expose your app on port 3000
```
A development server is started, a new browser window will pop up with your newly created React app!. If not open
the browser and type `localhost:3000`

#### What you should Know
Before starting React js you should have intermediate experience in.

1. Html
2. CSS
3. Javascript

You should also have some experience in the new Javascript features introduced in ECMAScript 6 (ES6) ,you will learn them in React ES6 section below.

### React ECMAScript 6.
ECMAScript was created to standardize Javascript, and ES6 is the 6th version of ECMAScript, it was published in 2015 and is known as ECMAScript 2015.

### Why Should I Learn ES6
React uses ES6, and you should be familiar with some of the new features like.

* classes
* Arrow Functions
* Variables (let , const ,var)

### Classes
ES6 introduced classes.
`A class is a type of function`(funny), but instead of using they keyword function to initiate it, we use the keyword `class`, and properties are assigned inside a `conrtructor()` method.

```Javascript
class car {
    constructor(name){
        this.brand = name;
    }
}
```
Now you can create objects usind the Car class.
```Javascript
mycar = new car("Ford");
```
The `constructor` fuction is called automatically when the object is intialized.

#### Methods in classes
Create a method named 'present'
```Javascript
class Fruits {
    constructor(...fruits){
        this.fruits = [...fruits];
    }

    printFruits(){
        console.log(fruits[0]);
    }
}

myfruits = new Fruits(['orange','mango','bananas']);
myfruits.printFruits();
```
### Class Inheritance
To create a class inheritance we use the `extends` keywords.
A class created with a class inheritance inherits all the methots from another class.

Example
```Javascript
class Animal {
    constructor(name, age){
        this.name = name,
        this.age = age
    }
    showDetails(){
        console.log("name is:" +name + "age is : " +age);
    }
}

class Type extends Animal {
    constructor(name, age){
        super(name,age);
        this.type = type;
    }

    type(){
        switch(this.name){
            case "lion":
                  type = "Canivorou";
                  break;
            default:
                  type = "animal type not known";

        }
    }
}
  lion = Type('lion',34);
  lion.showDetails();
  lion.type();
```






