#lang racket

; Section 5.5.5: An Example of Compiled Code

(require "common.rkt")

;   Exercise 5.33
;   =============
;   
;   Consider the following definition of a factorial procedure, which is
;   slightly different from the one given above:
;   
;   (define (factorial-alt n)
;     (if (= n 1)
;         1
;         (* n (factorial-alt (- n 1)))))
;   
;   Compile this procedure and compare the resulting code with that produced
;   for factorial.  Explain any differences you find.  Does either program
;   execute more efficiently than the other?
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.33]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.33
;   5.5.5 An Example of Compiled Code - p594
;   ------------------------------------------------------------------------

(-start- "5.33")



(--end-- "5.33")

;   ========================================================================
;   
;   Exercise 5.34
;   =============
;   
;   Compile the iterative factorial procedure
;   
;   (define (factorial n)
;     (define (iter product counter)
;       (if (> counter n)
;           product
;           (iter (* counter product)
;                 (+ counter 1))))
;     (iter 1 1))
;   
;   Annotate the resulting code, showing the essential difference between
;   the code for iterative and recursive versions of factorial that makes
;   one process build up stack space and the other run in constant stack
;   space.
;   
;   Figure:
;   
;   ;; construct the procedure and skip over code for the procedure body
;     (assign val
;             (op make-compiled-procedure) (label entry2) (reg env))
;     (goto (label after-lambda1))
;   
;   entry2     ; calls to factorial will enter here
;     (assign env (op compiled-procedure-env) (reg proc))
;     (assign env
;             (op extend-environment) (const (n)) (reg argl) (reg env))
;   ;; begin actual procedure body
;     (save continue)
;     (save env)
;   
;   ;; compute (= n 1)
;     (assign proc (op lookup-variable-value) (const =) (reg env))
;     (assign val (const 1))
;     (assign argl (op list) (reg val))
;     (assign val (op lookup-variable-value) (const n) (reg env))
;     (assign argl (op cons) (reg val) (reg argl))
;     (test (op primitive-procedure?) (reg proc))
;     (branch (label primitive-branch17))
;   compiled-branch16
;     (assign continue (label after-call15))
;     (assign val (op compiled-procedure-entry) (reg proc))
;     (goto (reg val))
;   primitive-branch17
;     (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
;   
;   after-call15   ; val now contains result of (= n 1)
;     (restore env)
;     (restore continue)
;     (test (op false?) (reg val))
;     (branch (label false-branch4))
;   true-branch5  ; return 1
;     (assign val (const 1))
;     (goto (reg continue))
;   
;   false-branch4 ;; compute and return (* (factorial (- n 1)) n) (assign
;   proc (op lookup-variable-value) (const *) (reg env)) (save continue)
;     (save proc)   ; save * procedure
;     (assign val (op lookup-variable-value) (const n) (reg env))
;     (assign argl (op list) (reg val))
;     (save argl)   ; save partial argument list for *
;   
;   ;; compute (factorial (- n 1)), which is the other argument for *
;     (assign proc
;             (op lookup-variable-value) (const factorial) (reg env))
;     (save proc)  ; save factorial procedure
;   
;   Figure 5.17: Compilation of the definition of the factorial procedure
;   (continued on next page).
;   
;   Figure:
;   
;   ;; compute (- n 1), which is the argument for factorial
;     (assign proc (op lookup-variable-value) (const -) (reg env))
;     (assign val (const 1))
;     (assign argl (op list) (reg val))
;     (assign val (op lookup-variable-value) (const n) (reg env))
;     (assign argl (op cons) (reg val) (reg argl))
;     (test (op primitive-procedure?) (reg proc))
;     (branch (label primitive-branch8))
;   compiled-branch7
;     (assign continue (label after-call6))
;     (assign val (op compiled-procedure-entry) (reg proc))
;     (goto (reg val))
;   primitive-branch8
;     (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
;   
;   after-call6   ; val now contains result of (- n 1)
;     (assign argl (op list) (reg val))
;     (restore proc) ; restore factorial
;   ;; apply factorial
;     (test (op primitive-procedure?) (reg proc))
;     (branch (label primitive-branch11))
;   compiled-branch10
;     (assign continue (label after-call9))
;     (assign val (op compiled-procedure-entry) (reg proc))
;     (goto (reg val))
;   primitive-branch11
;     (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
;   
;   after-call9      ; val now contains result of (factorial (- n 1))
;     (restore argl) ; restore partial argument list for *
;     (assign argl (op cons) (reg val) (reg argl))
;     (restore proc) ; restore *
;     (restore continue)
;   ;; apply * and return its value
;     (test (op primitive-procedure?) (reg proc))
;     (branch (label primitive-branch14))
;   compiled-branch13
;   ;; note that a compound procedure here is called tail-recursively
;     (assign val (op compiled-procedure-entry) (reg proc))
;     (goto (reg val))
;   primitive-branch14
;     (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
;     (goto (reg continue))
;   after-call12
;   after-if3
;   after-lambda1
;   ;; assign the procedure to the variable factorial
;     (perform
;      (op define-variable!) (const factorial) (reg val) (reg env))
;     (assign val (const ok))
;   
;   Figure 5.17: (continued)
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.34]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.34
;   5.5.5 An Example of Compiled Code - p594
;   ------------------------------------------------------------------------

(-start- "5.34")



(--end-- "5.34")

;   ========================================================================
;   
;   Exercise 5.35
;   =============
;   
;   What expression was compiled to produce the code shown in figure [5.18]?
;   
;   Figure:
;   
;   (assign val (op make-compiled-procedure) (label entry16)
;                                              (reg env))
;     (goto (label after-lambda15))
;   entry16
;     (assign env (op compiled-procedure-env) (reg proc))
;     (assign env
;             (op extend-environment) (const (x)) (reg argl) (reg env))
;     (assign proc (op lookup-variable-value) (const +) (reg env))
;     (save continue)
;     (save proc)
;     (save env)
;     (assign proc (op lookup-variable-value) (const g) (reg env))
;     (save proc)
;     (assign proc (op lookup-variable-value) (const +) (reg env))
;     (assign val (const 2))
;     (assign argl (op list) (reg val))
;     (assign val (op lookup-variable-value) (const x) (reg env))
;     (assign argl (op cons) (reg val) (reg argl))
;     (test (op primitive-procedure?) (reg proc))
;     (branch (label primitive-branch19))
;   compiled-branch18
;     (assign continue (label after-call17))
;     (assign val (op compiled-procedure-entry) (reg proc))
;     (goto (reg val))
;   primitive-branch19
;     (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
;   after-call17
;     (assign argl (op list) (reg val))
;     (restore proc)
;     (test (op primitive-procedure?) (reg proc))
;     (branch (label primitive-branch22))
;   compiled-branch21
;     (assign continue (label after-call20))
;     (assign val (op compiled-procedure-entry) (reg proc))
;     (goto (reg val))
;   primitive-branch22
;     (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
;   
;   Figure 5.18: An example of compiler output (continued on next page). See
;   exercise [5.35].
;   
;   Figure:
;   
;   after-call20
;     (assign argl (op list) (reg val))
;     (restore env)
;     (assign val (op lookup-variable-value) (const x) (reg env))
;     (assign argl (op cons) (reg val) (reg argl))
;     (restore proc)
;     (restore continue)
;     (test (op primitive-procedure?) (reg proc))
;     (branch (label primitive-branch25))
;   compiled-branch24
;     (assign val (op compiled-procedure-entry) (reg proc))
;     (goto (reg val))
;   primitive-branch25
;     (assign val (op apply-primitive-procedure) (reg proc) (reg argl))
;     (goto (reg continue))
;   after-call23
;   after-lambda15
;     (perform (op define-variable!) (const f) (reg val) (reg env))
;     (assign val (const ok))
;   
;   Figure 5.18: (continued)
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.35]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.35
;   [Figure 5.18]:   http://sicp-book.com/book-Z-H-35.html#%_fig_5.18
;   5.5.5 An Example of Compiled Code - p595
;   ------------------------------------------------------------------------

(-start- "5.35")



(--end-- "5.35")

;   ========================================================================
;   
;   Exercise 5.36
;   =============
;   
;   What order of evaluation does our compiler produce for operands of a
;   combination?  Is it left-to-right, right-to-left, or some other order?
;   Where in the compiler is this order determined?  Modify the compiler so
;   that it produces some other order of evaluation.  (See the discussion of
;   order of evaluation for the explicit-control evaluator in section
;   [5.4.1].) How does changing the order of operand evaluation affect the
;   efficiency of the code that constructs the argument list?
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.36]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.36
;   [Section 5.4.1]: http://sicp-book.com/book-Z-H-34.html#%_sec_5.4.1
;   5.5.5 An Example of Compiled Code - p595
;   ------------------------------------------------------------------------

(-start- "5.36")



(--end-- "5.36")

;   ========================================================================
;   
;   Exercise 5.37
;   =============
;   
;   One way to understand the compiler's preserving mechanism for optimizing
;   stack usage is to see what extra operations would be generated if we did
;   not use this idea.  Modify preserving so that it always generates the
;   save and restore operations. Compile some simple expressions and
;   identify the unnecessary stack operations that are generated. Compare
;   the code to that generated with the preserving mechanism intact.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.37]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.37
;   5.5.5 An Example of Compiled Code - p595
;   ------------------------------------------------------------------------

(-start- "5.37")



(--end-- "5.37")

;   ========================================================================
;   
;   Exercise 5.38
;   =============
;   
;   Our compiler is clever about avoiding unnecessary stack operations, but
;   it is not clever at all when it comes to compiling calls to the
;   primitive procedures of the language in terms of the primitive
;   operations supplied by the machine.  For example, consider how much code
;   is compiled to compute (+ a 1): The code sets up an argument list in
;   argl, puts the primitive addition procedure (which it finds by looking
;   up the symbol + in the environment) into proc, and tests whether the
;   procedure is primitive or compound.  The compiler always generates code
;   to perform the test, as well as code for primitive and compound branches
;   (only one of which will be executed). We have not shown the part of the
;   controller that implements primitives, but we presume that these
;   instructions make use of primitive arithmetic operations in the
;   machine's data paths.  Consider how much less code would be generated if
;   the compiler could open-code primitives -- that is, if it could generate
;   code to directly use these primitive machine operations.  The expression
;   (+ a 1) might be compiled into something as simple as ⁽⁴³⁾
;   
;   (assign val (op lookup-variable-value) (const a) (reg env))
;   (assign val (op +) (reg val) (const 1))
;   
;   In this exercise we will extend our compiler to support open coding of
;   selected primitives.  Special-purpose code will be generated for calls
;   to these primitive procedures instead of the general
;   procedure-application code.  In order to support this, we will augment
;   our machine with special argument registers arg1 and arg2. The primitive
;   arithmetic operations of the machine will take their inputs from arg1
;   and arg2. The results may be put into val, arg1, or arg2.
;   
;   The compiler must be able to recognize the application of an open-coded
;   primitive in the source program.  We will augment the dispatch in the
;   compile procedure to recognize the names of these primitives in addition
;   to the reserved words (the special forms) it currently recognizes.⁽⁴⁴⁾
;   For each special form our compiler has a code generator.  In this
;   exercise we will construct a family of code generators for the
;   open-coded primitives.
;   
;   a.  The open-coded primitives, unlike the special forms, all need their
;   operands evaluated.  Write a code generator spread-arguments for use by
;   all the open-coding code generators.  Spread-arguments should take an
;   operand list and compile the given operands targeted to successive
;   argument registers.  Note that an operand may contain a call to an
;   open-coded primitive, so argument registers will have to be preserved
;   during operand evaluation.
;   
;   b.  For each of the primitive procedures =, *, -, and +, write a code
;   generator that takes a combination with that operator, together with a
;   target and a linkage descriptor, and produces code to spread the
;   arguments into the registers and then perform the operation targeted to
;   the given target with the given linkage.  You need only handle
;   expressions with two operands.  Make compile dispatch to these code
;   generators.
;   
;   c.  Try your new compiler on the factorial example.  Compare the
;   resulting code with the result produced without open coding.
;   
;   d.  Extend your code generators for + and * so that they can handle
;   expressions with arbitrary numbers of operands.  An expression with more
;   than two operands will have to be compiled into a sequence of
;   operations, each with only two inputs.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.38]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.38
;   [Footnote 43]:   http://sicp-book.com/book-Z-H-35.html#footnote_Temp_822
;   [Footnote 44]:   http://sicp-book.com/book-Z-H-35.html#footnote_Temp_823
;   5.5.5 An Example of Compiled Code - p595
;   ------------------------------------------------------------------------

(-start- "5.38")



(--end-- "5.38")

