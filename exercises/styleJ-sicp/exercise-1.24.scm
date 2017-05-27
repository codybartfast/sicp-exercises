#lang sicp

(#%require "common.scm")

;   Exercise 1.24
;   =============
;   
;   Modify the timed-prime-test procedure of exercise [1.22] to use
;   fast-prime? (the Fermat method), and test each of the 12 primes you
;   found in that exercise.  Since the Fermat test has θ(log n) growth, how
;   would you expect the time to test primes near 1,000,000 to compare with
;   the time needed to test primes near 1000?  Do your data bear this out? 
;   Can you explain any discrepancy you find?
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.24]: http://sicp-book.com/book-Z-H-11.html#%_thm_1.24
;   [Exercise 1.22]: http://sicp-book.com/book-Z-H-11.html#%_thm_1.22
;   1.2.6 Example: Testing for Primality - p55
;   ------------------------------------------------------------------------

(-start- "1.24")



(--end-- "1.24")

