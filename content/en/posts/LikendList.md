---
title: "Linkend Lists"
description: "Linked Lists"
date: 2020-07-28T19:56:17Z
draft: true
hideToc: false
enableToc: false
author: eduuh
authorEmoji: 🤖
pinned: true
tags:
  - DataStructures
series:
  - DataStructure
---

> #### What is a Linkend List?

A list that contains **a set of Nodes or blocks.** In singly linked list, A node is composed of a Value and pointer to the next value. (We talk of pointers since we are using reference types). Each node points to the next node. The first node is know as head and the last Node is know as the tail. The Linked List are **null terminated.** The last node pointer is null.

You can have node sorted, searched

A simple example of Linked List that stores the values **10-->5-->16**

```javascript
// number 10 is the head
// number 16 is the tail
let linkedlist = {
      10,
      next: {
          5,
          next: {
              16,
              next: null
          }
      }
}

```

> #### Why is LinkendList different?

A linked List has a loose structure that allow insertion of into a middle of the list by simply reseting a few pointers Thats the only change that happens. This is the same for deleteing

<!--> ##### Why use Linked Lists, can you draw it?-->
<!--TODO Linked list drawing -->

> ##### What are the two types of Linked Lists?

1. Singly Linked Lists
2. Double Linked Lists

> What problem do we encounter with arrays?

Well With static arrays, we only had a certain amount of data or memory that can be allocated next to each other in the memory but then for both dynamic and static arrays can increase their memory once it hit a certain limit and double up the momory in another location but that operation occurs once in a while. Doubling up of array have some performance implication.

Other operation for arrays Like insert and delete that have to shift indexes over especially when you insert or delete any element that wasn't at the end.

> What problems are expected in HastTables

A hashtable is as good as its Hash function. A good hash function should avoid collisions and is efficient.

> Why Linked List?

When we want to access elements that wasnt at the end of the Array we had to shift all the items down and index down which would cost had some performance implication With a time complexity of O(n).

Linked List came to the rescue of of using hashtables and arrays. But this does not mean we should use only Linked Lists? As always there are always tradeoffs when it comes to data structures and we should use the datastructure that is more appropriate.

> What are the main Difference of LinkedList and Array?

Array are **Index based** and if we would want to get a value say at index 5. I can do that easily in array with a simple lookup operations But when it come to linked list, the values are store as nodes and you can and different memory addresss you have to **traverse** the list until you get to the index 5. Traversing is the same idea as looping and the only difference it that we might not know how long the linked list is.

Array data are always located next to each other, while LinkedList are scattered in the memory. Iterating through an array is a little faster than traversing through a linked list even thoug both are **O(n)**

> What does "nodes are scattered mean?"

Each node have a reference(located) at different place in memory or another object.(Note object are reference types)

> Advantages of linked List over hashtables?

> What are the big O notation of a linked List for the following operations?
> **prepend** , **append**, **lookup** , **insert**, **delete**

| operation | big o |
| --------- | ----- |
| prepend   | O(1)  |
| append    | 0(1)  |
| lookup    | O(n)  |
| insert    | O(n)  |
| delete    | O(n)  |

> What is a pointer?

A pointer is simply a referecen to another reference in memory or another
object.

```javascript
const object1 = { a: true }
object1.a = "edwin" // object1 and object2 value changes
const object2 = object1 // pointer

console.log("1", object1)
console.log("1", object2)
```

Both object1 and Object2 points to the same location in
memory. A pointer says this is where it is in memory.

> Create a linked list to store: 10-->5-->16

```javascript
class LinkendList {
  constructor(value) {
    this.head = {
      value: value,
      next: null,
    }
    this.tail = this.head
    this.length = 1
  }

  append(value) {
    const newNode = {
      value: value,
      next: null,
    }
    this.tail.next = newNode
    this.tail = newNode
    this.length++
    return this
  }

  prepend(value) {
    let headNode = {
      value: value
      next: this.head
    }
    this.head = headNode
    return this
  }
}

const myl = new LinkendList(10)
myl.prepend(1)
myl.append(54)
console.log(myl.append(5))
```

> What is a DoubleLinked List?

A double LinkedList allows use to traverse the List backwords. It exactly the same as singly LinkedList but have the an extra layer on a pointer of the previous node.

> #### What are some LinkendList properties?

LinkendList some properties.

1. Fast insertion
2. Fast deletion
3. Ordered
4. Flexible size.
5. Slow Lookup
6. More Memory.
