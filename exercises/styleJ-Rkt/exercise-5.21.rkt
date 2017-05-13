#lang racket

(require "common.rkt")

;   Exercise 5.21
;   =============
;   
;   Implement register machines for the following procedures. Assume that
;   the list-structure memory operations are available as machine
;   primitives.
;   
;   a. Recursive count-leaves:
;   
;   (define (count-leaves tree)
;     (cond ((null? tree) 0)
;           ((not (pair? tree)) 1)
;           (else (+ (count-leaves (car tree))
;                    (count-leaves (cdr tree))))))
;   
;   b. Recursive count-leaves with explicit counter:
;   
;   (define (count-leaves tree)
;     (define (count-iter tree n)
;       (cond ((null? tree) n)
;             ((not (pair? tree)) (+ n 1))
;             (else (count-iter (cdr tree)
;                               (count-iter (car tree) n)))))
;     (count-iter tree 0))
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.21]: http://sicp-book.com/book-Z-H-33.html#%_thm_5.21
;   5.3.1 Memory as Vectors - p539
;   ------------------------------------------------------------------------

(-start- "5.21")



(--end-- "5.21")

