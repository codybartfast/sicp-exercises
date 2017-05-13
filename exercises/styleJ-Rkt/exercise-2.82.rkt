#lang racket

(require "common.rkt")

;   Exercise 2.82
;   =============
;   
;   Show how to generalize apply-generic to handle coercion in the general
;   case of multiple arguments.  One strategy is to attempt to coerce all
;   the arguments to the type of the first argument, then to the type of the
;   second argument, and so on.  Give an example of a situation where this
;   strategy (and likewise the two-argument version given above) is not
;   sufficiently general.  (Hint: Consider the case where there are some
;   suitable mixed-type operations present in the table that will not be
;   tried.)
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.82]: http://sicp-book.com/book-Z-H-18.html#%_thm_2.82
;   2.5.2 Combining Data of Different Types - p201
;   ------------------------------------------------------------------------

(-start- "2.82")



(--end-- "2.82")

