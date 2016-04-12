#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 2.65")

;   Exercise 2.65
;   =============
;   
;   Use the results of exercises [2.63] and [2.64] to give θ(n)
;   implementations of union-set and intersection-set for sets implemented
;   as (balanced) binary trees.⁽⁴¹⁾
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.65]: http://sicp-book.com/book-Z-H-16.html#%_thm_2.65
;   [Exercise 2.63]: http://sicp-book.com/book-Z-H-16.html#%_thm_2.63
;   [Exercise 2.64]: http://sicp-book.com/book-Z-H-16.html#%_thm_2.64
;   [Footnote 41]:   http://sicp-book.com/book-Z-H-16.html#footnote_Temp_254
;   2.3.3 Example: Representing Sets - p160
;   ------------------------------------------------------------------------