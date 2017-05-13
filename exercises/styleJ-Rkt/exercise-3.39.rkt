#lang racket

(require "common.rkt")

;   Exercise 3.39
;   =============
;   
;   Which of the five possibilities in the parallel execution shown above
;   remain if we instead serialize execution as follows:
;   
;   (define x 10)
;   
;   (define s (make-serializer))
;   
;   (parallel-execute (lambda () (set! x ((s (lambda () (* x x))))))
;                     (s (lambda () (set! x (+ x 1)))))
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.39]: http://sicp-book.com/book-Z-H-23.html#%_thm_3.39
;   3.4.2 Mechanisms for Controlling Concurrency - p306
;   ------------------------------------------------------------------------

(-start- "3.39")



(--end-- "3.39")

