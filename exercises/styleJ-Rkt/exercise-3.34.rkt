#lang racket

(require "common.rkt")

;   Exercise 3.34
;   =============
;   
;   Louis Reasoner wants to build a squarer, a constraint device with two
;   terminals such that the value of connector b on the second terminal will
;   always be the square of the value a on the first terminal.  He proposes
;   the following simple device made from a multiplier:
;   
;   (define (squarer a b)
;     (multiplier a a b))
;   
;   There is a serious flaw in this idea.  Explain.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.34]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.34
;   3.3.5 Propagation of Constraints - p295
;   ------------------------------------------------------------------------

(-start- "3.34")



(--end-- "3.34")

