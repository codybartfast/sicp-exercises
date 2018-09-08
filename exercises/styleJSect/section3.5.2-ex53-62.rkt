#lang racket

; Section 3.5.2: Infinite Streams

(require "common.rkt")

;   Exercise 3.53
;   =============
;   
;   Without running the program, describe the elements of the stream defined
;   by
;   
;   (define s (cons-stream 1 (add-streams s s)))
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.53]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.53
;   3.5.2 Infinite Streams - p330
;   ------------------------------------------------------------------------

(-start- "3.53")



(--end-- "3.53")

;   ========================================================================
;   
;   Exercise 3.54
;   =============
;   
;   Define a procedure mul-streams, analogous to add-streams, that produces
;   the elementwise product of its two input streams. Use this together with
;   the stream of integers to complete the following definition of the
;   stream whose nth element (counting from 0) is n + 1 factorial:
;   
;   (define factorials (cons-stream 1 (mul-streams <??> <??>)))
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.54]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.54
;   3.5.2 Infinite Streams - p331
;   ------------------------------------------------------------------------

(-start- "3.54")



(--end-- "3.54")

;   ========================================================================
;   
;   Exercise 3.55
;   =============
;   
;   Define a procedure partial-sums that takes as argument a stream S and
;   returns the stream whose elements are S₀, S₀ + S₁, S₀ + S₁ + S₂, .... 
;   For example, (partial-sums integers) should be the stream 1, 3, 6, 10,
;   15, ....
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.55]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.55
;   3.5.2 Infinite Streams - p331
;   ------------------------------------------------------------------------

(-start- "3.55")



(--end-- "3.55")

;   ========================================================================
;   
;   Exercise 3.56
;   =============
;   
;   A famous problem, first raised by R. Hamming, is to enumerate, in
;   ascending order with no repetitions, all positive integers with no prime
;   factors other than 2, 3, or 5.  One obvious way to do this is to simply
;   test each integer in turn to see whether it has any factors other than
;   2, 3, and 5.  But this is very inefficient, since, as the integers get
;   larger, fewer and fewer of them fit the requirement.  As an alternative,
;   let us call the required stream of numbers S and notice the following
;   facts about it.
;   
;   * S begins with 1.
;   
;   * The elements of (scale-stream S 2) are also elements of S.
;   
;   * The same is true for (scale-stream S 3) and (scale-stream 5 S).
;   
;   * These are all the elements of S.
;   
;   Now all we have to do is combine elements from these sources. For this
;   we define a procedure merge that combines two ordered streams into one
;   ordered result stream, eliminating repetitions:
;   
;   (define (merge s1 s2)
;     (cond ((stream-null? s1) s2)
;           ((stream-null? s2) s1)
;           (else
;            (let ((s1car (stream-car s1))
;                  (s2car (stream-car s2)))
;              (cond ((< s1car s2car)
;                     (cons-stream s1car (merge (stream-cdr s1) s2)))
;                    ((> s1car s2car)
;                     (cons-stream s2car (merge s1 (stream-cdr s2))))
;                    (else
;                     (cons-stream s1car
;                                  (merge (stream-cdr s1)
;                                         (stream-cdr s2)))))))))
;   
;   Then the required stream may be constructed with merge, as follows:
;   
;   (define S (cons-stream 1 (merge <??> <??>)))
;   
;   Fill in the missing expressions in the places marked <??> above.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.56]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.56
;   3.5.2 Infinite Streams - p331
;   ------------------------------------------------------------------------

(-start- "3.56")



(--end-- "3.56")

;   ========================================================================
;   
;   Exercise 3.57
;   =============
;   
;   How many additions are performed when we compute the nth Fibonacci
;   number using the definition of fibs based on the add-streams procedure? 
;   Show that the number of additions would be exponentially greater if we
;   had implemented (delay <exp>) simply as (lambda () <exp>), without using
;   the optimization provided by the memo-proc procedure described in
;   section [3.5.1].⁽⁶⁴⁾
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.57]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.57
;   [Section 3.5.1]: http://sicp-book.com/book-Z-H-24.html#%_sec_3.5.1
;   [Footnote 64]:   http://sicp-book.com/book-Z-H-24.html#footnote_Temp_465
;   3.5.2 Infinite Streams - p332
;   ------------------------------------------------------------------------

(-start- "3.57")



(--end-- "3.57")

;   ========================================================================
;   
;   Exercise 3.58
;   =============
;   
;   Give an interpretation of the stream computed by the following
;   procedure:
;   
;   (define (expand num den radix)
;     (cons-stream
;      (quotient (* num radix) den)
;      (expand (remainder (* num radix) den) den radix)))
;   
;   (Quotient is a primitive that returns the integer quotient of two
;   integers.) What are the successive elements produced by (expand 1 7 10)
;   ?  What is produced by (expand 3 8 10) ?
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.58]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.58
;   3.5.2 Infinite Streams - p332
;   ------------------------------------------------------------------------

