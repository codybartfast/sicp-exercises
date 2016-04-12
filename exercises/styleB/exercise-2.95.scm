#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 2.95")

;   Exercise 2.95
;   =============
;   
;   Define P₁, P₂, and P₃ to be the polynomials
;   
;   P₁ : x² - 2x + 1
;   
;   P₂ : 11x² + 7
;   
;   P₃ : 13x + 5
;   
;   Now define Q₁ to be the product of P₁ and P₂ and Q₂ to be the product of
;   P₁ and P₃, and use greatest-common-divisor (exercise [2.94]) to compute
;   the GCD of Q₁ and Q₂. Note that the answer is not the same as P₁. This
;   example introduces noninteger operations into the computation, causing
;   difficulties with the GCD algorithm.⁽⁶¹⁾ To understand what is
;   happening, try tracing gcd-terms while computing the GCD or try
;   performing the division by hand.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.95]: http://sicp-book.com/book-Z-H-18.html#%_thm_2.95
;   [Exercise 2.94]: http://sicp-book.com/book-Z-H-18.html#%_thm_2.94
;   [Footnote 61]:   http://sicp-book.com/book-Z-H-18.html#footnote_Temp_317
;   2.5.3 Example: Symbolic Algebra - p213
;   ------------------------------------------------------------------------