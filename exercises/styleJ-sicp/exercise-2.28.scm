#lang sicp

(#%require "common.scm")

;   Exercise 2.28
;   =============
;   
;   Write a procedure fringe that takes as argument a tree (represented as a
;   list) and returns a list whose elements are all the leaves of the tree
;   arranged in left-to-right order.  For example,
;   
;   (define x (list (list 1 2) (list 3 4)))
;   
;   (fringe x)
;   (1 2 3 4)
;   
;   (fringe (list x x))
;   (1 2 3 4 1 2 3 4)
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.28]: http://sicp-book.com/book-Z-H-15.html#%_thm_2.28
;   2.2.2 Hierarchical Structures - p111
;   ------------------------------------------------------------------------

(-start- "2.28")



(--end-- "2.28")

