#lang racket

(require "common.rkt")

;   Exercise 2.69
;   =============
;   
;   The following procedure takes as its argument a list of symbol-frequency
;   pairs (where no symbol appears in more than one pair) and generates a
;   Huffman encoding tree according to the Huffman algorithm.
;   
;   (define (generate-huffman-tree pairs)
;     (successive-merge (make-leaf-set pairs)))
;   
;   Make-leaf-set is the procedure given above that transforms the list of
;   pairs into an ordered set of leaves.  Successive-merge is the procedure
;   you must write, using make-code-tree to successively merge the
;   smallest-weight elements of the set until there is only one element
;   left, which is the desired Huffman tree.  (This procedure is slightly
;   tricky, but not really complicated.  If you find yourself designing a
;   complex procedure, then you are almost certainly doing something wrong. 
;   You can take significant advantage of the fact that we are using an
;   ordered set representation.)
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.69]: http://sicp-book.com/book-Z-H-16.html#%_thm_2.69
;   2.3.4 Example: Huffman Encoding Trees - p168
;   ------------------------------------------------------------------------

(-start- "2.69")



(--end-- "2.69")

