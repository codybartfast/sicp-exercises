#lang racket

; Section 2.1.4: Extended Exercise: Interval Arithmetic

(require "common.rkt")

;   Exercise 2.7
;   ============
;   
;   Alyssa's program is incomplete because she has not specified the
;   implementation of the interval abstraction.  Here is a definition of the
;   interval constructor:
;   
;   (define (make-interval a b) (cons a b))
;   
;   Define selectors upper-bound and lower-bound to complete the
;   implementation.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.7]:  http://sicp-book.com/book-Z-H-14.html#%_thm_2.7
;   2.1.4 Extended Exercise: Interval Arithmetic - p94
;   ------------------------------------------------------------------------

(-start- "2.7")



(--end-- "2.7")

;   ========================================================================
;   
;   Exercise 2.8
;   ============
;   
;   Using reasoning analogous to Alyssa's, describe how the difference of
;   two intervals may be computed.  Define a corresponding subtraction
;   procedure, called sub-interval.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.8]:  http://sicp-book.com/book-Z-H-14.html#%_thm_2.8
;   2.1.4 Extended Exercise: Interval Arithmetic - p95
;   ------------------------------------------------------------------------

(-start- "2.8")



(--end-- "2.8")

;   ========================================================================
;   
;   Exercise 2.9
;   ============
;   
;   The width of an interval is half of the difference between its upper and
;   lower bounds.  The width is a measure of the uncertainty of the number
;   specified by the interval.  For some arithmetic operations the width of
;   the result of combining two intervals is a function only of the widths
;   of the argument intervals, whereas for others the width of the
;   combination is not a function of the widths of the argument intervals. 
;   Show that the width of the sum (or difference) of two intervals is a
;   function only of the widths of the intervals being added (or
;   subtracted).  Give examples to show that this is not true for
;   multiplication or division.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.9]:  http://sicp-book.com/book-Z-H-14.html#%_thm_2.9
;   2.1.4 Extended Exercise: Interval Arithmetic - p95
;   ------------------------------------------------------------------------

(-start- "2.9")



(--end-- "2.9")

;   ========================================================================
;   
;   Exercise 2.10
;   =============
;   
;   Ben Bitdiddle, an expert systems programmer, looks over Alyssa's
;   shoulder and comments that it is not clear what it means to divide by an
;   interval that spans zero.  Modify Alyssa's code to check for this
;   condition and to signal an error if it occurs.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.10]: http://sicp-book.com/book-Z-H-14.html#%_thm_2.10
;   2.1.4 Extended Exercise: Interval Arithmetic - p95
;   ------------------------------------------------------------------------

(-start- "2.10")



(--end-- "2.10")

;   ========================================================================
;   
;   Exercise 2.11
;   =============
;   
;   In passing, Ben also cryptically comments: "By testing the signs of the
;   endpoints of the intervals, it is possible to break mul-interval into
;   nine cases, only one of which requires more than two multiplications."
;   Rewrite this procedure using Ben's suggestion.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.11]: http://sicp-book.com/book-Z-H-14.html#%_thm_2.11
;   2.1.4 Extended Exercise: Interval Arithmetic - p95
;   ------------------------------------------------------------------------

(-start- "2.11")



(--end-- "2.11")

;   ========================================================================
;   
;   Exercise 2.12
;   =============
;   
;   Define a constructor make-center-percent that takes a center and a
;   percentage tolerance and produces the desired interval.  You must also
;   define a selector percent that produces the percentage tolerance for a
;   given interval.  The center selector is the same as the one shown above.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.12]: http://sicp-book.com/book-Z-H-14.html#%_thm_2.12
;   2.1.4 Extended Exercise: Interval Arithmetic - p96
;   ------------------------------------------------------------------------

(-start- "2.12")



(--end-- "2.12")

;   ========================================================================
;   
;   Exercise 2.13
;   =============
;   
;   Show that under the assumption of small percentage tolerances there is a
;   simple formula for the approximate percentage tolerance of the product
;   of two intervals in terms of the tolerances of the factors. You may
;   simplify the problem by assuming that all numbers are positive.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.13]: http://sicp-book.com/book-Z-H-14.html#%_thm_2.13
;   2.1.4 Extended Exercise: Interval Arithmetic - p96
;   ------------------------------------------------------------------------

(-start- "2.13")



(--end-- "2.13")

;   ========================================================================
;   
;   Exercise 2.14
;   =============
;   
;   Demonstrate that Lem is right. Investigate the behavior of the system on
;   a variety of arithmetic expressions. Make some intervals A and B, and
;   use them in computing the expressions A/A and A/B.  You will get the
;   most insight by using intervals whose width is a small percentage of the
;   center value. Examine the results of the computation in center-percent
;   form (see exercise [2.12]).
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.14]: http://sicp-book.com/book-Z-H-14.html#%_thm_2.14
;   [Exercise 2.12]: http://sicp-book.com/book-Z-H-14.html#%_thm_2.12
;   2.1.4 Extended Exercise: Interval Arithmetic - p97
;   ------------------------------------------------------------------------

(-start- "2.14")



(--end-- "2.14")

;   ========================================================================
;   
;   Exercise 2.15
;   =============
;   
;   Eva Lu Ator, another user, has also noticed the different intervals
;   computed by different but algebraically equivalent expressions. She says
;   that a formula to compute with intervals using Alyssa's system will
;   produce tighter error bounds if it can be written in such a form that no
;   variable that represents an uncertain number is repeated. Thus, she
;   says, par2 is a "better" program for parallel resistances than par1.  Is
;   she right?  Why?
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.15]: http://sicp-book.com/book-Z-H-14.html#%_thm_2.15
;   2.1.4 Extended Exercise: Interval Arithmetic - p97
;   ------------------------------------------------------------------------

(-start- "2.15")



(--end-- "2.15")

;   ========================================================================
;   
;   Exercise 2.16
;   =============
;   
;   Explain, in general, why equivalent algebraic expressions may lead to
;   different answers.  Can you devise an interval-arithmetic package that
;   does not have this shortcoming, or is this task impossible?  (Warning:
;   This problem is very difficult.)
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.16]: http://sicp-book.com/book-Z-H-14.html#%_thm_2.16
;   2.1.4 Extended Exercise: Interval Arithmetic - p97
;   ------------------------------------------------------------------------

(-start- "2.16")



(--end-- "2.16")

