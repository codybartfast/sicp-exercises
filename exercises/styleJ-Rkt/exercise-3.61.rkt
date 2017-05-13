#lang racket

(require "common.rkt")

;   Exercise 3.61
;   =============
;   
;   Let S be a power series (exercise [3.59]) whose constant term is 1. 
;   Suppose we want to find the power series 1/S, that is, the series X such
;   that S · X = 1.  Write S = 1 + S_(R) where S_(R) is the part of S after
;   the constant term.  Then we can solve for X as follows:
;   
;             S·X = 1
;   (1 + S_(R))·X = 1
;     X + S_(R)·X = 1
;               X = 1 - SR·X
;   
;   In other words, X is the power series whose constant term is 1 and whose
;   higher-order terms are given by the negative of S_(R) times X. Use this
;   idea to write a procedure invert-unit-series that computes 1/S for a
;   power series S with constant term 1. You will need to use mul-series
;   from exercise [3.60].
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.61]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.61
;   [Exercise 3.59]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.59
;   [Exercise 3.60]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.60
;   3.5.2 Infinite Streams - p333
;   ------------------------------------------------------------------------

(-start- "3.61")



(--end-- "3.61")

