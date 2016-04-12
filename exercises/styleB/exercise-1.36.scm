#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 1.36")

;   Exercise 1.36
;   =============
;   
;   Modify fixed-point so that it prints the sequence of approximations it
;   generates, using the newline and display primitives shown in exercise
;   [1.22].  Then find a solution to x^x = 1000 by finding a fixed point of
;   x → log(1000)/log(x).  (Use Scheme's primitive log procedure, which
;   computes natural logarithms.) Compare the number of steps this takes
;   with and without average damping.  (Note that you cannot start
;   fixed-point with a guess of 1, as this would cause division by log(1) =
;   0.)
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.36]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.36
;   [Exercise 1.22]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.22
;   1.3.3 Procedures as General Methods - p70
;   ------------------------------------------------------------------------