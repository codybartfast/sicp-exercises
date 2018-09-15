#lang sicp

(#%require "common.scm")

;   Exercise 1.33
;   =============
;   
;   You can obtain an even more general version of accumulate (exercise
;   [1.32]) by introducing the notion of a filter on the terms to be
;   combined.  That is, combine only those terms derived from values in the
;   range that satisfy a specified condition.  The resulting
;   filtered-accumulate abstraction takes the same arguments as accumulate,
;   together with an additional predicate of one argument that specifies the
;   filter.  Write filtered-accumulate as a procedure.  Show how to express
;   the following using filtered-accumulate:
;   
;   a. the sum of the squares of the prime numbers in the interval a to b
;   (assuming that you have a prime? predicate already written)
;   
;   b. the product of all the positive integers less than n that are
;   relatively prime to n (i.e., all positive integers i < n such that
;   GCD(i,n) = 1).
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.33]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.33
;   [Exercise 1.32]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.32
;   1.3.1 Procedures as Arguments - p61
;   ------------------------------------------------------------------------

(-start- "1.33")



(--end-- "1.33")
