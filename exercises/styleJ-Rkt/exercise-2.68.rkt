#lang racket

(require "common.rkt")

;   Exercise 2.68
;   =============
;   
;   The encode procedure takes as arguments a message and a tree and
;   produces the list of bits that gives the encoded message.
;   
;   (define (encode message tree)
;     (if (null? message)
;         '()
;         (append (encode-symbol (car message) tree)
;                 (encode (cdr message) tree))))
;   
;   Encode-symbol is a procedure, which you must write, that returns the
;   list of bits that encodes a given symbol according to a given tree.  You
;   should design encode-symbol so that it signals an error if the symbol is
;   not in the tree at all.  Test your procedure by encoding the result you
;   obtained in exercise [2.67] with the sample tree and seeing whether it
;   is the same as the original sample message.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.68]: http://sicp-book.com/book-Z-H-16.html#%_thm_2.68
;   [Exercise 2.67]: http://sicp-book.com/book-Z-H-16.html#%_thm_2.67
;   2.3.4 Example: Huffman Encoding Trees - p167
;   ------------------------------------------------------------------------

(-start- "2.68")



(--end-- "2.68")

