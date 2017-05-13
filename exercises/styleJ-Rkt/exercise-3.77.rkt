#lang racket

(require "common.rkt")

;   Exercise 3.77
;   =============
;   
;   The integral procedure used above was analogous to the "implicit"
;   definition of the infinite stream of integers in section [3.5.2]. 
;   Alternatively, we can give a definition of integral that is more like
;   integers-starting-from (also in section [3.5.2]):
;   
;   (define (integral integrand initial-value dt)
;     (cons-stream initial-value
;                  (if (stream-null? integrand)
;                      the-empty-stream
;                      (integral (stream-cdr integrand)
;                                (+ (* dt (stream-car integrand))
;                                   initial-value)
;                                dt))))
;   
;   When used in systems with loops, this procedure has the same problem as
;   does our original version of integral.  Modify the procedure so that it
;   expects the integrand as a delayed argument and hence can be used in the
;   solve procedure shown above.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.77]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.77
;   [Section 3.5.2]: http://sicp-book.com/book-Z-H-24.html#%_sec_3.5.2
;   3.5.4 Streams and Delayed Evaluation - p348
;   ------------------------------------------------------------------------

(-start- "3.77")



(--end-- "3.77")

