#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 1.40")

;   Exercise 1.40
;   =============
;   
;   Define a procedure cubic that can be used together with the
;   newtons-method procedure in expressions of the form
;   
;   (newtons-method (cubic a b c) 1)
;   
;   to approximate zeros of the cubic x³ + ax² + bx + c.
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.40]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.40
;   1.3.4 Procedures as Returned Values - p77
;   ------------------------------------------------------------------------