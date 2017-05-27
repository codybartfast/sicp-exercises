#lang sicp

(#%require "common.scm")

;   Exercise 1.29
;   =============
;   
;   Simpson's Rule is a more accurate method of numerical integration than
;   the method illustrated above.  Using Simpson's Rule, the integral of a
;   function f between a and b is approximated as
;   
;   h
;   ─ [y₀ + 4y₁ + 2y₂ + 4y₃ + 2y₄ + ... + 2y    + 4y    + y ]
;   3                                       ⁿ⁻²     ⁿ⁻¹    ⁿ
;   
;   where h = (b - a)/n, for some even integer n, and y_(k) = f(a + kh).
;   (Increasing n increases the accuracy of the approximation.) Define a
;   procedure that takes as arguments f, a, b, and n and returns the value
;   of the integral, computed using Simpson's Rule. Use your procedure to
;   integrate cube between 0 and 1 (with n = 100 and n = 1000), and compare
;   the results to those of the integral procedure shown above.
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.29]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.29
;   1.3.1 Procedures as Arguments - p60
;   ------------------------------------------------------------------------

(-start- "1.29")



(--end-- "1.29")

