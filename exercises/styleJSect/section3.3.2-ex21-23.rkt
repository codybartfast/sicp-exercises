#lang racket

; Section 3.3.2: Representing Queues

(require "common.rkt")

;   Exercise 3.21
;   =============
;   
;   Ben Bitdiddle decides to test the queue implementation described above. 
;   He types in the procedures to the Lisp interpreter and proceeds to try
;   them out:
;   
;   (define q1 (make-queue))
;   (insert-queue! q1 'a)
;   ((a) a)
;   (insert-queue! q1 'b)
;   ((a b) b)
;   (delete-queue! q1)
;   ((b) b)
;   (delete-queue! q1)
;   (() b)
;   
;   "It's all wrong!" he complains.  "The interpreter's response shows that
;   the last item is inserted into the queue twice.  And when I delete both
;   items, the second b is still there, so the queue isn't empty, even
;   though it's supposed to be." Eva Lu Ator suggests that Ben has
;   misunderstood what is happening.  "It's not that the items are going
;   into the queue twice," she explains.  "It's just that the standard Lisp
;   printer doesn't know how to make sense of the queue representation.  If
;   you want to see the queue printed correctly, you'll have to define your
;   own print procedure for queues." Explain what Eva Lu is talking about. 
;   In particular, show why Ben's examples produce the printed results that
;   they do.  Define a procedure print-queue that takes a queue as input and
;   prints the sequence of items in the queue.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.21]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.21
;   3.3.2 Representing Queues - p265
;   ------------------------------------------------------------------------

(-start- "3.21")



(--end-- "3.21")

;   ========================================================================
;   
;   Exercise 3.22
;   =============
;   
;   Instead of representing a queue as a pair of pointers, we can build a
;   queue as a procedure with local state.  The local state will consist of
;   pointers to the beginning and the end of an ordinary list.  Thus, the
;   make-queue procedure will have the form
;   
;   (define (make-queue)
;     (let ((front-ptr ...)
;           (rear-ptr ...))
;       <definitions of internal procedures>
;       (define (dispatch m) ...)
;       dispatch))
;   
;   Complete the definition of make-queue and provide implementations of the
;   queue operations using this representation.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.22]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.22
;   3.3.2 Representing Queues - p266
;   ------------------------------------------------------------------------

(-start- "3.22")



(--end-- "3.22")

;   ========================================================================
;   
;   Exercise 3.23
;   =============
;   
;   A deque ("double-ended queue") is a sequence in which items can be
;   inserted and deleted at either the front or the rear. Operations on
;   deques are the constructor make-deque, the predicate empty-deque?,
;   selectors front-deque and rear-deque, and mutators front-insert-deque!,
;   rear-insert-deque!, front-delete-deque!, and rear-delete-deque!.  Show
;   how to represent deques using pairs, and give implementations of the
;   operations.⁽²³⁾ All operations should be accomplished in θ(1) steps.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.23]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.23
;   [Footnote 23]:   http://sicp-book.com/book-Z-H-22.html#footnote_Temp_370
;   3.3.2 Representing Queues - p266
;   ------------------------------------------------------------------------

(-start- "3.23")



(--end-- "3.23")

