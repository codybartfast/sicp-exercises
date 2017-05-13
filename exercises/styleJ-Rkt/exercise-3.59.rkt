#lang racket

(require "common.rkt")

;   Exercise 3.59
;   =============
;   
;   In section [2.5.3] we saw how to implement a polynomial arithmetic
;   system representing polynomials as lists of terms.  In a similar way, we
;   can work with power series, such as
;   
;                x²    x³     x⁴
;   eˣ = 1 + x + ── + ─── + ───── + ···,
;                2    3·2   4·3·2
;   
;               r²     r⁴
;   cos x = 1 - ── + ───── - ···,
;               2    4·3·2
;   
;               r²      r⁴
;   cos x = 1 - ──  + ───── - ···,
;               2     4·3·2
;   
;   represented as infinite streams. We will represent the series a₀ + a₁ x
;   + a₂ x² + a₃ x³ + ··· as the stream whose elements are the coefficients
;   a₀, a₁, a₂, a₃, ....
;   
;   a. The integral of the series a₀ + a₁ x + a₂ x² + a₃ x³ + ··· is the
;   series
;   
;             1        1        1
;   c = a₀x + ─ a₁x² + ─ a₂x3 + ─ a₃x⁴ + ···,
;             2        3        4
;   
;   where c is any constant. Define a procedure integrate-series that takes
;   as input a stream a₀, a₁, a₂, ... representing a power series and
;   returns the stream a₀, (1/2)a₁, (1/3)a₂, ... of coefficients of the
;   non-constant terms of the integral of the series. (Since the result has
;   no constant term, it doesn't represent a power series; when we use
;   integrate-series, we will cons on the appropriate constant.)
;   
;   b. The function x → e^x is its own derivative.  This implies that e^x
;   and the integral of e^x are the same series, except for the constant
;   term, which is e<sup>0</sup> = 1. Accordingly, we can generate the
;   series for e^x as
;   
;   (define exp-series
;     (cons-stream 1 (integrate-series exp-series)))
;   
;   Show how to generate the series for sine and cosine, starting from the
;   facts that the derivative of sine is cosine and the derivative of cosine
;   is the negative of sine:
;   
;   (define cosine-series
;     (cons-stream 1 <??>))
;   (define sine-series
;     (cons-stream 0 <??>))
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.59]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.59
;   [Section 2.5.3]: http://sicp-book.com/book-Z-H-18.html#%_sec_2.5.3
;   3.5.2 Infinite Streams - p332
;   ------------------------------------------------------------------------

(-start- "3.59")



(--end-- "3.59")

