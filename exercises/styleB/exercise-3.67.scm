#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 3.67")

;   Exercise 3.67
;   =============
;   
;   Modify the pairs procedure so that (pairs integers integers) will
;   produce the stream of all pairs of integers (i,j) (without the condition
;   i ≤ j).  Hint: You will need to mix in an additional stream.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.67]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.67
;   3.5.3 Exploiting the Stream Paradigm - p341
;   ------------------------------------------------------------------------