#lang racket

; Section 3.1.1: Local State Variables

(require "common.rkt")

;   Exercise 3.1
;   ============
;   
;   An accumulator is a procedure that is called repeatedly with a single
;   numeric argument and accumulates its arguments into a sum. Each time it
;   is called, it returns the currently accumulated sum. Write a procedure
;   make-accumulator that generates accumulators, each maintaining an
;   independent sum.  The input to make-accumulator should specify the
;   initial value of the sum; for example
;   
;   (define A (make-accumulator 5))
;   (A 10)
;   15
;   (A 10)
;   25
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.1]:  http://sicp-book.com/book-Z-H-20.html#%_thm_3.1
;   3.1.1 Local State Variables - p224
;   ------------------------------------------------------------------------

(-start- "3.1")



(--end-- "3.1")

;   ========================================================================
;   
;   Exercise 3.2
;   ============
;   
;   In software-testing applications, it is useful to be able to count the
;   number of times a given procedure is called during the course of a
;   computation.  Write a procedure make-monitored that takes as input a
;   procedure, f, that itself takes one input.  The result returned by
;   make-monitored is a third procedure, say mf, that keeps track of the
;   number of times it has been called by maintaining an internal counter. 
;   If the input to mf is the special symbol how-many-calls?, then mf
;   returns the value of the counter.  If the input is the special symbol
;   reset-count, then mf resets the counter to zero.  For any other input,
;   mf returns the result of calling f on that input and increments the
;   counter.  For instance, we could make a monitored version of the sqrt
;   procedure:
;   
;   (define s (make-monitored sqrt))
;   
;   (s 100)
;   10
;   
;   (s 'how-many-calls?)
;   1
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.2]:  http://sicp-book.com/book-Z-H-20.html#%_thm_3.2
;   3.1.1 Local State Variables - p224
;   ------------------------------------------------------------------------

(-start- "3.2")



(--end-- "3.2")

;   ========================================================================
;   
;   Exercise 3.3
;   ============
;   
;   Modify the make-account procedure so that it creates password-protected
;   accounts.  That is, make-account should take a symbol as an additional
;   argument, as in
;   
;   (define acc (make-account 100 'secret-password))
;   
;   The resulting account object should process a request only if it is
;   accompanied by the password with which the account was created, and
;   should otherwise return a complaint:
;   
;   ((acc 'secret-password 'withdraw) 40)
;   60
;   
;   ((acc 'some-other-password 'deposit) 50)
;   
;   "Incorrect password"
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.3]:  http://sicp-book.com/book-Z-H-20.html#%_thm_3.3
;   3.1.1 Local State Variables - p225
;   ------------------------------------------------------------------------

(-start- "3.3")



(--end-- "3.3")

;   ========================================================================
;   
;   Exercise 3.4
;   ============
;   
;   Modify the make-account procedure of exercise [3.3] by adding another
;   local state variable so that, if an account is accessed more than seven
;   consecutive times with an incorrect password, it invokes the procedure
;   call-the-cops.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.4]:  http://sicp-book.com/book-Z-H-20.html#%_thm_3.4
;   [Exercise 3.3]:  http://sicp-book.com/book-Z-H-20.html#%_thm_3.3
;   3.1.1 Local State Variables - p225
;   ------------------------------------------------------------------------

(-start- "3.4")



(--end-- "3.4")

