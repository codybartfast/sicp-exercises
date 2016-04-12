#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 2.79")

;   Exercise 2.79
;   =============
;   
;   Define a generic equality predicate equ? that tests the equality of two
;   numbers, and install it in the generic arithmetic package.  This
;   operation should work for ordinary numbers, rational numbers, and
;   complex numbers.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.79]: http://sicp-book.com/book-Z-H-18.html#%_thm_2.79
;   2.5.1 Generic Arithmetic Operations - p193
;   ------------------------------------------------------------------------