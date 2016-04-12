#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 2.80")

;   Exercise 2.80
;   =============
;   
;   Define a generic predicate =zero? that tests if its argument is zero,
;   and install it in the generic arithmetic package.  This operation should
;   work for ordinary numbers, rational numbers, and complex numbers.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.80]: http://sicp-book.com/book-Z-H-18.html#%_thm_2.80
;   2.5.1 Generic Arithmetic Operations - p193
;   ------------------------------------------------------------------------