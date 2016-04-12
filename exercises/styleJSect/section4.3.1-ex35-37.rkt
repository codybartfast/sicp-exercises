#lang racket

; Section 4.3.1: Amb and Search

(require "common.rkt")

;   Exercise 4.35
;   =============
;   
;   Write a procedure an-integer-between that returns an integer between two
;   given bounds.  This can be used to implement a procedure that finds
;   Pythagorean triples, i.e., triples of integers (i,j,k) between the given
;   bounds such that i ≤ j and i² + j² = k², as follows:
;   
;   (define (a-pythagorean-triple-between low high)
;     (let ((i (an-integer-between low high)))
;       (let ((j (an-integer-between i high)))
;         (let ((k (an-integer-between j high)))
;           (require (= (+ (* i i) (* j j)) (* k k)))
;           (list i j k)))))
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.35]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.35
;   4.3.1 Amb and Search - p417
;   ------------------------------------------------------------------------

(-start- "4.35")



(--end-- "4.35")

;   ========================================================================
;   
;   Exercise 4.36
;   =============
;   
;   Exercise [3.69] discussed how to generate the stream of all Pythagorean
;   triples, with no upper bound on the size of the integers to be searched.
;   Explain why simply replacing an-integer-between by
;   an-integer-starting-from in the procedure in exercise [4.35] is not an
;   adequate way to generate arbitrary Pythagorean triples.  Write a
;   procedure that actually will accomplish this.  (That is, write a
;   procedure for which repeatedly typing try-again would in principle
;   eventually generate all Pythagorean triples.)
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.36]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.36
;   [Exercise 3.69]: http://sicp-book.com/book-Z-H-28.html#%_thm_3.69
;   [Exercise 4.35]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.35
;   4.3.1 Amb and Search - p417
;   ------------------------------------------------------------------------

(-start- "4.36")



(--end-- "4.36")

;   ========================================================================
;   
;   Exercise 4.37
;   =============
;   
;   Ben Bitdiddle claims that the following method for generating
;   Pythagorean triples is more efficient than the one in exercise [4.35]. 
;   Is he correct?  (Hint: Consider the number of possibilities that must be
;   explored.)
;   
;   (define (a-pythagorean-triple-between low high)
;     (let ((i (an-integer-between low high))
;           (hsq (* high high)))
;       (let ((j (an-integer-between i high)))
;         (let ((ksq (+ (* i i) (* j j))))
;           (require (>= hsq ksq))
;           (let ((k (sqrt ksq)))
;             (require (integer? k))
;             (list i j k))))))
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.37]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.37
;   [Exercise 4.35]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.35
;   4.3.1 Amb and Search - p418
;   ------------------------------------------------------------------------

(-start- "4.37")



(--end-- "4.37")

