# Week 5

### Title: Quick sort

### Problem statement
Write a program in Ruby that implements quick sort algorithm

### Comments/Description/Learnings
Test with ruby's known sort function if the output matches, add test cases

https://www.tutorialspoint.com/data_structures_algorithms/quick_sort_algorithm.htm

Algorithm for moving elements correctly around the pivot
Step 1 − Choose the highest index value has pivot
Step 2 − Take two variables to point left and right of the list excluding pivot
Step 3 − left points to the low index
Step 4 − right points to the high
Step 5 − while value at left is less than pivot move right
Step 6 − while value at right is greater than pivot move left
Step 7 − if both step 5 and step 6 does not match swap left and right
Step 8 − if left ≥ right, the point where they met is new pivot

Algorithm for doing above partitioning recursively
Step 1 − Make the right-most index value pivot
Step 2 − partition the array using pivot value
Step 3 − quicksort left partition recursively
Step 4 − quicksort right partition recursively
