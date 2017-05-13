#lang racket

(require "common.rkt")

;   Exercise 1.37
;   =============
;   
;   a. An infinite continued fraction is an expression of the form
;   
;               N₁
;   f = ──────────────────
;                 N₂
;       D₁ + ─────────────
;                    N₃
;            D₂ + ──────── 
;                      ·                  
;                 D₃ +  ·
;                        ·
;   
;   As an example, one can show that the infinite continued fraction
;   expansion with the Nᵢ and the Dᵢ all equal to 1 produces 1/ɸ, where ɸ is
;   the golden ratio (described in section [1.2.2]). One way to approximate
;   an infinite continued fraction is to truncate the expansion after a
;   given number of terms.  Such a truncation -- a so-called k-term finite
;   continued fraction -- has the form
;   
;        N₁
;   ────────────
;           N₂
;   D₁ + ───────
;       ·
;        ·    N
;         ·    ᵏ
;           + ──                   
;             D
;              ᵏ
;   
;   Suppose that n and d are procedures of one argument (the term index i)
;   that return the Nᵢ and Dᵢ of the terms of the continued fraction. 
;   Define a procedure cont-frac such that evaluating (cont-frac n d k)
;   computes the value of the k-term finite continued fraction.  Check your
;   procedure by approximating 1/ɸ using
;   
;   (cont-frac (lambda (i) 1.0)
;              (lambda (i) 1.0)
;              k)
;   
;   for successive values of k.  How large must you make k in order to get
;   an approximation that is accurate to 4 decimal places?
;   
;   b. If your cont-frac procedure generates a recursive process, write one
;   that generates an iterative process. If it generates an iterative
;   process, write one that generates a recursive process.
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.37]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.37
;   [Section 1.2.2]: http://sicp-book.com/book-Z-H-11.html#%_sec_1.2.2
;   1.3.3 Procedures as General Methods - p71
;   ------------------------------------------------------------------------

(-start- "1.37")



(--end-- "1.37")