(-start- "3.58")



(--end-- "3.58")

;   ========================================================================
;   
;   Exercise 3.59
;   =============
;   
;   In section [2.5.3] we saw how to implement a polynomial arithmetic
;   system representing polynomials as lists of terms.  In a similar way, we
;   can work with power series, such as
;   
;                x²    x³     x⁴
;   eˣ = 1 + x + ── + ─── + ───── + ···,
;                2    3·2   4·3·2
;   
;               r²     r⁴
;   cos x = 1 - ── + ───── - ···,
;               2    4·3·2
;   
;               r²      r⁴
;   cos x = 1 - ──  + ───── - ···,
;               2     4·3·2
;   
;   represented as infinite streams. We will represent the series a₀ + a₁ x
;   + a₂ x² + a₃ x³ + ··· as the stream whose elements are the coefficients
;   a₀, a₁, a₂, a₃, ....
;   
;   a. The integral of the series a₀ + a₁ x + a₂ x² + a₃ x³ + ··· is the
;   series
;   
;             1        1        1
;   c = a₀x + ─ a₁x² + ─ a₂x3 + ─ a₃x⁴ + ···,
;             2        3        4
;   
;   where c is any constant. Define a procedure integrate-series that takes
;   as input a stream a₀, a₁, a₂, ... representing a power series and
;   returns the stream a₀, (1/2)a₁, (1/3)a₂, ... of coefficients of the
;   non-constant terms of the integral of the series. (Since the result has
;   no constant term, it doesn't represent a power series; when we use
;   integrate-series, we will cons on the appropriate constant.)
;   
;   b. The function x → e^x is its own derivative.  This implies that e^x
;   and the integral of e^x are the same series, except for the constant
;   term, which is e⁰ = 1. Accordingly, we can generate the series for e^x
;   as
;   
;   (define exp-series
;     (cons-stream 1 (integrate-series exp-series)))
;   
;   Show how to generate the series for sine and cosine, starting from the
;   facts that the derivative of sine is cosine and the derivative of cosine
;   is the negative of sine:
;   
;   (define cosine-series
;     (cons-stream 1 <??>))
;   (define sine-series
;     (cons-stream 0 <??>))
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.59]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.59
;   [Section 2.5.3]: http://sicp-book.com/book-Z-H-18.html#%_sec_2.5.3
;   3.5.2 Infinite Streams - p332
;   ------------------------------------------------------------------------

(-start- "3.59")



(--end-- "3.59")

;   ========================================================================
;   
;   Exercise 3.60
;   =============
;   
;   With power series represented as streams of coefficients as in exercise
;   [3.59], adding series is implemented by add-streams.  Complete the
;   definition of the following procedure for multiplying series:
;   
;   (define (mul-series s1 s2)
;     (cons-stream <??> (add-streams <??> <??>)))
;   
;   You can test your procedure by verifying that sin² x + cos² x = 1, using
;   the series from exercise [3.59].
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.60]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.60
;   [Exercise 3.59]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.59
;   3.5.2 Infinite Streams - p333
;   ------------------------------------------------------------------------

(-start- "3.60")



(--end-- "3.60")

;   ========================================================================
;   
;   Exercise 3.61
;   =============
;   
;   Let S be a power series (exercise [3.59]) whose constant term is 1. 
;   Suppose we want to find the power series 1/S, that is, the series X such
;   that S · X = 1.  Write S = 1 + S_(R) where S_(R) is the part of S after
;   the constant term.  Then we can solve for X as follows:
;   
;             S·X = 1
;   (1 + S_(R))·X = 1
;     X + S_(R)·X = 1
;               X = 1 - SR·X
;   
;   In other words, X is the power series whose constant term is 1 and whose
;   higher-order terms are given by the negative of S_(R) times X. Use this
;   idea to write a procedure invert-unit-series that computes 1/S for a
;   power series S with constant term 1. You will need to use mul-series
;   from exercise [3.60].
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.61]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.61
;   [Exercise 3.59]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.59
;   [Exercise 3.60]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.60
;   3.5.2 Infinite Streams - p333
;   ------------------------------------------------------------------------

(-start- "3.61")



(--end-- "3.61")

;   ========================================================================
;   
;   Exercise 3.62
;   =============
;   
;   Use the results of exercises [3.60] and [3.61] to define a procedure
;   div-series that divides two power series.  Div-series should work for
;   any two series, provided that the denominator series begins with a
;   nonzero constant term.  (If the denominator has a zero constant term,
;   then div-series should signal an error.) Show how to use div-series
;   together with the result of exercise [3.59] to generate the power series
;   for tangent.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.62]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.62
;   [Exercise 3.60]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.60
;   [Exercise 3.61]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.61
;   [Exercise 3.59]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.59
;   3.5.2 Infinite Streams - p334
;   ------------------------------------------------------------------------

(-start- "3.62")



(--end-- "3.62")

