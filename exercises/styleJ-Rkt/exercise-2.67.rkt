#lang racket

(require "common.rkt")

;   Exercise 2.67
;   =============
;   
;   Define an encoding tree and a sample message:
;   
;   (define sample-tree
;     (make-code-tree (make-leaf 'A 4)
;                     (make-code-tree
;                      (make-leaf 'B 2)
;                      (make-code-tree (make-leaf 'D 1)
;                                      (make-leaf 'C 1)))))
;   
;   (define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
;   
;   Use the decode procedure to decode the message, and give the result.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.67]: http://sicp-book.com/book-Z-H-16.html#%_thm_2.67
;   2.3.4 Example: Huffman Encoding Trees - p167
;   ------------------------------------------------------------------------

(-start- "2.67")



(--end-- "2.67")

