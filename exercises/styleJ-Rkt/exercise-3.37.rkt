#lang racket

(require "common.rkt")

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

