#lang racket

; Section 4.1.6: Internal Definitions

(require "common.rkt")

;   Exercise 4.16
;   =============
;   
;   In this exercise we implement the method just described for interpreting
;   internal definitions. We assume that the evaluator supports let (see
;   exercise [4.6]).
;   
;   a.  Change lookup-variable-value (section [4.1.3]) to signal an error if
;   the value it finds is the symbol *unassigned*.
;   
;   b.  Write a procedure scan-out-defines that takes a procedure body and
;   returns an equivalent one that has no internal definitions, by making
;   the transformation described above.
;   
;   c.  Install scan-out-defines in the interpreter, either in
;   make-procedure or in procedure-body (see section [4.1.3]).  Which place
;   is better? Why?
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.16]: http://sicp-book.com/book-Z-H-26.html#%_thm_4.16
;   [Section 4.1.3]: http://sicp-book.com/book-Z-H-26.html#%_sec_4.1.3
;   [Exercise 4.6]:  http://sicp-book.com/book-Z-H-26.html#%_thm_4.6
;   4.1.6 Internal Definitions - p390
;   ------------------------------------------------------------------------

(-start- "4.16")



(--end-- "4.16")

;   ========================================================================
;   
;   Exercise 4.17
;   =============
;   
;   Draw diagrams of the environment in effect when evaluating the
;   expression <e3> in the procedure in the text, comparing how this will be
;   structured when definitions are interpreted sequentially with how it
;   will be structured if definitions are scanned out as described. Why is
;   there an extra frame in the transformed program?  Explain why this
;   difference in environment structure can never make a difference in the
;   behavior of a correct program.  Design a way to make the interpreter
;   implement the "simultaneous" scope rule for internal definitions without
;   constructing the extra frame.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.17]: http://sicp-book.com/book-Z-H-26.html#%_thm_4.17
;   4.1.6 Internal Definitions - p390
;   ------------------------------------------------------------------------

(-start- "4.17")



(--end-- "4.17")

;   ========================================================================
;   
;   Exercise 4.18
;   =============
;   
;   Consider an alternative strategy for scanning out definitions that
;   translates the example in the text to
;   
;   (lambda <vars>
;     (let ((u '*unassigned*)
;           (v '*unassigned*))
;       (let ((a <e1>)
;             (b <e2>))
;         (set! u a)
;         (set! v b))
;       <e3>))
;   
;   Here a and b are meant to represent new variable names, created by the
;   interpreter, that do not appear in the user's program. Consider the
;   solve procedure from section [3.5.4]:
;   
;   (define (solve f y0 dt)
;     (define y (integral (delay dy) y0 dt))
;     (define dy (stream-map f y))
;     y)
;   
;   Will this procedure work if internal definitions are scanned out as
;   shown in this exercise?  What if they are scanned out as shown in the
;   text?  Explain.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.18]: http://sicp-book.com/book-Z-H-26.html#%_thm_4.18
;   [Section 3.5.4]: http://sicp-book.com/book-Z-H-24.html#%_sec_3.5.4
;   4.1.6 Internal Definitions - p390
;   ------------------------------------------------------------------------

(-start- "4.18")



(--end-- "4.18")

;   ========================================================================
;   
;   Exercise 4.19
;   =============
;   
;   Ben Bitdiddle, Alyssa P. Hacker, and Eva Lu Ator are arguing about the
;   desired result of evaluating the expression
;   
;   (let ((a 1))
;     (define (f x)
;       (define b (+ a x))
;       (define a 5)
;       (+ a b))
;     (f 10))
;   
;   Ben asserts that the result should be obtained using the sequential rule
;   for define: b is defined to be 11, then a is defined to be 5, so the
;   result is 16.  Alyssa objects that mutual recursion requires the
;   simultaneous scope rule for internal procedure definitions, and that it
;   is unreasonable to treat procedure names differently from other names. 
;   Thus, she argues for the mechanism implemented in exercise [4.16].  This
;   would lead to a being unassigned at the time that the value for b is to
;   be computed.  Hence, in Alyssa's view the procedure should produce an
;   error.  Eva has a third opinion.  She says that if the definitions of a
;   and b are truly meant to be simultaneous, then the value 5 for a should
;   be used in evaluating b.  Hence, in Eva's view a should be 5, b should
;   be 15, and the result should be 20.  Which (if any) of these viewpoints
;   do you support?  Can you devise a way to implement internal definitions
;   so that they behave as Eva prefers?⁽²⁶⁾
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.19]: http://sicp-book.com/book-Z-H-26.html#%_thm_4.19
;   [Exercise 4.16]: http://sicp-book.com/book-Z-H-26.html#%_thm_4.16
;   [Footnote 26]:   http://sicp-book.com/book-Z-H-26.html#footnote_Temp_565
;   4.1.6 Internal Definitions - p391
;   ------------------------------------------------------------------------

(-start- "4.19")



(--end-- "4.19")

;   ========================================================================
;   
;   Exercise 4.20
;   =============
;   
;   Because internal definitions look sequential but are actually
;   simultaneous, some people prefer to avoid them entirely, and use the
;   special form letrec instead.  Letrec looks like let, so it is not
;   surprising that the variables it binds are bound simultaneously and have
;   the same scope as each other.  The sample procedure f above can be
;   written without internal definitions, but with exactly the same meaning,
;   as
;   
;   (define (f x)
;     (letrec ((even?
;               (lambda (n)
;                 (if (= n 0)
;                     true
;                     (odd? (- n 1)))))
;              (odd?
;               (lambda (n)
;                 (if (= n 0)
;                     false
;                     (even? (- n 1))))))
;       <rest of body of f>))
;   
;   Letrec expressions, which have the form
;   
;   (letrec ((<var₁> <exp₁>) ... (<var_(n)> <exp_(n)>))
;     <body>)
;   
;   are a variation on let in which the expressions <exp_(k)> that provide
;   the initial values for the variables <var_(k)> are evaluated in an
;   environment that includes all the letrec bindings.  This permits
;   recursion in the bindings, such as the mutual recursion of even? and
;   odd? in the example above, or the evaluation of 10 factorial with
;   
;   (letrec ((fact
;             (lambda (n)
;               (if (= n 1)
;                   1
;                   (* n (fact (- n 1)))))))
;     (fact 10))
;   
;   a. Implement letrec as a derived expression, by transforming a letrec
;   expression into a let expression as shown in the text above or in
;   exercise [4.18]. That is, the letrec variables should be created with a
;   let and then be assigned their values with set!.
;   
;   b. Louis Reasoner is confused by all this fuss about internal
;   definitions.  The way he sees it, if you don't like to use define inside
;   a procedure, you can just use let.  Illustrate what is loose about his
;   reasoning by drawing an environment diagram that shows the environment
;   in which the <rest of body of f> is evaluated during evaluation of the
;   expression (f 5), with f defined as in this exercise.  Draw an
;   environment diagram for the same evaluation, but with let in place of
;   letrec in the definition of f.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.20]: http://sicp-book.com/book-Z-H-26.html#%_thm_4.20
;   [Exercise 4.18]: http://sicp-book.com/book-Z-H-26.html#%_thm_4.18
;   4.1.6 Internal Definitions - p391
;   ------------------------------------------------------------------------

