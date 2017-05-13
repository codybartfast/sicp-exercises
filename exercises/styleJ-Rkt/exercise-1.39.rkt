#lang racket

(require "common.rkt")

;   Exercise 1.39
;   =============
;   
;   A continued fraction representation of the tangent function was
;   published in 1770 by the German mathematician J.H. Lambert:
;   
;   tan x =        x
;           ────────────────
;                    x²
;           1 ─ ────────────
;                      x²
;               3 ─ ────────
;                       ·
;                   5 ─  ·
;                         ·
;   
;   where x is in radians. Define a procedure (tan-cf x k) that computes an
;   approximation to the tangent function based on Lambert's formula.  K
;   specifies the number of terms to compute, as in exercise [1.37].
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.39]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.39
;   [Exercise 1.37]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.37
;   1.3.3 Procedures as General Methods - p72
;   ------------------------------------------------------------------------

(-start- "1.39")



(--end-- "1.39")

