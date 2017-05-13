#lang racket

(require "common.rkt")

;   Exercise 1.43
;   =============
;   
;   If f is a numerical function and n is a positive integer, then we can
;   form the nth repeated application of f, which is defined to be the
;   function whose value at x is f(f(...(f(x))...)).  For example, if f is
;   the function x → x + 1, then the nth repeated application of f is the
;   function x → x + n.  If f is the operation of squaring a number, then
;   the nth repeated application of f is the function that raises its
;   argument to the 2ⁿth power.  Write a procedure that takes as inputs a
;   procedure that computes f and a positive integer n and returns the
;   procedure that computes the nth repeated application of f.  Your
;   procedure should be able to be used as follows:
;   
;   ((repeated square 2) 5)
;   625
;   
;   Hint: You may find it convenient to use compose from exercise [1.42].
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.43]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.43
;   [Exercise 1.42]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.42
;   1.3.4 Procedures as Returned Values - p77
;   ------------------------------------------------------------------------

(-start- "1.43")



(--end-- "1.43")

