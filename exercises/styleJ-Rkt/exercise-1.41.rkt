#lang racket

(require "common.rkt")

;   Exercise 1.41
;   =============
;   
;   Define a procedure double that takes a procedure of one argument as
;   argument and returns a procedure that applies the original procedure
;   twice.  For example, if inc is a procedure that adds 1 to its argument,
;   then (double inc) should be a procedure that adds 2.  What value is
;   returned by
;   
;   (((double (double double)) inc) 5)
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.41]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.41
;   1.3.4 Procedures as Returned Values - p77
;   ------------------------------------------------------------------------

(-start- "1.41")



(--end-- "1.41")

