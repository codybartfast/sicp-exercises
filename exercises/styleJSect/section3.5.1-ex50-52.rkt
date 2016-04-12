#lang racket

; Section 3.5.1: Streams Are Delayed Lists

(require "common.rkt")

;   Exercise 3.50
;   =============
;   
;   Complete the following definition, which generalizes stream-map to allow
;   procedures that take multiple arguments, analogous to map in section
;   [2.2.3], footnote [12].
;   
;   (define (stream-map proc . argstreams)
;     (if (<??> (car argstreams))
;         the-empty-stream
;         (<??>
;          (apply proc (map <??> argstreams))
;          (apply stream-map
;                 (cons proc (map <??> argstreams))))))
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.50]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.50
;   [Section 2.2.3]: http://sicp-book.com/book-Z-H-15.html#%_sec_2.2.3
;   [Footnote 12]:   http://sicp-book.com/book-Z-H-24.html#footnote_Temp_166
;   3.5.1 Streams Are Delayed Lists - p350
;   ------------------------------------------------------------------------

(-start- "3.50")



(--end-- "3.50")

;   ========================================================================
;   
;   Exercise 3.51
;   =============
;   
;   In order to take a closer look at delayed evaluation, we will use the
;   following procedure, which simply returns its argument after printing
;   it:
;   
;   (define (show x)
;     (display-line x)
;     x)
;   
;   What does the interpreter print in response to evaluating each
;   expression in the following sequence?⁽⁵⁹⁾
;   
;   (define x (stream-map show (stream-enumerate-interval 0 10)))
;   (stream-ref x 5)
;   (stream-ref x 7)
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.51]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.51
;   [Footnote 59]:   http://sicp-book.com/book-Z-H-24.html#footnote_Temp_453
;   3.5.1 Streams Are Delayed Lists - p325
;   ------------------------------------------------------------------------

(-start- "3.51")



(--end-- "3.51")

;   ========================================================================
;   
;   Exercise 3.52
;   =============
;   
;   Consider the sequence of expressions
;   
;   (define sum 0)
;   (define (accum x)
;     (set! sum (+ x sum))
;     sum)
;   (define seq (stream-map accum (stream-enumerate-interval 1 20)))
;   (define y (stream-filter even? seq))
;   (define z (stream-filter (lambda (x) (= (remainder x 5) 0))
;                            seq))
;   (stream-ref y 7)
;   (display-stream z)
;   
;   What is the value of sum after each of the above expressions is
;   evaluated?  What is the printed response to evaluating the stream-ref
;   and display-stream expressions?  Would these responses differ if we had
;   implemented (delay <exp>) simply as (lambda () <exp>) without using the
;   optimization provided by memo-proc ?  Explain.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.52]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.52
;   3.5.1 Streams Are Delayed Lists - p325
;   ------------------------------------------------------------------------

(-start- "3.52")



(--end-- "3.52")

