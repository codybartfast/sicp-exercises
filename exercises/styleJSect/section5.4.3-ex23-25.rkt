#lang racket

; Section 5.4.3: Conditionals, Assignments, and Definitions

(require "common.rkt")

;   Exercise 5.23
;   =============
;   
;   Extend the evaluator to handle derived expressions such as cond, let,
;   and so on (section [4.1.2]). You may "cheat" and assume that the syntax
;   transformers such as cond->if are available as machine operations.⁽²⁸⁾
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.23]: http://sicp-book.com/book-Z-H-34.html#%_thm_5.23
;   [Section 4.1.2]: http://sicp-book.com/book-Z-H-26.html#%_sec_4.1.2
;   [Footnote 28]:   http://sicp-book.com/book-Z-H-34.html#footnote_Temp_781
;   5.4.3 Conditionals, Assignments, and Definitions - p560
;   ------------------------------------------------------------------------

(-start- "5.23")



(--end-- "5.23")

;   ========================================================================
;   
;   Exercise 5.24
;   =============
;   
;   Implement cond as a new basic special form without reducing it to if. 
;   You will have to construct a loop that tests the predicates of
;   successive cond clauses until you find one that is true, and then use
;   ev-sequence to evaluate the actions of the clause.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.24]: http://sicp-book.com/book-Z-H-34.html#%_thm_5.24
;   5.4.3 Conditionals, Assignments, and Definitions - p560
;   ------------------------------------------------------------------------

(-start- "5.24")



(--end-- "5.24")

;   ========================================================================
;   
;   Exercise 5.25
;   =============
;   
;   Modify the evaluator so that it uses normal-order evaluation, based on
;   the lazy evaluator of section [4.2].
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.25]: http://sicp-book.com/book-Z-H-34.html#%_thm_5.25
;   [Section 4.2]:   http://sicp-book.com/book-Z-H-27.html#%_sec_4.2
;   5.4.3 Conditionals, Assignments, and Definitions - p560
;   ------------------------------------------------------------------------

(-start- "5.25")



(--end-- "5.25")

