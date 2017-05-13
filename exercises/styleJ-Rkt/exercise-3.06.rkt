#lang racket

(require "common.rkt")

;   Exercise 3.6
;   ============
;   
;   It is useful to be able to reset a random-number generator to produce a
;   sequence starting from a given value.  Design a new rand procedure that
;   is called with an argument that is either the symbol generate or the
;   symbol reset and behaves as follows: (rand 'generate) produces a new
;   random number; ((rand 'reset) <new-value>) resets the internal state
;   variable to the designated <new-value>.  Thus, by resetting the state,
;   one can generate repeatable sequences.  These are very handy to have
;   when testing and debugging programs that use random numbers.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.6]:  http://sicp-book.com/book-Z-H-20.html#%_thm_3.6
;   3.1.2 The Benefits of Introducing Assignment - p229
;   ------------------------------------------------------------------------

(-start- "3.6")



(--end-- "3.6")

