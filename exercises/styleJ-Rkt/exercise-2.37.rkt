#lang racket

(require "common.rkt")

;   Exercise 2.37
;   =============
;   
;   Suppose we represent vectors v = (vᵢ) as sequences of numbers, and
;   matrices m = (m_(ij)) as sequences of vectors (the rows of the matrix).
;   For example, the matrix
;   
;   │1 2 3 4│
;   │4 5 6 6│
;   │6 7 8 9│
;   
;   is represented as the sequence ((1 2 3 4) (4 5 6 6) (6 7 8 9)). With
;   this representation, we can use sequence operations to concisely express
;   the basic matrix and vector operations.  These operations (which are
;   described in any book on matrix algebra) are the following:
;   
;   (dot-product v w)       returns the sum ∑ᵢ vᵢwᵢ
;   
;   (matrix-*-vector m v)   returns the vector t, where t  = ∑ m  v
;                                                        i    J ij j
;   
;   (matrix-*-matrix m n)   returns the matrix p, where p  = ∑ m  n
;                                                        ij   k ik kj
;   
;   (transpose m)           returns the matrix n, where n   = m
;                                                        ij    ji
;   
;   We can define the dot product as⁽¹⁷⁾
;   
;   (define (dot-product v w)
;     (accumulate + 0 (map * v w)))
;   
;   Fill in the missing expressions in the following procedures for
;   computing the other matrix operations.  (The procedure accumulate-n is
;   defined in exercise [2.36].)
;   
;   (define (matrix-*-vector m v)
;     (map <??> m))
;   (define (transpose mat)
;     (accumulate-n <??> <??> mat))
;   (define (matrix-*-matrix m n)
;     (let ((cols (transpose n)))
;       (map <??> m)))
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.37]: http://sicp-book.com/book-Z-H-15.html#%_thm_2.37
;   [Exercise 2.36]: http://sicp-book.com/book-Z-H-15.html#%_thm_2.36
;   [Footnote 17]:   http://sicp-book.com/book-Z-H-15.html#footnote_Temp_190
;   2.2.3 Sequences as Conventional Interfaces - p120
;   ------------------------------------------------------------------------

(-start- "2.37")



(--end-- "2.37")

