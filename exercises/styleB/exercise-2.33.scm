#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 2.33")

;   Exercise 2.33
;   =============
;   
;   Fill in the missing expressions to complete the following definitions of
;   some basic list-manipulation operations as accumulations:
;   
;   (define (map p sequence)
;     (accumulate (lambda (x y) <??>) nil sequence))
;   (define (append seq1 seq2)
;     (accumulate cons <??> <??>))
;   (define (length sequence)
;     (accumulate <??> 0 sequence))
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.33]: http://sicp-book.com/book-Z-H-15.html#%_thm_2.33
;   2.2.3 Sequences as Conventional Interfaces - p119
;   ------------------------------------------------------------------------