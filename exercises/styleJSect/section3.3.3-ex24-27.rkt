#lang racket

; Section 3.3.3: Representing Tables

(require "common.rkt")

;   Exercise 3.24
;   =============
;   
;   In the table implementations above, the keys are tested for equality
;   using equal? (called by assoc).  This is not always the appropriate
;   test.  For instance, we might have a table with numeric keys in which we
;   don't need an exact match to the number we're looking up, but only a
;   number within some tolerance of it. Design a table constructor
;   make-table that takes as an argument a same-key? procedure that will be
;   used to test "equality" of keys.  Make-table should return a dispatch
;   procedure that can be used to access appropriate lookup and insert!
;   procedures for a local table.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.24]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.24
;   3.3.3 Representing Tables - p272
;   ------------------------------------------------------------------------

(-start- "3.24")



(--end-- "3.24")

;   ========================================================================
;   
;   Exercise 3.25
;   =============
;   
;   Generalizing one- and two-dimensional tables, show how to implement a
;   table in which values are stored under an arbitrary number of keys and
;   different values may be stored under different numbers of keys.  The
;   lookup and insert! procedures should take as input a list of keys used
;   to access the table.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.25]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.25
;   3.3.3 Representing Tables - p272
;   ------------------------------------------------------------------------

(-start- "3.25")



(--end-- "3.25")

;   ========================================================================
;   
;   Exercise 3.26
;   =============
;   
;   To search a table as implemented above, one needs to scan through the
;   list of records.  This is basically the unordered list representation of
;   section [2.3.3].  For large tables, it may be more efficient to
;   structure the table in a different manner.  Describe a table
;   implementation where the (key, value) records are organized using a
;   binary tree, assuming that keys can be ordered in some way (e.g.,
;   numerically or alphabetically).  (Compare exercise [2.66] of chapter 2.)
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.26]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.26
;   [Section 2.3.3]: http://sicp-book.com/book-Z-H-16.html#%_sec_2.3.3
;   [Exercise 2.66]: http://sicp-book.com/book-Z-H-22.html#%_thm_2.66
;   3.3.3 Representing Tables - p272
;   ------------------------------------------------------------------------

(-start- "3.26")



(--end-- "3.26")

;   ========================================================================
;   
;   Exercise 3.27
;   =============
;   
;   Memoization (also called tabulation) is a technique that enables a
;   procedure to record, in a local table, values that have previously been
;   computed.  This technique can make a vast difference in the performance
;   of a program.  A memoized procedure maintains a table in which values of
;   previous calls are stored using as keys the arguments that produced the
;   values.  When the memoized procedure is asked to compute a value, it
;   first checks the table to see if the value is already there and, if so,
;   just returns that value.  Otherwise, it computes the new value in the
;   ordinary way and stores this in the table.  As an example of
;   memoization, recall from section [1.2.2] the exponential process for
;   computing Fibonacci numbers:
;   
;   (define (fib n)
;     (cond ((= n 0) 0)
;           ((= n 1) 1)
;           (else (+ (fib (- n 1))
;                    (fib (- n 2))))))
;   
;   The memoized version of the same procedure is
;   
;   (define memo-fib
;     (memoize (lambda (n)
;                (cond ((= n 0) 0)
;                      ((= n 1) 1)
;                      (else (+ (memo-fib (- n 1))
;                               (memo-fib (- n 2))))))))
;   
;   where the memoizer is defined as
;   
;   (define (memoize f)
;     (let ((table (make-table)))
;       (lambda (x)
;         (let ((previously-computed-result (lookup x table)))
;           (or previously-computed-result
;               (let ((result (f x)))
;                 (insert! x result table)
;                 result))))))
;   
;   Draw an environment diagram to analyze the computation of (memo-fib 3). 
;   Explain why memo-fib computes the nth Fibonacci number in a number of
;   steps proportional to n. Would the scheme still work if we had simply
;   defined memo-fib to be (memoize fib)?
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.27]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.27
;   [Section 1.2.2]: http://sicp-book.com/book-Z-H-11.html#%_sec_1.2.2
;   3.3.3 Representing Tables - p272
;   ------------------------------------------------------------------------

(-start- "3.27")



(--end-- "3.27")

