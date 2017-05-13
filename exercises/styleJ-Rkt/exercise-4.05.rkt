#lang racket

(require "common.rkt")

;   Exercise 4.5
;   ============
;   
;   Scheme allows an additional syntax for cond clauses, (<test> =>
;   <recipient>).  If <test> evaluates to a true value, then <recipient> is
;   evaluated.  Its value must be a procedure of one argument; this
;   procedure is then invoked on the value of the <test>, and the result is
;   returned as the value of the cond expression.  For example
;   
;   (cond ((assoc 'b '((a 1) (b 2))) => cadr)
;         (else false))
;   
;   returns 2. Modify the handling of cond so that it supports this extended
;   syntax.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.5]:  http://sicp-book.com/book-Z-H-26.html#%_thm_4.5
;   4.1.2 Representing Expressions - p35
;   ------------------------------------------------------------------------

(-start- "4.5")



(--end-- "4.5")

