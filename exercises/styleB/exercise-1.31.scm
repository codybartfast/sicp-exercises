#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 1.31")

;   Exercise 1.31
;   =============
;   
;   a.  The sum procedure is only the simplest of a vast number of similar
;   abstractions that can be captured as higher-order procedures.⁽⁵¹⁾ Write
;   an analogous procedure called product that returns the product of the
;   values of a function at points over a given range. Show how to define
;   factorial in terms of product.  Also use product to compute
;   approximations to π using the formula⁽⁵²⁾
;   
;   π   2·4·4·6·6·8···
;   ─ = ──────────────
;   4   3·3·5·5·7·7···
;   
;   b.  If your product procedure generates a recursive process, write one
;   that generates an iterative process. If it generates an iterative
;   process, write one that generates a recursive process.
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.31]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.31
;   [Footnote 51]:   http://sicp-book.com/book-Z-H-12.html#footnote_Temp_95
;   [Footnote 52]:   http://sicp-book.com/book-Z-H-12.html#footnote_Temp_96
;   1.3.1 Procedures as Arguments - p60
;   ------------------------------------------------------------------------