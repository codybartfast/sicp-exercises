#lang racket

(require "common.rkt")

;   Exercise 1.46
;   =============
;   
;   Several of the numerical methods described in this chapter are instances
;   of an extremely general computational strategy known as iterative
;   improvement.  Iterative improvement says that, to compute something, we
;   start with an initial guess for the answer, test if the guess is good
;   enough, and otherwise improve the guess and continue the process using
;   the improved guess as the new guess.  Write a procedure
;   iterative-improve that takes two procedures as arguments: a method for
;   telling whether a guess is good enough and a method for improving a
;   guess.  Iterative-improve should return as its value a procedure that
;   takes a guess as argument and keeps improving the guess until it is good
;   enough.  Rewrite the sqrt procedure of section [1.1.7] and the
;   fixed-point procedure of section [1.3.3] in terms of iterative-improve.
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.46]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.46
;   [Section 1.1.7]: http://sicp-book.com/book-Z-H-10.html#%_sec_1.1.7
;   [Section 1.3.3]: http://sicp-book.com/book-Z-H-12.html#%_sec_1.3.3
;   1.3.4 Procedures as Returned Values - p78
;   ------------------------------------------------------------------------

(-start- "1.46")



(--end-- "1.46")

