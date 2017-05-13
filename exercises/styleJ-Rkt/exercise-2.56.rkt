#lang racket

(require "common.rkt")

;   Exercise 2.56
;   =============
;   
;   Show how to extend the basic differentiator to handle more kinds of
;   expressions.  For instance, implement the differentiation rule
;   
;   d(uⁿ)          / du \
;   ───── = nuⁿ⁻¹ ( ──── )
;     dx           \ dx /
;   
;   by adding a new clause to the deriv program and defining appropriate
;   procedures exponentiation?, base, exponent, and make-exponentiation. 
;   (You may use the symbol ** to denote exponentiation.) Build in the rules
;   that anything raised to the power 0 is 1 and anything raised to the
;   power 1 is the thing itself.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.56]: http://sicp-book.com/book-Z-H-16.html#%_thm_2.56
;   2.3.2 Example: Symbolic Differentiation - p150
;   ------------------------------------------------------------------------

(-start- "2.56")



(--end-- "2.56")

