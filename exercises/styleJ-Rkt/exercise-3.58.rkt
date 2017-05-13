#lang racket

(require "common.rkt")

;   Exercise 3.58
;   =============
;   
;   Give an interpretation of the stream computed by the following
;   procedure:
;   
;   (define (expand num den radix)
;     (cons-stream
;      (quotient (* num radix) den)
;      (expand (remainder (* num radix) den) den radix)))
;   
;   (Quotient is a primitive that returns the integer quotient of two
;   integers.) What are the successive elements produced by (expand 1 7 10)
;   ?  What is produced by (expand 3 8 10) ?
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.58]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.58
;   3.5.2 Infinite Streams - p332
;   ------------------------------------------------------------------------

(-start- "3.58")



(--end-- "3.58")

