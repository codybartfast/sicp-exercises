#lang racket

; Section 4.2.2: An Interpreter with Lazy Evaluation

(require "common.rkt")

;   Exercise 4.27
;   =============
;   
;   Suppose we type in the following definitions to the lazy evaluator:
;   
;   (define count 0)
;   (define (id x)
;     (set! count (+ count 1))
;     x)
;   
;   Give the missing values in the following sequence of interactions, and
;   explain your answers.⁽³⁸⁾
;   
;   (define w (id (id 10)))
;   ;;; L-Eval input:
;   count
;   ;;; L-Eval value:
;   <response>
;   ;;; L-Eval input:
;   w
;   ;;; L-Eval value:
;   <response>
;   ;;; L-Eval input:
;   count
;   ;;; L-Eval value:
;   <response>
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.27]: http://sicp-book.com/book-Z-H-27.html#%_thm_4.27
;   [Footnote 38]:   http://sicp-book.com/book-Z-H-27.html#footnote_Temp_587
;   4.2.2 An Interpreter with Lazy Evaluation - p406
;   ------------------------------------------------------------------------

(-start- "4.27")



(--end-- "4.27")

;   ========================================================================
;   
;   Exercise 4.28
;   =============
;   
;   Eval uses actual-value rather than eval to evaluate the operator before
;   passing it to apply, in order to force the value of the operator. Give
;   an example that demonstrates the need for this forcing.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.28]: http://sicp-book.com/book-Z-H-27.html#%_thm_4.28
;   4.2.2 An Interpreter with Lazy Evaluation - p407
;   ------------------------------------------------------------------------

(-start- "4.28")



(--end-- "4.28")

;   ========================================================================
;   
;   Exercise 4.29
;   =============
;   
;   Exhibit a program that you would expect to run much more slowly without
;   memoization than with memoization.  Also, consider the following
;   interaction, where the id procedure is defined as in exercise [4.27] and
;   count starts at 0:
;   
;   (define (square x)
;     (* x x))
;   ;;; L-Eval input:
;   (square (id 10))
;   ;;; L-Eval value:
;   <response>
;   ;;; L-Eval input:
;   count
;   ;;; L-Eval value:
;   <response>
;   
;   Give the responses both when the evaluator memoizes and when it does
;   not.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.29]: http://sicp-book.com/book-Z-H-27.html#%_thm_4.29
;   [Exercise 4.27]: http://sicp-book.com/book-Z-H-27.html#%_thm_4.27
;   4.2.2 An Interpreter with Lazy Evaluation - p407
;   ------------------------------------------------------------------------

(-start- "4.29")



(--end-- "4.29")

;   ========================================================================
;   
;   Exercise 4.30
;   =============
;   
;   Cy D. Fect, a reformed C programmer, is worried that some side effects
;   may never take place, because the lazy evaluator doesn't force the
;   expressions in a sequence. Since the value of an expression in a
;   sequence other than the last one is not used (the expression is there
;   only for its effect, such as assigning to a variable or printing), there
;   can be no subsequent use of this value (e.g., as an argument to a
;   primitive procedure) that will cause it to be forced.  Cy thus thinks
;   that when evaluating sequences, we must force all expressions in the
;   sequence except the final one.  He proposes to modify eval-sequence from
;   section [4.1.1] to use actual-value rather than eval:
;   
;   (define (eval-sequence exps env)
;     (cond ((last-exp? exps) (eval (first-exp exps) env))
;           (else (actual-value (first-exp exps) env)
;                 (eval-sequence (rest-exps exps) env))))
;   
;   a. Ben Bitdiddle thinks Cy is wrong. He shows Cy the for-each procedure
;   described in exercise [2.23], which gives an important example of a
;   sequence with side effects:
;   
;   (define (for-each proc items)
;     (if (null? items)
;         'done
;         (begin (proc (car items))
;                (for-each proc (cdr items)))))
;   
;   He claims that the evaluator in the text (with the original
;   eval-sequence) handles this correctly:
;   
;   ;;; L-Eval input:
;   (for-each (lambda (x) (newline) (display x))
;             (list 57 321 88))
;   57
;   321
;   88
;   ;;; L-Eval value:
;   done
;   
;   Explain why Ben is right about the behavior of for-each.
;   
;   b. Cy agrees that Ben is right about the for-each example, but says that
;   that's not the kind of program he was thinking about when he proposed
;   his change to eval-sequence. He defines the following two procedures in
;   the lazy evaluator:
;   
;   (define (p1 x)
;     (set! x (cons x '(2)))
;     x)
;   
;   (define (p2 x)
;     (define (p e)
;       e
;       x)
;     (p (set! x (cons x '(2)))))
;   
;   What are the values of (p1 1) and (p2 1) with the original
;   eval-sequence? What would the values be with Cy's proposed change to
;   eval-sequence?
;   
;   c. Cy also points out that changing eval-sequence as he proposes does
;   not affect the behavior of the example in part a. Explain why this is
;   true.
;   
;   d. How do you think sequences ought to be treated in the lazy evaluator?
;   Do you like Cy's approach, the approach in the text, or some other
;   approach?
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.30]: http://sicp-book.com/book-Z-H-27.html#%_thm_4.30
;   [Section 4.1.1]: http://sicp-book.com/book-Z-H-26.html#%_sec_4.1.1
;   [Exercise 2.23]: http://sicp-book.com/book-Z-H-27.html#%_thm_2.23
;   4.2.2 An Interpreter with Lazy Evaluation - p407
;   ------------------------------------------------------------------------

(-start- "4.30")



(--end-- "4.30")

;   ========================================================================
;   
;   Exercise 4.31
;   =============
;   
;   The approach taken in this section is somewhat unpleasant, because it
;   makes an incompatible change to Scheme.  It might be nicer to implement
;   lazy evaluation as an upward-compatible extension, that is, so that
;   ordinary Scheme programs will work as before.  We can do this by
;   extending the syntax of procedure declarations to let the user control
;   whether or not arguments are to be delayed.  While we're at it, we may
;   as well also give the user the choice between delaying with and without
;   memoization.  For example, the definition
;   
;   (define (f a (b lazy) c (d lazy-memo))
;     ...)
;   
;   would define f to be a procedure of four arguments, where the first and
;   third arguments are evaluated when the procedure is called, the second
;   argument is delayed, and the fourth argument is both delayed and
;   memoized.  Thus, ordinary procedure definitions will produce the same
;   behavior as ordinary Scheme, while adding the lazy-memo declaration to
;   each parameter of every compound procedure will produce the behavior of
;   the lazy evaluator defined in this section. Design and implement the
;   changes required to produce such an extension to Scheme.  You will have
;   to implement new syntax procedures to handle the new syntax for define. 
;   You must also arrange for eval or apply to determine when arguments are
;   to be delayed, and to force or delay arguments accordingly, and you must
;   arrange for forcing to memoize or not, as appropriate.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.31]: http://sicp-book.com/book-Z-H-27.html#%_thm_4.31
;   4.2.2 An Interpreter with Lazy Evaluation - p408
;   ------------------------------------------------------------------------

(-start- "4.31")



(--end-- "4.31")

