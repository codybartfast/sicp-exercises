#lang racket

; Section 3.3.1: Mutable List Structure

(require "common.rkt")

;   Exercise 3.12
;   =============
;   
;   The following procedure for appending lists was introduced in section
;   [2.2.1]:
;   
;   (define (append x y)
;     (if (null? x)
;         y
;         (cons (car x) (append (cdr x) y))))
;   
;   Append forms a new list by successively consing the elements of x onto
;   y.  The procedure append! is similar to append, but it is a mutator
;   rather than a constructor. It appends the lists by splicing them
;   together, modifying the final pair of x so that its cdr is now y. (It is
;   an error to call append! with an empty x.)
;   
;   (define (append! x y)
;     (set-cdr! (last-pair x) y)
;     x)
;   
;   Here last-pair is a procedure that returns the last pair in its
;   argument:
;   
;   (define (last-pair x)
;     (if (null? (cdr x))
;         x
;         (last-pair (cdr x))))
;   
;   Consider the interaction
;   
;   (define x (list 'a 'b))
;   (define y (list 'c 'd))
;   (define z (append x y))
;   z
;   (a b c d)
;   (cdr x)
;   <response>
;   (define w (append! x y))
;   w
;   (a b c d)
;   (cdr x)
;   <response>
;   
;   What are the missing <response>s? Draw box-and-pointer diagrams to
;   explain your answer.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.12]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.12
;   [Section 2.2.1]: http://sicp-book.com/book-Z-H-15.html#%_sec_2.2.1
;   3.3.1 Mutable List Structure - p255
;   ------------------------------------------------------------------------

(-start- "3.12")



(--end-- "3.12")

;   ========================================================================
;   
;   Exercise 3.13
;   =============
;   
;   Consider the following make-cycle procedure, which uses the last-pair
;   procedure defined in exercise [3.12]:
;   
;   (define (make-cycle x)
;     (set-cdr! (last-pair x) x)
;     x)
;   
;   Draw a box-and-pointer diagram that shows the structure z created by
;   
;   (define z (make-cycle (list 'a 'b 'c)))
;   
;   What happens if we try to compute (last-pair z)?
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.13]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.13
;   [Exercise 3.12]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.12
;   3.3.1 Mutable List Structure - p256
;   ------------------------------------------------------------------------

(-start- "3.13")



(--end-- "3.13")

;   ========================================================================
;   
;   Exercise 3.14
;   =============
;   
;   The following procedure is quite useful, although obscure:
;   
;   (define (mystery x)
;     (define (loop x y)
;       (if (null? x)
;           y
;           (let ((temp (cdr x)))
;             (set-cdr! x y)
;             (loop temp x))))
;     (loop x '()))
;   
;   Loop uses the "temporary" variable temp to hold the old value of the cdr
;   of x, since the set-cdr! on the next line destroys the cdr.  Explain
;   what mystery does in general.  Suppose v is defined by (define v (list
;   'a 'b 'c 'd)). Draw the box-and-pointer diagram that represents the list
;   to which v is bound.  Suppose that we now evaluate (define w (mystery
;   v)). Draw box-and-pointer diagrams that show the structures v and w
;   after evaluating this expression.  What would be printed as the values
;   of v and w ?
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.14]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.14
;   3.3.1 Mutable List Structure - p256
;   ------------------------------------------------------------------------

(-start- "3.14")



(--end-- "3.14")

;   ========================================================================
;   
;   Exercise 3.15
;   =============
;   
;   Draw box-and-pointer diagrams to explain the effect of set-to-wow! on
;   the structures z1 and z2 above.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.15]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.15
;   3.3.1 Mutable List Structure - p269
;   ------------------------------------------------------------------------

(-start- "3.15")



(--end-- "3.15")

;   ========================================================================
;   
;   Exercise 3.16
;   =============
;   
;   Ben Bitdiddle decides to write a procedure to count the number of pairs
;   in any list structure.  "It's easy," he reasons.  "The number of pairs
;   in any structure is the number in the car plus the number in the cdr
;   plus one more to count the current pair." So Ben writes the following
;   procedure:
;   
;   (define (count-pairs x)
;     (if (not (pair? x))
;         0
;         (+ (count-pairs (car x))
;            (count-pairs (cdr x))
;            1)))
;   
;   Show that this procedure is not correct.  In particular, draw
;   box-and-pointer diagrams representing list structures made up of exactly
;   three pairs for which Ben's procedure would return 3; return 4; return
;   7; never return at all.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.16]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.16
;   3.3.1 Mutable List Structure - p259
;   ------------------------------------------------------------------------

(-start- "3.16")



(--end-- "3.16")

;   ========================================================================
;   
;   Exercise 3.17
;   =============
;   
;   Devise a correct version of the count-pairs procedure of exercise [3.16]
;   that returns the number of distinct pairs in any structure.  (Hint:
;   Traverse the structure, maintaining an auxiliary data structure that is
;   used to keep track of which pairs have already been counted.)
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.17]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.17
;   [Exercise 3.16]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.16
;   3.3.1 Mutable List Structure - p259
;   ------------------------------------------------------------------------

(-start- "3.17")



(--end-- "3.17")

;   ========================================================================
;   
;   Exercise 3.18
;   =============
;   
;   Write a procedure that examines a list and determines whether it
;   contains a cycle, that is, whether a program that tried to find the end
;   of the list by taking successive cdrs would go into an infinite loop. 
;   Exercise [3.13] constructed such lists.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.18]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.18
;   [Exercise 3.13]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.13
;   3.3.1 Mutable List Structure - p260
;   ------------------------------------------------------------------------

(-start- "3.18")



(--end-- "3.18")

;   ========================================================================
;   
;   Exercise 3.19
;   =============
;   
;   Redo exercise [3.18] using an algorithm that takes only a constant
;   amount of space.  (This requires a very clever idea.)
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.19]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.19
;   [Exercise 3.18]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.18
;   3.3.1 Mutable List Structure - p260
;   ------------------------------------------------------------------------

(-start- "3.19")



(--end-- "3.19")

;   ========================================================================
;   
;   Exercise 3.20
;   =============
;   
;   Draw environment diagrams to illustrate the evaluation of the sequence
;   of expressions
;   
;   (define x (cons 1 2))
;   (define z (cons x x))
;   (set-car! (cdr z) 17)
;   (car x)
;   17
;   
;   using the procedural implementation of pairs given above.  (Compare
;   exercise [3.11].)
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.20]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.20
;   [Exercise 3.11]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.11
;   3.3.1 Mutable List Structure - p261
;   ------------------------------------------------------------------------

(-start- "3.20")



(--end-- "3.20")

