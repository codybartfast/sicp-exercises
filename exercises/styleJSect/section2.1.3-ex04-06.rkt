#lang racket

; Section 2.1.3: What Is Meant by Data?

(require "common.rkt")

;   Exercise 2.4
;   ============
;   
;   Here is an alternative procedural representation of pairs.  For this
;   representation, verify that (car (cons x y)) yields x for any objects x
;   and y.
;   
;   (define (cons x y)
;     (lambda (m) (m x y)))
;   
;   (define (car z)
;     (z (lambda (p q) p)))
;   
;   What is the corresponding definition of cdr? (Hint: To verify that this
;   works, make use of the substitution model of section [1.1.5].)
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.4]:  http://sicp-book.com/book-Z-H-14.html#%_thm_2.4
;   [Section 1.1.5]: http://sicp-book.com/book-Z-H-10.html#%_sec_1.1.5
;   2.1.3 What Is Meant by Data? - p92
;   ------------------------------------------------------------------------

(-start- "2.4")



(--end-- "2.4")

;   ========================================================================
;   
;   Exercise 2.5
;   ============
;   
;   Show that we can represent pairs of nonnegative integers using only
;   numbers and arithmetic operations if we represent the pair a and b as
;   the integer that is the product 2^a 3^b.  Give the corresponding
;   definitions of the procedures cons, car, and cdr.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.5]:  http://sicp-book.com/book-Z-H-14.html#%_thm_2.5
;   2.1.3 What Is Meant by Data? - p92
;   ------------------------------------------------------------------------

(-start- "2.5")



(--end-- "2.5")

;   ========================================================================
;   
;   Exercise 2.6
;   ============
;   
;   In case representing pairs as procedures wasn't mind-boggling enough,
;   consider that, in a language that can manipulate procedures, we can get
;   by without numbers (at least insofar as nonnegative integers are
;   concerned) by implementing 0 and the operation of adding 1 as
;   
;   (define zero (lambda (f) (lambda (x) x)))
;   
;   (define (add-1 n)
;     (lambda (f) (lambda (x) (f ((n f) x)))))
;   
;   This representation is known as Church numerals, after its inventor,
;   Alonzo Church, the logician who invented the λ calculus.
;   
;   Define one and two directly (not in terms of zero and add-1).  (Hint:
;   Use substitution to evaluate (add-1 zero)). Give a direct definition of
;   the addition procedure + (not in terms of repeated application of
;   add-1).
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.6]:  http://sicp-book.com/book-Z-H-14.html#%_thm_2.6
;   2.1.3 What Is Meant by Data? - p93
;   ------------------------------------------------------------------------

(-start- "2.6")



(--end-- "2.6")

