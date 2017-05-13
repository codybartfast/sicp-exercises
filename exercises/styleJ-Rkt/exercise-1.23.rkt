#lang racket

(require "common.rkt")

;   Exercise 1.23
;   =============
;   
;   The smallest-divisor procedure shown at the start of this section does
;   lots of needless testing: After it checks to see if the number is
;   divisible by 2 there is no point in checking to see if it is divisible
;   by any larger even numbers.  This suggests that the values used for
;   test-divisor should not be 2, 3, 4, 5, 6, ..., but rather 2, 3, 5, 7, 9,
;   ....  To implement this change, define a procedure next that returns 3
;   if its input is equal to 2 and otherwise returns its input plus 2. 
;   Modify the smallest-divisor procedure to use (next test-divisor) instead
;   of (+ test-divisor 1).  With timed-prime-test incorporating this
;   modified version of smallest-divisor, run the test for each of the 12
;   primes found in exercise [1.22].  Since this modification halves the
;   number of test steps, you should expect it to run about twice as fast.
;   Is this expectation confirmed?  If not, what is the observed ratio of
;   the speeds of the two algorithms, and how do you explain the fact that
;   it is different from 2?
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.23]: http://sicp-book.com/book-Z-H-11.html#%_thm_1.23
;   [Exercise 1.22]: http://sicp-book.com/book-Z-H-11.html#%_thm_1.22
;   1.2.6 Example: Testing for Primality - p54
;   ------------------------------------------------------------------------

(-start- "1.23")



(--end-- "1.23")

