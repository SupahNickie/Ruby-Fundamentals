RUBY PRACTICE
=============
This repository originally started off as an assignment through Code Fellows to test our Ruby technical skills with the Fizzbuzz program, to which our challenge was to extend it to take any case. However, after graduation from the Ruby on Rails program, I'm going to be using this repository as a playground to challenge my own Ruby programming skills with challenges that I can think up or need to have written myself in order to practice data structures and algorithms. This will definitely be a mishmash of Ruby programs thrown in here!

Merge Sort
==========
As a TA at Code Fellows, sometimes I'm exposed to new things that we didn't cover during my original eight weeks in training there. One of those new experiences was a guest lecture from Benjamin Keller whom used an example of merge sort in class. Never content to let myself not understand a new problem fully, I dove into the code to make one for myself. The result is what taught me, with MUCH help from several sources, not only the merge sort's mechanics, but about recursion in programming as well.

Quick Sort
=========
Once I figured out the Merge sort algorithm, I asked Brook for another challenge and he presented me with Quick sort, saying that it was difficult to explain even in a couple sentences exactly how it works. After a couple videos on YouTube that explained the concept, the code wasn't too difficult to pick up on and here I present my Ruby-centric version of Quick sort.

Dictionary
==========
The idea for this challenge was from a guest talk we had at Code Fellows when one of the engineers that spoke to us said a program version of a dictionary is a very common technical interview question, so I decided to run with it. I originally thought of making it object-oriented, with a class of Word that was initialized, but realized not too long after that I didn't actually need to instantiate a word at all, being able to handle all functionality in just two global methods, with the third simply allowing an infinite loop until the user types "exit".

The Fizzbuzz Challenge
======================
The first approach (the file called "fizzbuzz.rb") is the standard 3 and 5 FizzBuzz program taught early on in programming. The way it works is that it takes one argument, the number you want to check division of 3 and 5 by. It then uses the Modulo operator to see if there are any remainders in division; so that when you pass Fizzbuzz the number 6 and modulo that number with the number 3, it returns "0" because there's no remainder, meaning that 6 is divisible by 3. So, with the argument being a number that you want to check against, the program then uses Ruby's conditional statements to decide what to output. The hardest condition to fulfill (division by 3 and 5) is listed first because Ruby will return whatever is "easiest" for it to find.

LIMITATIONS OF FIZZBUZZ v 1.0

- The program is purely static; we cannot add any divisors without hard-coding in another conditional. For example, if we wanted to check division by 7, we would have to rewrite the conditional statement to include all the separate cases where 7 can be introduced. This can spiral out of control quickly.

- Also, the program can only take one number as an argument at a time. Ideally, we'd like the end-user to be able to input any number of arguments for the number they want to check division against as well as any number of divisors somewhere in the code.

FIZZBUZZ v 2.0

hardcorefizzbuzz.rb and ranged_hardcorefizzbuzz solve both of those major issues. In it an easily managed list of divisors is used in a "check divisors" method used to iterate over a splat argument for the main method itself, allowing a check of any amount of numbers to check division against as well as an easy way to add in any divisors the user would want. While some small amount of coding is required to add in any divisors, even the most novice of programmers could extrapolate how to add in a divisor and its associated return key in the first line of the FizzBuzz code.
