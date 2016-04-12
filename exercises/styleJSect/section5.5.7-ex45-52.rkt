#lang racket

; Section 5.5.7: Interfacing Compiled Code to the Evaluator

(require "common.rkt")

;   Exercise 5.45
;   =============
;   
;   By comparing the stack operations used by compiled code to the stack
;   operations used by the evaluator for the same computation, we can
;   determine the extent to which the compiler optimizes use of the stack,
;   both in speed (reducing the total number of stack operations) and in
;   space (reducing the maximum stack depth).  Comparing this optimized
;   stack use to the performance of a special-purpose machine for the same
;   computation gives some indication of the quality of the compiler.
;   
;   a. Exercise [5.27] asked you to determine, as a function of n, the
;   number of pushes and the maximum stack depth needed by the evaluator to
;   compute n! using the recursive factorial procedure given above. 
;   Exercise [5.14] asked you to do the same measurements for the
;   special-purpose factorial machine shown in figure [5.11]. Now perform
;   the same analysis using the compiled factorial procedure.
;   
;   Take the ratio of the number of pushes in the compiled version to the
;   number of pushes in the interpreted version, and do the same for the
;   maximum stack depth.  Since the number of operations and the stack depth
;   used to compute n! are linear in n, these ratios should approach
;   constants as n becomes large.  What are these constants? Similarly, find
;   the ratios of the stack usage in the special-purpose machine to the
;   usage in the interpreted version.
;   
;   Compare the ratios for special-purpose versus interpreted code to the
;   ratios for compiled versus interpreted code.  You should find that the
;   special-purpose machine does much better than the compiled code, since
;   the hand-tailored controller code should be much better than what is
;   produced by our rudimentary general-purpose compiler.
;   
;   b. Can you suggest improvements to the compiler that would help it
;   generate code that would come closer in performance to the hand-tailored
;   version?
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.45]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.45
;   [Exercise 5.27]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.27
;   [Exercise 5.14]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.14
;   [Figure 5.11]:   http://sicp-book.com/book-Z-H-31.html#%_fig_5.11
;   5.5.7 Interfacing Compiled Code to the Evaluator - p608
;   ------------------------------------------------------------------------

(-start- "5.45")



(--end-- "5.45")

;   ========================================================================
;   
;   Exercise 5.46
;   =============
;   
;   Carry out an analysis like the one in exercise [5.45] to determine the
;   effectiveness of compiling the tree-recursive Fibonacci procedure
;   
;   (define (fib n)
;     (if (< n 2)
;         n
;         (+ (fib (- n 1)) (fib (- n 2)))))
;   
;   compared to the effectiveness of using the special-purpose Fibonacci
;   machine of figure [5.12].  (For measurement of the interpreted
;   performance, see exercise [5.29].) For Fibonacci, the time resource used
;   is not linear in n; hence the ratios of stack operations will not
;   approach a limiting value that is independent of n.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.46]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.46
;   [Exercise 5.45]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.45
;   [Exercise 5.29]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.29
;   [Figure 5.12]:   http://sicp-book.com/book-Z-H-31.html#%_fig_5.12
;   5.5.7 Interfacing Compiled Code to the Evaluator - p609
;   ------------------------------------------------------------------------

(-start- "5.46")



(--end-- "5.46")

;   ========================================================================
;   
;   Exercise 5.47
;   =============
;   
;   This section described how to modify the explicit-control evaluator so
;   that interpreted code can call compiled procedures.  Show how to modify
;   the compiler so that compiled procedures can call not only primitive
;   procedures and compiled procedures, but interpreted procedures as well. 
;   This requires modifying compile-procedure-call to handle the case of
;   compound (interpreted) procedures. Be sure to handle all the same target
;   and linkage combinations as in compile-proc-appl.  To do the actual
;   procedure application, the code needs to jump to the evaluator's
;   compound-apply entry point. This label cannot be directly referenced in
;   object code (since the assembler requires that all labels referenced by
;   the code it is assembling be defined there), so we will add a register
;   called compapp to the evaluator machine to hold this entry point, and
;   add an instruction to initialize it:
;   
;     (assign compapp (label compound-apply))
;     (branch (label external-entry))      ; branches if flag is set
;   read-eval-print-loop
;     ...
;   
;   To test your code, start by defining a procedure f that calls a
;   procedure g.  Use compile-and-go to compile the definition of f and
;   start the evaluator.  Now, typing at the evaluator, define g and try to
;   call f.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.47]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.47
;   5.5.7 Interfacing Compiled Code to the Evaluator - p609
;   ------------------------------------------------------------------------

