#lang sicp

(#%require "common.scm")

;   Exercise 3.36
;   =============
;   
;   Suppose we evaluate the following sequence of expressions in the global
;   environment:
;   
;   (define a (make-connector))
;   (define b (make-connector))
;   (set-value! a 10 'user)
;   
;   At some time during evaluation of the set-value!, the following
;   expression from the connector's local procedure is evaluated:
;   
;   (for-each-except setter inform-about-value constraints)
;   
;   Draw an environment diagram showing the environment in which the above
;   expression is evaluated.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.36]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.36
;   3.3.5 Propagation of Constraints - p295
;   ------------------------------------------------------------------------

(-start- "3.36")



(--end-- "3.36")

