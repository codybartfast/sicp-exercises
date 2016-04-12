#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 2.87")

;   Exercise 2.87
;   =============
;   
;   Install =zero? for polynomials in the generic arithmetic package.  This
;   will allow adjoin-term to work for polynomials with coefficients that
;   are themselves polynomials.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.87]: http://sicp-book.com/book-Z-H-18.html#%_thm_2.87
;   2.5.3 Example: Symbolic Algebra - p209
;   ------------------------------------------------------------------------