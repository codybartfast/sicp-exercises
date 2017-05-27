#lang sicp

(#%require "common.scm")

;   Exercise 2.22
;   =============
;   
;   Louis Reasoner tries to rewrite the first square-list procedure of
;   exercise [2.21] so that it evolves an iterative process:
;   
;   (define (square-list items)
;     (define (iter things answer)
;       (if (null? things)
;           answer
;           (iter (cdr things) 
;                 (cons (square (car things))
;                       answer))))
;     (iter items nil))
;   
;   Unfortunately, defining square-list this way produces the answer list in
;   the reverse order of the one desired.  Why?
;   
;   Louis then tries to fix his bug by interchanging the arguments to cons:
;   
;   (define (square-list items)
;     (define (iter things answer)
;       (if (null? things)
;           answer
;           (iter (cdr things)
;                 (cons answer
;                       (square (car things))))))
;     (iter items nil))
;   
;   This doesn't work either.  Explain.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.22]: http://sicp-book.com/book-Z-H-15.html#%_thm_2.22
;   [Exercise 2.21]: http://sicp-book.com/book-Z-H-15.html#%_thm_2.21
;   2.2.1 Representing Sequences - p106
;   ------------------------------------------------------------------------

(-start- "2.22")



(--end-- "2.22")

