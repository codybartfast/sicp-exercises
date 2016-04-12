#lang racket

; Section 3.3.5: Propagation of Constraints

(require "common.rkt")

;   Exercise 3.33
;   =============
;   
;   Using primitive multiplier, adder, and constant constraints, define a
;   procedure averager that takes three connectors a, b, and c as inputs and
;   establishes the constraint that the value of c is the average of the
;   values of a and b.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.33]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.33
;   3.3.5 Propagation of Constraints - p295
;   ------------------------------------------------------------------------

(-start- "3.33")



(--end-- "3.33")

;   ========================================================================
;   
;   Exercise 3.34
;   =============
;   
;   Louis Reasoner wants to build a squarer, a constraint device with two
;   terminals such that the value of connector b on the second terminal will
;   always be the square of the value a on the first terminal.  He proposes
;   the following simple device made from a multiplier:
;   
;   (define (squarer a b)
;     (multiplier a a b))
;   
;   There is a serious flaw in this idea.  Explain.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.34]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.34
;   3.3.5 Propagation of Constraints - p295
;   ------------------------------------------------------------------------

(-start- "3.34")



(--end-- "3.34")

;   ========================================================================
;   
;   Exercise 3.35
;   =============
;   
;   Ben Bitdiddle tells Louis that one way to avoid the trouble in exercise
;   [3.34] is to define a squarer as a new primitive constraint.  Fill in
;   the missing portions in Ben's outline for a procedure to implement such
;   a constraint:
;   
;   (define (squarer a b)
;     (define (process-new-value)
;       (if (has-value? b)
;           (if (< (get-value b) 0)
;               (error "square less than 0 -- SQUARER" (get-value b))
;               <alternative1>)
;           <alternative2>))
;     (define (process-forget-value) <body1>)
;     (define (me request) <body2>)
;     <rest of definition>
;     me)
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.35]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.35
;   [Exercise 3.34]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.34
;   3.3.5 Propagation of Constraints - p295
;   ------------------------------------------------------------------------

(-start- "3.35")



(--end-- "3.35")

;   ========================================================================
;   
;   Exercise 3.36
;   =============
;   
;   Suppose we evaluate the following sequence of expressions in the global
;   environment:
;   
;   (define a (make-connector))
;   (define b (make-connector))
;   (set-value! a 10 'user)
;   
;   At some time during evaluation of the set-value!, the following
;   expression from the connector's local procedure is evaluated:
;   
;   (for-each-except setter inform-about-value constraints)
;   
;   Draw an environment diagram showing the environment in which the above
;   expression is evaluated.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.36]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.36
;   3.3.5 Propagation of Constraints - p295
;   ------------------------------------------------------------------------

(-start- "3.36")



(--end-- "3.36")

;   ========================================================================
;   
;   Exercise 3.37
;   =============
;   
;   The celsius-fahrenheit-converter procedure is cumbersome when compared
;   with a more expression-oriented style of definition, such as
;   
;   (define (celsius-fahrenheit-converter x)
;     (c+ (c* (c/ (cv 9) (cv 5))
;             x)
;         (cv 32)))
;   (define C (make-connector))
;   (define F (celsius-fahrenheit-converter C))
;   
;   Here c+, c*, etc. are the "constraint" versions of the arithmetic
;   operations.  For example, c+ takes two connectors as arguments and
;   returns a connector that is related to these by an adder constraint:
;   
;   (define (c+ x y)
;     (let ((z (make-connector)))
;       (adder x y z)
;       z))
;   
;   Define analogous procedures c-, c*, c/, and cv (constant value) that
;   enable us to define compound constraints as in the converter example
;   above.⁽³³⁾
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.37]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.37
;   [Footnote 33]:   http://sicp-book.com/book-Z-H-22.html#footnote_Temp_404
;   3.3.5 Propagation of Constraints - p296
;   ------------------------------------------------------------------------

(-start- "3.37")



(--end-- "3.37")

