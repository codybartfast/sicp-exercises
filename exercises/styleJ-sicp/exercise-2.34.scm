#lang sicp

(#%require "common.scm")

;   Exercise 2.34
;   =============
;   
;   Evaluating a polynomial in x at a given value of x can be formulated as
;   an accumulation.  We evaluate the polynomial
;   
;   a xⁿ + a   xⁿ⁻¹ + ··· + a₁x + a₀
;    ⁿ      ⁿ⁻¹ 
;   
;   using a well-known algorithm called Horner's rule, which structures the
;   computation as
;   
;   (···(a x + a   )x + ··· + a₁)x + a₀
;         ⁿ     ⁿ⁻¹
;   
;   In other words, we start with a_(n), multiply by x, add a_(n-1),
;   multiply by x, and so on, until we reach a₀.⁽¹⁶⁾ Fill in the following
;   template to produce a procedure that evaluates a polynomial using
;   Horner's rule. Assume that the coefficients of the polynomial are
;   arranged in a sequence, from a₀ through a_(n).
;   
;   (define (horner-eval x coefficient-sequence)
;     (accumulate (lambda (this-coeff higher-terms) <??>)
;                 0
;                 coefficient-sequence))
;   
;   For example, to compute 1 + 3x + 5x³ + x⁵ at x = 2 you would evaluate
;   
;   (horner-eval 2 (list 1 3 0 5 0 1))
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.34]: http://sicp-book.com/book-Z-H-15.html#%_thm_2.34
;   [Footnote 16]:   http://sicp-book.com/book-Z-H-15.html#footnote_Temp_186
;   2.2.3 Sequences as Conventional Interfaces - p119
;   ------------------------------------------------------------------------

(-start- "2.34")



(--end-- "2.34")

