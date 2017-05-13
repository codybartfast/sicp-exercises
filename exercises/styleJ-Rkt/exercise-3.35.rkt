#lang racket

(require "common.rkt")

;   Exercise 3.35
;   =============
;   
;   Ben Bitdiddle tells Louis that one way to avoid the trouble in exercise
;   [3.34] is to define a squarer as a new primitive constraint.  Fill in
;   the missing portions in Ben's outline for a procedure to implement such
;   a constraint:
;   
;   (define (squarer a b)
;     (define (process-new-value)
;       (if (has-value? b)
;           (if (< (get-value b) 0)
;               (error "square less than 0 -- SQUARER" (get-value b))
;               <alternative1>)
;           <alternative2>))
;     (define (process-forget-value) <body1>)
;     (define (me request) <body2>)
;     <rest of definition>
;     me)
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.35]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.35
;   [Exercise 3.34]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.34
;   3.3.5 Propagation of Constraints - p295
;   ------------------------------------------------------------------------

(-start- "3.35")



(--end-- "3.35")

