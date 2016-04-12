#lang racket

; Section 5.3.1: Memory as Vectors

(require "common.rkt")

;   Exercise 5.20
;   =============
;   
;   Draw the box-and-pointer representation and the memory-vector
;   representation (as in figure [5.14]) of the list structure produced by
;   
;   (define x (cons 1 2))
;   (define y (list x x))
;   
;   with the free pointer initially p1.  What is the final value of free ? 
;   What pointers represent the values of x and y ?
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.20]: http://sicp-book.com/book-Z-H-33.html#%_thm_5.20
;   [Figure 5.14]:   http://sicp-book.com/book-Z-H-33.html#%_fig_5.14
;   5.3.1 Memory as Vectors - p539
;   ------------------------------------------------------------------------

(-start- "5.20")



(--end-- "5.20")

;   ========================================================================
;   
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

;   ========================================================================
;   
;   Exercise 5.22
;   =============
;   
;   Exercise [3.12] of section [3.3.1] presented an append procedure that
;   appends two lists to form a new list and an append! procedure that
;   splices two lists together.  Design a register machine to implement each
;   of these procedures.  Assume that the list-structure memory operations
;   are available as primitive operations.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.22]: http://sicp-book.com/book-Z-H-33.html#%_thm_5.22
;   [Section 3.3.1]: http://sicp-book.com/book-Z-H-22.html#%_sec_3.3.1
;   [Exercise 3.12]: http://sicp-book.com/book-Z-H-33.html#%_thm_3.12
;   5.3.1 Memory as Vectors - p539
;   ------------------------------------------------------------------------

(-start- "5.22")



(--end-- "5.22")

