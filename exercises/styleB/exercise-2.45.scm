#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 2.45")

;   Exercise 2.45
;   =============
;   
;   Right-split and up-split can be expressed as instances of a general
;   splitting operation. Define a procedure split with the property that
;   evaluating
;   
;   (define right-split (split beside below))
;   (define up-split (split below beside))
;   
;   produces procedures right-split and up-split with the same behaviors as
;   the ones already defined.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.45]: http://sicp-book.com/book-Z-H-15.html#%_thm_2.45
;   2.2.4 Example: A Picture Language - p134
;   ------------------------------------------------------------------------