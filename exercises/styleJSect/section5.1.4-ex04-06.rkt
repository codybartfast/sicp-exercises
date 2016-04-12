#lang racket

; Section 5.1.4: Using a Stack to Implement Recursion

(require "common.rkt")

;   Exercise 5.4
;   ============
;   
;   Specify register machines that implement each of the following
;   procedures.  For each machine, write a controller instruction sequence
;   and draw a diagram showing the data paths.
;   
;   a. Recursive exponentiation:
;   
;   (define (expt b n)
;     (if (= n 0)
;         1
;         (* b (expt b (- n 1)))))
;   
;   b. Iterative exponentiation:
;   
;   (define (expt b n)
;     (define (expt-iter counter product)
;       (if (= counter 0)
;           product
;           (expt-iter (- counter 1) (* b product))))
;     (expt-iter n 1))
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.4]:  http://sicp-book.com/book-Z-H-31.html#%_thm_5.4
;   5.1.4 Using a Stack to Implement Recursion - p510
;   ------------------------------------------------------------------------

(-start- "5.4")



(--end-- "5.4")

;   ========================================================================
;   
;   Exercise 5.5
;   ============
;   
;   Hand-simulate the factorial and Fibonacci machines, using some
;   nontrivial input (requiring execution of at least one recursive call).
;   Show the contents of the stack at each significant point in the
;   execution.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.5]:  http://sicp-book.com/book-Z-H-31.html#%_thm_5.5
;   5.1.4 Using a Stack to Implement Recursion - p512
;   ------------------------------------------------------------------------

(-start- "5.5")



(--end-- "5.5")

;   ========================================================================
;   
;   Exercise 5.6
;   ============
;   
;   Ben Bitdiddle observes that the Fibonacci machine's controller sequence
;   has an extra save and an extra restore, which can be removed to make a
;   faster machine.  Where are these instructions?
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.6]:  http://sicp-book.com/book-Z-H-31.html#%_thm_5.6
;   5.1.4 Using a Stack to Implement Recursion - p512
;   ------------------------------------------------------------------------

(-start- "5.6")



(--end-- "5.6")

