#lang racket

(require "common.rkt")

;   Exercise 5.48
;   =============
;   
;   The compile-and-go interface implemented in this section is awkward,
;   since the compiler can be called only once (when the evaluator machine
;   is started).  Augment the compiler-interpreter interface by providing a
;   compile-and-run primitive that can be called from within the
;   explicit-control evaluator as follows:
;   
;   ;;; EC-Eval input:
;   (compile-and-run
;    '(define (factorial n)
;       (if (= n 1)
;           1
;           (* (factorial (- n 1)) n))))
;   ;;; EC-Eval value:
;   ok
;   ;;; EC-Eval input:
;   (factorial 5)
;   ;;; EC-Eval value:
;   120
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.48]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.48
;   5.5.7 Interfacing Compiled Code to the Evaluator - p609
;   ------------------------------------------------------------------------

(-start- "5.48")



(--end-- "5.48")