(-start- "5.47")



(--end-- "5.47")

;   ========================================================================
;   
;   Exercise 5.48
;   =============
;   
;   The compile-and-go interface implemented in this section is awkward,
;   since the compiler can be called only once (when the evaluator machine
;   is started).  Augment the compiler-interpreter interface by providing a
;   compile-and-run primitive that can be called from within the
;   explicit-control evaluator as follows:
;   
;   ;;; EC-Eval input:
;   (compile-and-run
;    '(define (factorial n)
;       (if (= n 1)
;           1
;           (* (factorial (- n 1)) n))))
;   ;;; EC-Eval value:
;   ok
;   ;;; EC-Eval input:
;   (factorial 5)
;   ;;; EC-Eval value:
;   120
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.48]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.48
;   5.5.7 Interfacing Compiled Code to the Evaluator - p609
;   ------------------------------------------------------------------------

(-start- "5.48")



(--end-- "5.48")

;   ========================================================================
;   
;   Exercise 5.49
;   =============
;   
;   As an alternative to using the explicit-control evaluator's
;   read-eval-print loop, design a register machine that performs a
;   read-compile-execute-print loop.  That is, the machine should run a loop
;   that reads an expression, compiles it, assembles and executes the
;   resulting code, and prints the result.  This is easy to run in our
;   simulated setup, since we can arrange to call the procedures compile and
;   assemble as "register-machine operations."
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.49]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.49
;   5.5.7 Interfacing Compiled Code to the Evaluator - p610
;   ------------------------------------------------------------------------

(-start- "5.49")



(--end-- "5.49")

;   ========================================================================
;   
;   Exercise 5.50
;   =============
;   
;   Use the compiler to compile the metacircular evaluator of section [4.1]
;   and run this program using the register-machine simulator.  (To compile
;   more than one definition at a time, you can package the definitions in a
;   begin.) The resulting interpreter will run very slowly because of the
;   multiple levels of interpretation, but getting all the details to work
;   is an instructive exercise.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.50]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.50
;   [Section 4.1]:   http://sicp-book.com/book-Z-H-26.html#%_sec_4.1
;   5.5.7 Interfacing Compiled Code to the Evaluator - p610
;   ------------------------------------------------------------------------

(-start- "5.50")



(--end-- "5.50")

;   ========================================================================
;   
;   Exercise 5.51
;   =============
;   
;   Develop a rudimentary implementation of Scheme in C (or some other
;   low-level language of your choice) by translating the explicit-control
;   evaluator of section [5.4] into C.  In order to run this code you will
;   need to also provide appropriate storage-allocation routines and other
;   run-time support.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.51]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.51
;   [Section 5.4]:   http://sicp-book.com/book-Z-H-34.html#%_sec_5.4
;   5.5.7 Interfacing Compiled Code to the Evaluator - p610
;   ------------------------------------------------------------------------

(-start- "5.51")



(--end-- "5.51")

;   ========================================================================
;   
;   Exercise 5.52
;   =============
;   
;   As a counterpoint to exercise [5.51], modify the compiler so that it
;   compiles Scheme procedures into sequences of C instructions.  Compile
;   the metacircular evaluator of section [4.1] to produce a Scheme
;   interpreter written in C.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.52]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.52
;   [Section 4.1]:   http://sicp-book.com/book-Z-H-26.html#%_sec_4.1
;   [Exercise 5.51]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.51
;   5.5.7 Interfacing Compiled Code to the Evaluator - p610
;   ------------------------------------------------------------------------

(-start- "5.52")



(--end-- "5.52")

