#lang racket

(require "common.rkt")

;   Exercise 5.31
;   =============
;   
;   In evaluating a procedure application, the explicit-control evaluator
;   always saves and restores the env register around the evaluation of the
;   operator, saves and restores env around the evaluation of each operand
;   (except the final one), saves and restores argl around the evaluation of
;   each operand, and saves and restores proc around the evaluation of the
;   operand sequence.  For each of the following combinations, say which of
;   these save and restore operations are superfluous and thus could be
;   eliminated by the compiler's preserving mechanism:
;   
;   (f 'x 'y)
;   
;   ((f) 'x 'y)
;   
;   (f (g 'x) y)
;   
;   (f (g 'x) 'y)
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.31]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.31
;   5.5.1 Structure of the Compiler - p574
;   ------------------------------------------------------------------------

(-start- "5.31")



(--end-- "5.31")

