#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 2.77")

;   Exercise 2.77
;   =============
;   
;   Louis Reasoner tries to evaluate the expression (magnitude z) where z is
;   the object shown in figure [2.24].  To his surprise, instead of the
;   answer 5 he gets an error message from apply-generic, saying there is no
;   method for the operation magnitude on the types (complex). He shows this
;   interaction to Alyssa P. Hacker, who says "The problem is that the
;   complex-number selectors were never defined for complex numbers, just
;   for polar and rectangular numbers.  All you have to do to make this work
;   is add the following to the complex package:"
;   
;   (put 'real-part '(complex) real-part)
;   (put 'imag-part '(complex) imag-part)
;   (put 'magnitude '(complex) magnitude)
;   (put 'angle '(complex) angle)
;   
;   Describe in detail why this works.  As an example, trace through all the
;   procedures called in evaluating the expression (magnitude z) where z is
;   the object shown in figure [2.24].  In particular, how many times is
;   apply-generic invoked?  What procedure is dispatched to in each case?
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.77]: http://sicp-book.com/book-Z-H-18.html#%_thm_2.77
;   [Figure 2.24]:   http://sicp-book.com/book-Z-H-18.html#%_fig_2.24
;   2.5.1 Generic Arithmetic Operations - p192
;   ------------------------------------------------------------------------