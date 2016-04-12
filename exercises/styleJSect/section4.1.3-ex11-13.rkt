#lang racket

; Section 4.1.3: Evaluator Data Structures

(require "common.rkt")

;   Exercise 4.11
;   =============
;   
;   Instead of representing a frame as a pair of lists, we can represent a
;   frame as a list of bindings, where each binding is a name-value pair.
;   Rewrite the environment operations to use this alternative
;   representation.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.11]: http://sicp-book.com/book-Z-H-26.html#%_thm_4.11
;   4.1.3 Evaluator Data Structures - p380
;   ------------------------------------------------------------------------

(-start- "4.11")



(--end-- "4.11")

;   ========================================================================
;   
;   Exercise 4.12
;   =============
;   
;   The procedures set-variable-value!, define-variable!, and
;   lookup-variable-value can be expressed in terms of more abstract
;   procedures for traversing the environment structure. Define abstractions
;   that capture the common patterns and redefine the three procedures in
;   terms of these abstractions.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.12]: http://sicp-book.com/book-Z-H-26.html#%_thm_4.12
;   4.1.3 Evaluator Data Structures - p380
;   ------------------------------------------------------------------------

(-start- "4.12")



(--end-- "4.12")

;   ========================================================================
;   
;   Exercise 4.13
;   =============
;   
;   Scheme allows us to create new bindings for variables by means of
;   define, but provides no way to get rid of bindings.  Implement for the
;   evaluator a special form make-unbound! that removes the binding of a
;   given symbol from the environment in which the make-unbound! expression
;   is evaluated. This problem is not completely specified.  For example,
;   should we remove only the binding in the first frame of the environment?
;   Complete the specification and justify any choices you make.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.13]: http://sicp-book.com/book-Z-H-26.html#%_thm_4.13
;   4.1.3 Evaluator Data Structures - p380
;   ------------------------------------------------------------------------

(-start- "4.13")



(--end-- "4.13")

