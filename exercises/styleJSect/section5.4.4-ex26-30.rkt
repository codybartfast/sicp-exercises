#lang racket

; Section 5.4.4: Running the Evaluator

(require "common.rkt")

;   Exercise 5.26
;   =============
;   
;   Use the monitored stack to explore the tail-recursive property of the
;   evaluator (section [5.4.2]).  Start the evaluator and define the
;   iterative factorial procedure from section [1.2.1]:
;   
;   (define (factorial n)
;     (define (iter product counter)
;       (if (> counter n)
;           product
;           (iter (* counter product)
;                 (+ counter 1))))
;     (iter 1 1))
;   
;   Run the procedure with some small values of n.  Record the maximum stack
;   depth and the number of pushes required to compute n! for each of these
;   values.
;   
;   a.  You will find that the maximum depth required to evaluate n! is
;   independent of n.  What is that depth?
;   
;   b.  Determine from your data a formula in terms of n for the total
;   number of push operations used in evaluating n! for any n ≥ 1. Note that
;   the number of operations used is a linear function of n and is thus
;   determined by two constants.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.26]: http://sicp-book.com/book-Z-H-34.html#%_thm_5.26
;   [Section 5.4.2]: http://sicp-book.com/book-Z-H-34.html#%_sec_5.4.2
;   [Section 1.2.1]: http://sicp-book.com/book-Z-H-11.html#%_sec_1.2.1
;   5.4.4 Running the Evaluator - p564
;   ------------------------------------------------------------------------

(-start- "5.26")



(--end-- "5.26")

;   ========================================================================
;   
;   Exercise 5.27
;   =============
;   
;   For comparison with exercise [5.26], explore the behavior of the
;   following procedure for computing factorials recursively:
;   
;   (define (factorial n)
;     (if (= n 1)
;         1
;         (* (factorial (- n 1)) n)))
;   
;   By running this procedure with the monitored stack, determine, as a
;   function of n, the maximum depth of the stack and the total number of
;   pushes used in evaluating n! for n ≥ 1.  (Again, these functions will be
;   linear.) Summarize your experiments by filling in the following table
;   with the appropriate expressions in terms of n:
;   
;             Maximum depth Number of pushes
;   Recursive                               
;   factorial                               
;   Iterative                               
;   factorial                               
;   
;   The maximum depth is a measure of the amount of space used by the
;   evaluator in carrying out the computation, and the number of pushes
;   correlates well with the time required.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.27]: http://sicp-book.com/book-Z-H-34.html#%_thm_5.27
;   [Exercise 5.26]: http://sicp-book.com/book-Z-H-34.html#%_thm_5.26
;   5.4.4 Running the Evaluator - p564
;   ------------------------------------------------------------------------

(-start- "5.27")



(--end-- "5.27")

;   ========================================================================
;   
;   Exercise 5.28
;   =============
;   
;   Modify the definition of the evaluator by changing eval-sequence as
;   described in section [5.4.2] so that the evaluator is no longer
;   tail-recursive.  Rerun your experiments from exercises [5.26] and [5.27]
;   to demonstrate that both versions of the factorial procedure now require
;   space that grows linearly with their input.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.28]: http://sicp-book.com/book-Z-H-34.html#%_thm_5.28
;   [Section 5.4.2]: http://sicp-book.com/book-Z-H-34.html#%_sec_5.4.2
;   [Exercise 5.26]: http://sicp-book.com/book-Z-H-34.html#%_thm_5.26
;   [Exercise 5.27]: http://sicp-book.com/book-Z-H-34.html#%_thm_5.27
;   5.4.4 Running the Evaluator - p565
;   ------------------------------------------------------------------------

(-start- "5.28")



(--end-- "5.28")

;   ========================================================================
;   
;   Exercise 5.29
;   =============
;   
;   Monitor the stack operations in the tree-recursive Fibonacci
;   computation:
;   
;   (define (fib n)
;     (if (< n 2)
;         n
;         (+ (fib (- n 1)) (fib (- n 2)))))
;   
;   a.  Give a formula in terms of n for the maximum depth of the stack
;   required to compute Fib(n) for n ≥ 2.  Hint: In section [1.2.2] we
;   argued that the space used by this process grows linearly with n.
;   
;   b.  Give a formula for the total number of pushes used to compute Fib(n)
;   for n ≥ 2.  You should find that the number of pushes (which correlates
;   well with the time used) grows exponentially with n.  Hint: Let S(n) be
;   the number of pushes used in computing Fib(n).  You should be able to
;   argue that there is a formula that expresses S(n) in terms of S(n - 1),
;   S(n - 2), and some fixed "overhead" constant k that is independent of n.
;   Give the formula, and say what k is.  Then show that S(n) can be
;   expressed as a Fib(n + 1) + b and give the values of a and b.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.29]: http://sicp-book.com/book-Z-H-34.html#%_thm_5.29
;   [Section 1.2.2]: http://sicp-book.com/book-Z-H-11.html#%_sec_1.2.2
;   5.4.4 Running the Evaluator - p565
;   ------------------------------------------------------------------------

(-start- "5.29")



(--end-- "5.29")

;   ========================================================================
;   
;   Exercise 5.30
;   =============
;   
;   Our evaluator currently catches and signals only two kinds of errors --
;   unknown expression types and unknown procedure types.  Other errors will
;   take us out of the evaluator read-eval-print loop.  When we run the
;   evaluator using the register-machine simulator, these errors are caught
;   by the underlying Scheme system.  This is analogous to the computer
;   crashing when a user program makes an error.⁽³²⁾ It is a large project
;   to make a real error system work, but it is well worth the effort to
;   understand what is involved here.
;   
;   a. Errors that occur in the evaluation process, such as an attempt to
;   access an unbound variable, could be caught by changing the lookup
;   operation to make it return a distinguished condition code, which cannot
;   be a possible value of any user variable.  The evaluator can test for
;   this condition code and then do what is necessary to go to signal-error.
;   Find all of the places in the evaluator where such a change is necessary
;   and fix them.  This is lots of work.
;   
;   b. Much worse is the problem of handling errors that are signaled by
;   applying primitive procedures, such as an attempt to divide by zero or
;   an attempt to extract the car of a symbol.  In a professionally written
;   high-quality system, each primitive application is checked for safety as
;   part of the primitive.  For example, every call to car could first check
;   that the argument is a pair.  If the argument is not a pair, the
;   application would return a distinguished condition code to the
;   evaluator, which would then report the failure.  We could arrange for
;   this in our register-machine simulator by making each primitive
;   procedure check for applicability and returning an appropriate
;   distinguished condition code on failure. Then the primitive-apply code
;   in the evaluator can check for the condition code and go to signal-error
;   if necessary.  Build this structure and make it work. This is a major
;   project.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.30]: http://sicp-book.com/book-Z-H-34.html#%_thm_5.30
;   [Footnote 32]:   http://sicp-book.com/book-Z-H-34.html#footnote_Temp_793
;   5.4.4 Running the Evaluator - p565
;   ------------------------------------------------------------------------

(-start- "5.30")



(--end-- "5.30")
