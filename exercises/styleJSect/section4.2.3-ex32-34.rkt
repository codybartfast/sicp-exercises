#lang racket

; Section 4.2.3: Streams as Lazy Lists

(require "common.rkt")

;   Exercise 4.32
;   =============
;   
;   Give some examples that illustrate the difference between the streams of
;   chapter 3 and the "lazier" lazy lists described in this section. How can
;   you take advantage of this extra laziness?
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.32]: http://sicp-book.com/book-Z-H-27.html#%_thm_4.32
;   4.2.3 Streams as Lazy Lists - p411
;   ------------------------------------------------------------------------

(-start- "4.32")



(--end-- "4.32")

;   ========================================================================
;   
;   Exercise 4.33
;   =============
;   
;   Ben Bitdiddle tests the lazy list implementation given above by
;   evaluating the expression
;   
;   (car '(a b c))
;   
;   To his surprise, this produces an error.  After some thought, he
;   realizes that the "lists" obtained by reading in quoted expressions are
;   different from the lists manipulated by the new definitions of cons,
;   car, and cdr.  Modify the evaluator's treatment of quoted expressions so
;   that quoted lists typed at the driver loop will produce true lazy lists.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.33]: http://sicp-book.com/book-Z-H-27.html#%_thm_4.33
;   4.2.3 Streams as Lazy Lists - p411
;   ------------------------------------------------------------------------

(-start- "4.33")



(--end-- "4.33")

;   ========================================================================
;   
;   Exercise 4.34
;   =============
;   
;   Modify the driver loop for the evaluator so that lazy pairs and lists
;   will print in some reasonable way.  (What are you going to do about
;   infinite lists?) You may also need to modify the representation of lazy
;   pairs so that the evaluator can identify them in order to print them.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.34]: http://sicp-book.com/book-Z-H-27.html#%_thm_4.34
;   4.2.3 Streams as Lazy Lists - p411
;   ------------------------------------------------------------------------

(-start- "4.34")



(--end-- "4.34")

