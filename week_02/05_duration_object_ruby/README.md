# Week 2

### Title: Duration value object in Ruby

### Problem statement
Implement a class Duration that assumes the following
HH:MM:SS notation for duration
If we enter 45, its seconds
If we enter 3:45 or 03:45 it will be 3 minutes and 45 seconds
If we enter 10:55:22 it will be 10 hours 55 minuts and 22 secs

It should have validation for hours minutes and seconds.
Add methods to add and print Duration.

### Comments/Description/Learnings
- Try to override the spaceship operator <=> and then include the Comparable module.
- Once you do that, you should be able to use all the operators like >,<,!= etc. seamlessly