(-start- "4.20")



(--end-- "4.20")

;   ========================================================================
;   
;   Exercise 4.21
;   =============
;   
;   Amazingly, Louis's intuition in exercise [4.20] is correct.  It is
;   indeed possible to specify recursive procedures without using letrec (or
;   even define), although the method for accomplishing this is much more
;   subtle than Louis imagined.  The following expression computes 10
;   factorial by applying a recursive factorial procedure:⁽²⁷⁾
;   
;   ((lambda (n)
;      ((lambda (fact)
;         (fact fact n))
;       (lambda (ft k)
;         (if (= k 1)
;             1
;             (* k (ft ft (- k 1)))))))
;    10)
;   
;   a. Check (by evaluating the expression) that this really does compute
;   factorials.  Devise an analogous expression for computing Fibonacci
;   numbers.
;   
;   b. Consider the following procedure, which includes mutually recursive
;   internal definitions:
;   
;   (define (f x)
;     (define (even? n)
;       (if (= n 0)
;           true
;           (odd? (- n 1))))
;     (define (odd? n)
;       (if (= n 0)
;           false
;           (even? (- n 1))))
;     (even? x))
;   
;   Fill in the missing expressions to complete an alternative definition of
;   f, which uses neither internal definitions nor letrec:
;   
;   (define (f x)
;     ((lambda (even? odd?)
;        (even? even? odd? x))
;      (lambda (ev? od? n)
;        (if (= n 0) true (od? <??> <??> <??>)))
;      (lambda (ev? od? n)
;        (if (= n 0) false (ev? <??> <??> <??>)))))
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.21]: http://sicp-book.com/book-Z-H-26.html#%_thm_4.21
;   [Exercise 4.20]: http://sicp-book.com/book-Z-H-26.html#%_thm_4.20
;   [Footnote 27]:   http://sicp-book.com/book-Z-H-26.html#footnote_Temp_568
;   4.1.6 Internal Definitions - p392
;   ------------------------------------------------------------------------

(-start- "4.21")



(--end-- "4.21")

