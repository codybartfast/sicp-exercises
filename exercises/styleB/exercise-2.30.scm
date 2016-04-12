#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 2.30")

;   Exercise 2.30
;   =============
;   
;   Define a procedure square-tree analogous to the square-list procedure of
;   exercise [2.21].  That is, square-list should behave as follows:
;   
;   (square-tree
;    (list 1
;          (list 2 (list 3 4) 5)
;          (list 6 7)))
;   (1 (4 (9 16) 25) (36 49))
;   
;   Define square-tree both directly (i.e., without using any higher-order
;   procedures) and also by using map and recursion.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.30]: http://sicp-book.com/book-Z-H-15.html#%_thm_2.30
;   [Exercise 2.21]: http://sicp-book.com/book-Z-H-15.html#%_thm_2.21
;   2.2.2 Hierarchical Structures - p112
;   ------------------------------------------------------------------------