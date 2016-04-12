#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 1.13")

;   Exercise 1.13
;   =============
;   
;   Prove that Fib(n) is the closest integer to ɸⁿ/√5, where ɸ = (1 + √5)/2.
;   Hint: Let ψ = (1 - √5)/2.  Use induction and the definition of the
;   Fibonacci numbers (see section [1.2.2]) to prove that Fib(n) = (ɸⁿ -
;   ψⁿ)/√5.
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.13]: http://sicp-book.com/book-Z-H-11.html#%_thm_1.13
;   [Section 1.2.2]: http://sicp-book.com/book-Z-H-11.html#%_sec_1.2.2
;   1.2.2 Tree Recursion - p42
;   ------------------------------------------------------------------------