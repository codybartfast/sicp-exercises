#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 5.25")

;   Exercise 5.25
;   =============
;   
;   Modify the evaluator so that it uses normal-order evaluation, based on
;   the lazy evaluator of section [4.2].
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.25]: http://sicp-book.com/book-Z-H-34.html#%_thm_5.25
;   [Section 4.2]:   http://sicp-book.com/book-Z-H-27.html#%_sec_4.2
;   5.4.3 Conditionals, Assignments, and Definitions - p560
;   ------------------------------------------------------------------------