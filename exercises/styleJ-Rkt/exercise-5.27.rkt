#lang racket

(require "common.rkt")

;   Exercise 5.27
;   =============
;   
;   For comparison with exercise [5.26], explore the behavior of the
;   following procedure for computing factorials recursively:
;   
;   (define (factorial n)
;     (if (= n 1)
;         1
;         (* (factorial (- n 1)) n)))
;   
;   By running this procedure with the monitored stack, determine, as a
;   function of n, the maximum depth of the stack and the total number of
;   pushes used in evaluating n! for n ≥ 1.  (Again, these functions will be
;   linear.) Summarize your experiments by filling in the following table
;   with the appropriate expressions in terms of n:
;   
;             Maximum depth Number of pushes
;   Recursive                               
;   factorial                               
;   Iterative                               
;   factorial                               
;   
;   The maximum depth is a measure of the amount of space used by the
;   evaluator in carrying out the computation, and the number of pushes
;   correlates well with the time required.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.27]: http://sicp-book.com/book-Z-H-34.html#%_thm_5.27
;   [Exercise 5.26]: http://sicp-book.com/book-Z-H-34.html#%_thm_5.26
;   5.4.4 Running the Evaluator - p564
;   ------------------------------------------------------------------------

(-start- "5.27")



(--end-- "5.27")

