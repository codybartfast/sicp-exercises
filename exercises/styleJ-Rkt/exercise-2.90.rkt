#lang racket

(require "common.rkt")

;   Exercise 2.90
;   =============
;   
;   Suppose we want to have a polynomial system that is efficient for both
;   sparse and dense polynomials.  One way to do this is to allow both kinds
;   of term-list representations in our system.  The situation is analogous
;   to the complex-number example of section [2.4], where we allowed both
;   rectangular and polar representations. To do this we must distinguish
;   different types of term lists and make the operations on term lists
;   generic.  Redesign the polynomial system to implement this
;   generalization.  This is a major effort, not a local change.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.90]: http://sicp-book.com/book-Z-H-18.html#%_thm_2.90
;   [Section 2.4]:   http://sicp-book.com/book-Z-H-17.html#%_sec_2.4
;   2.5.3 Example: Symbolic Algebra - p209
;   ------------------------------------------------------------------------

(-start- "2.90")



(--end-- "2.90")

