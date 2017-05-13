#lang racket

(require "common.rkt")

;   Exercise 2.4
;   ============
;   
;   Here is an alternative procedural representation of pairs.  For this
;   representation, verify that (car (cons x y)) yields x for any objects x
;   and y.
;   
;   (define (cons x y)
;     (lambda (m) (m x y)))
;   
;   (define (car z)
;     (z (lambda (p q) p)))
;   
;   What is the corresponding definition of cdr? (Hint: To verify that this
;   works, make use of the substitution model of section [1.1.5].)
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.4]:  http://sicp-book.com/book-Z-H-14.html#%_thm_2.4
;   [Section 1.1.5]: http://sicp-book.com/book-Z-H-10.html#%_sec_1.1.5
;   2.1.3 What Is Meant by Data? - p92
;   ------------------------------------------------------------------------

(-start- "2.4")



(--end-- "2.4")

