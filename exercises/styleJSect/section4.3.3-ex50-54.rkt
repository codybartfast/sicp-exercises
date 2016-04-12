#lang racket

; Section 4.3.3: Implementing the <tt>Amb</tt> Evaluator

(require "common.rkt")

;   Exercise 4.50
;   =============
;   
;   Implement a new special form ramb that is like amb except that it
;   searches alternatives in a random order, rather than from left to right.
;   Show how this can help with Alyssa's problem in exercise [4.49].
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.50]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.50
;   [Exercise 4.49]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.49
;   4.3.3 Implementing the <tt>Amb</tt> Evaluator - p436
;   ------------------------------------------------------------------------

(-start- "4.50")



(--end-- "4.50")

;   ========================================================================
;   
;   Exercise 4.51
;   =============
;   
;   Implement a new kind of assignment called permanent-set! that is not
;   undone upon failure.  For example, we can choose two distinct elements
;   from a list and count the number of trials required to make a successful
;   choice as follows:
;   
;   (define count 0)
;   (let ((x (an-element-of '(a b c)))
;         (y (an-element-of '(a b c))))
;     (permanent-set! count (+ count 1))
;     (require (not (eq? x y)))
;     (list x y count))
;   ;;; Starting a new problem
;   ;;; Amb-Eval value:
;   (a b 2)
;   ;;; Amb-Eval input:
;   try-again
;   ;;; Amb-Eval value:
;   (a c 3)
;   
;   What values would have been displayed if we had used set! here rather
;   than permanent-set! ?
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.51]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.51
;   4.3.3 Implementing the <tt>Amb</tt> Evaluator - p436
;   ------------------------------------------------------------------------

(-start- "4.51")



(--end-- "4.51")

;   ========================================================================
;   
;   Exercise 4.52
;   =============
;   
;   Implement a new construct called if-fail that permits the user to catch
;   the failure of an expression.  If-fail takes two expressions.  It
;   evaluates the first expression as usual and returns as usual if the
;   evaluation succeeds.  If the evaluation fails, however, the value of the
;   second expression is returned, as in the following example:
;   
;   ;;; Amb-Eval input:
;   (if-fail (let ((x (an-element-of '(1 3 5))))
;              (require (even? x))
;              x)
;            'all-odd)
;   ;;; Starting a new problem
;   ;;; Amb-Eval value:
;   all-odd
;   ;;; Amb-Eval input:
;   (if-fail (let ((x (an-element-of '(1 3 5 8))))
;              (require (even? x))
;              x)
;            'all-odd)
;   ;;; Starting a new problem
;   ;;; Amb-Eval value:
;   8
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.52]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.52
;   4.3.3 Implementing the <tt>Amb</tt> Evaluator - p436
;   ------------------------------------------------------------------------

(-start- "4.52")



(--end-- "4.52")

;   ========================================================================
;   
;   Exercise 4.53
;   =============
;   
;   With permanent-set! as described in exercise [4.51] and if-fail as in
;   exercise [4.52], what will be the result of evaluating
;   
;   (let ((pairs '()))
;     (if-fail (let ((p (prime-sum-pair '(1 3 5 8) '(20 35 110))))
;                (permanent-set! pairs (cons p pairs))
;                (amb))
;              pairs))
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.53]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.53
;   [Exercise 4.51]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.51
;   [Exercise 4.52]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.52
;   4.3.3 Implementing the <tt>Amb</tt> Evaluator - p437
;   ------------------------------------------------------------------------

(-start- "4.53")



(--end-- "4.53")

;   ========================================================================
;   
;   Exercise 4.54
;   =============
;   
;   If we had not realized that require could be implemented as an ordinary
;   procedure that uses amb, to be defined by the user as part of a
;   nondeterministic program, we would have had to implement it as a special
;   form.  This would require syntax procedures
;   
;   (define (require? exp) (tagged-list? exp 'require))
;   
;   (define (require-predicate exp) (cadr exp))
;   
;   and a new clause in the dispatch in analyze
;   
;   ((require? exp) (analyze-require exp))
;   
;   as well the procedure analyze-require that handles require expressions. 
;   Complete the following definition of analyze-require.
;   
;   (define (analyze-require exp)
;     (let ((pproc (analyze (require-predicate exp))))
;       (lambda (env succeed fail)
;         (pproc env
;                (lambda (pred-value fail2)
;                  (if <??>
;                      <??>
;                      (succeed 'ok fail2)))
;                fail))))
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.54]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.54
;   4.3.3 Implementing the <tt>Amb</tt> Evaluator - p437
;   ------------------------------------------------------------------------

(-start- "4.54")



(--end-- "4.54")

