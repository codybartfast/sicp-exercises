#lang racket

(require "common.rkt")

;   Exercise 1.8
;   ============
;   
;   Newton's method for cube roots is based on the fact that if y is an
;   approximation to the cube root of x, then a better approximation is
;   given by the value
;   
;   x/y² + 2y
;   ─────────
;       3
;   
;   Use this formula to implement a cube-root procedure analogous to the
;   square-root procedure.  (In section [1.3.4] we will see how to implement
;   Newton's method in general as an abstraction of these square-root and
;   cube-root procedures.)
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.8]:  http://sicp-book.com/book-Z-H-10.html#%_thm_1.8
;   [Section 1.3.4]: http://sicp-book.com/book-Z-H-12.html#%_sec_1.3.4
;   1.1.7 Example: Square Roots by Newton's Method - p26
;   ------------------------------------------------------------------------

(-start- "1.8")



(--end-- "1.8")

