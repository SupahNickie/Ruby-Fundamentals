# FUNDAMENTALS OF RUBY

This repository is a collection of all the accumulated academic topics in Computer Science that I've encountered and adapted for use in Ruby. It's funny how far you end up going after figuring out how to write your first "Fizzbuzz".

### Interview Challenges

##### Cracking the Coding Interview Questions

Written by Gayle Laakmann, Cracking the Coding Interview (this file based on the 4th edition) presents technical interview style questions (with solutions in the back written in Java) covering the fundamentals of computer science. I began going through and answering the questions in Ruby, which are presented in this repo with somewhat descriptive method names to help those who do not have the book to see what the methods are trying to accomplish.

##### Interview Challenges

This repo is a collection of random sets of challenges that I've seen on Glassdoor and that companies have actually sent to me (though I do not list the company's name if it was a challenge sent to me).

##### Mars Rover/Receipt Generator

These were a couple of challenges presented to me with the task of writing them in both Ruby and Javascript with specific directions on their inputs and outputs. A little bit of my Rubyisms were lost in the translation to Javascript because it's not so much my "native language" in programming, so some of the functionality of the Ruby files is missing (such as the ability for the exemptions to only need to contain singular versions of words and for the tax_exempt variable to show which specific items were tax exempt, rather than just true or false).

##### Dictionary

The idea for this challenge was from a guest talk we had at Code Fellows when one of the engineers that spoke to us said a program version of a dictionary is a very common technical interview question, so I decided to run with it. I originally thought of making it object-oriented, with a class of Word that was initialized, but realized not too long after that I didn't actually need to instantiate a word at all, being able to handle all functionality in just two global methods, with the third simply allowing an infinite loop until the user types "exit". However, never content to let sleeping dogs lie, I went back later and made it object-oriented anyway.

##### The Fizzbuzz Challenge

The first approach (the file called "fizzbuzz.rb") is the standard 3 and 5 FizzBuzz program taught early on in programming. The way it works is that it takes one argument, the number you want to check division of 3 and 5 by. It then uses the Modulo operator to see if there are any remainders in division; so that when you pass Fizzbuzz the number 6 and modulo that number with the number 3, it returns "0" because there's no remainder, meaning that 6 is divisible by 3. So, with the argument being a number that you want to check against, the program then uses Ruby's conditional statements to decide what to output. The hardest condition to fulfill (division by 3 and 5) is listed first because Ruby will return whatever is "easiest" for it to find.

###### Limitations of Fizzbuzz v 1.0

- The program is purely static; we cannot add any divisors without hard-coding in another conditional. For example, if we wanted to check division by 7, we would have to rewrite the conditional statement to include all the separate cases where 7 can be introduced. This can spiral out of control quickly.

- Also, the program can only take one number as an argument at a time. Ideally, we'd like the end-user to be able to input any number of arguments for the number they want to check division against as well as any number of divisors somewhere in the code.

###### Fizzbuzz v 2.0

Hardcore Fizzbuzz and the ranged version solve both of those major issues. In it an easily managed list of divisors is used in a "check divisors" method used to iterate over a splat argument for the main method itself, allowing a check of any amount of numbers to check division against as well as an easy way to add in any divisors the user would want. While some small amount of coding is required to add in any divisors, even the most novice of programmers could extrapolate how to add in a divisor and its associated return key in the first line of the FizzBuzz code.

### Data Structures and Algorithms

##### Data Structures

Ruby versions of the main data structures to be expected out in the wild: Binary Trees, N-ary Trees, (Doubly) Linked Lists, Stacks (with Array and Linked List implementations), and Queues (also with Array and Linked List implementations). Each of the data structures also has commonly asked for algorithms such as tree traversal, node deletion, and depth checking.

##### Sorting Algorithms

As a TA at Code Fellows, sometimes I'm exposed to new things that we didn't cover during my original eight weeks in training there. One of those new experiences was a guest lecture from Benjamin Keller whom used an example of Mergesort in class. Never content to let myself not understand a new problem fully, I dove into the code to make one for myself. The result is what taught me, with MUCH help from several sources (thanks Peter Turati!), not only the Mergesort's mechanics, but about recursion in programming as well. Once I figured out the Mergesort algorithm, I asked Brook for another challenge and he presented me with Quicksort, saying that it was difficult to explain even in a couple sentences exactly how it works. After a couple videos on YouTube that explained the concept, the code wasn't too difficult to pick up on and here I present my Ruby-centric version of Quicksort. Later in my teaching career, I was asked to present a week of just doing sorting algorithms, so I decided to include Insertion sort despite its limited usage and a least significant digit version of Radix sort, a wholly non-comparative sort.

### OOD Best Practices

Testing best practices for Object Oriented Programming in Ruby. The principles used within the code for this repo are based in lessons learned from Practical Object Oriented Design in Ruby by Sandi Metz.

##### The Initializer:

One of the best practices for OOD is the use of hashes for initialization of classes. My original train of thought for developing the different animal behaviors was that I would have a Prey and a Predator class, with both of them inheriting common behaviors from the boilerplate Animal class. I coded that up, but noticed that I, and more importantly any developer that would inherit this codebase after me, would have to know the precise list of arguments and the order in which to initialize them to properly create instances of either class. After doing a little bit of research, I settled on the solution that my initialization methods for ANY class should take an arbitrary hash and dynamically assign accessor permissions to those attributes as well. The result of this insight is in the extensible module "intializer.rb" in the parent directory.

*How it works:*
- The module's initialize method will replace the initialize method of whatever class it's included in.
- Given that it only has one parameter, it must be a hash, which is then iterated through with a .each method.
- Inside the .each call, the first action is to pull the key from the hash and create an instance variable with that name and set its value to the hash's key's value. Being that this is an each loop, this action is performed for each item in the hash.
- Once the instance variables are set, we have to be able to get and set them to make a useful program. Thus, while still in the each loop, we open up the metaclass (eigenclass) of the intialized class and run a class_eval method to create a class level method of attr_accessor for each key in the hash, in essence creating a dynamic list of accessors.

Now with the initializer.rb file included in each of our classes, we're able to DRY up our code significantly as well as make it easier for future maintenance/flexibility to change.

##### Limited Public Interface:

To paraphrase Sandi Metz, you don't care what's going on in the kitchen; all you need is to place an order. Striving to keep as few methods as possible for the actions to run, I found it only necessary to have two public methods for either class with a small amount of private methods called.

##### Avoiding Specific Class Calls:

Good programming is malleable programming, so we don't want to rely on specifics (especially the class of an object and poorly designed procedural methods) any more than we have to. Therefore, in the hunter and animal classes, I designed the methods to only need to respond to objects that have a "defend" method, which is perfectly reasonable to be called upon if something is attacking said object.

###### The MIT License (MIT)

Copyright © 2014 Nicholas Case, http://www.nicholascase.net

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
