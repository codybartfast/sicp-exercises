#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 1.30")

;   Exercise 1.30
;   =============
;   
;   The sum procedure above generates a linear recursion.  The procedure can
;   be rewritten so that the sum is performed iteratively. Show how to do
;   this by filling in the missing expressions in the following definition:
;   
;   (define (sum term a next b)
;     (define (iter a result)
;       (if <??>
;           <??>
;           (iter <??> <??>)))
;     (iter <??> <??>))
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.30]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.30
;   1.3.1 Procedures as Arguments - p60
;   ------------------------------------------------------------------------