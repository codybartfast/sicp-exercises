#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 2.10")

;   Exercise 2.10
;   =============
;   
;   Ben Bitdiddle, an expert systems programmer, looks over Alyssa's
;   shoulder and comments that it is not clear what it means to divide by an
;   interval that spans zero.  Modify Alyssa's code to check for this
;   condition and to signal an error if it occurs.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.10]: http://sicp-book.com/book-Z-H-14.html#%_thm_2.10
;   2.1.4 Extended Exercise: Interval Arithmetic - p95
;   ------------------------------------------------------------------------