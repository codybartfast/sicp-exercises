#lang racket

(require "common.rkt")

;   Exercise 1.7
;   ============
;   
;   The good-enough? test used in computing square roots will not be very
;   effective for finding the square roots of very small numbers. Also, in
;   real computers, arithmetic operations are almost always performed with
;   limited precision.  This makes our test inadequate for very large
;   numbers.  Explain these statements, with examples showing how the test
;   fails for small and large numbers.  An alternative strategy for
;   implementing good-enough? is to watch how guess changes from one
;   iteration to the next and to stop when the change is a very small
;   fraction of the guess.  Design a square-root procedure that uses this
;   kind of end test.  Does this work better for small and large numbers?
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.7]:  http://sicp-book.com/book-Z-H-10.html#%_thm_1.7
;   1.1.7 Example: Square Roots by Newton's Method - p25
;   ------------------------------------------------------------------------

(-start- "1.7")



(--end-- "1.7")

