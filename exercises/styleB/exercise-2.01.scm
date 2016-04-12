#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 2.01")

;   Exercise 2.1
;   ============
;   
;   Define a better version of make-rat that handles both positive and
;   negative arguments.  Make-rat should normalize the sign so that if the
;   rational number is positive, both the numerator and denominator are
;   positive, and if the rational number is negative, only the numerator is
;   negative.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.1]:  http://sicp-book.com/book-Z-H-14.html#%_thm_2.1
;   2.1.1 Example: Arithmetic Operations for Rational Numbers - p87
;   ------------------------------------------------------------------------