FIZZBUZZ
========

The first approach (the file called "fizzbuzz.rb") is the standard 3 and 5 FizzBuzz program taught early on in programming. The way it works is that it takes one argument, the number you want to check division of 3 and 5 by. It then uses the Modulo operator to see if there are any remainders in division; so that when you pass Fizzbuzz the number 6 and modulo that number with the number 3, it returns "0" because there's no remainder, meaning that 6 is divisible by 3. So, with the argument being a number that you want to check against, the program then uses Ruby's conditional statements to decide what to output. The hardest condition to fulfill (division by 3 and 5) is listed first because Ruby will return whatever is "easiest" for it to find.

Limitations of FizzBuzz v 1.0
=============================

- The program is purely static; we cannot add any divisors without hard-coding in another conditional. For example, if we wanted to check division by 7, we would have to rewrite the conditional statement to include all the separate cases where 7 can be introduced. This can spiral out of control quickly.

- Also, the program can only take one number as an argument at a time. Ideally, we'd like the end-user to be able to input any number of arguments for the number they want to check division against as well as any number of divisors somewhere in the code.

FizzBuzz v 2.0
==============

hardcorefizzbuzz.rb solves both of those major issues. In it an easily managed list of divisors is used in a "check divisors" method used to iterate over a splat argument for the main method itself, allowing a check of any amount of numbers to check division against as well as an easy way to add in any divisors the user would want. While some small amount of coding is required to add in any divisors, even the most novice of programmers could extrapolate how to add in a divisor and its associated return key in the first line of the FizzBuzz code.
