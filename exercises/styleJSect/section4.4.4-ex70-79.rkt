#lang racket

; Section 4.4.4: Implementing the Query System

(require "common.rkt")

;   Exercise 4.70
;   =============
;   
;   What is the purpose of the let bindings in the procedures add-assertion!
;   and add-rule! ?  What would be wrong with the following implementation
;   of add-assertion! ? Hint: Recall the definition of the infinite stream
;   of ones in section [3.5.2]: (define ones (cons-stream 1 ones)).
;   
;   (define (add-assertion! assertion)
;     (store-assertion-in-index assertion)
;     (set! THE-ASSERTIONS
;           (cons-stream assertion THE-ASSERTIONS))
;     'ok)
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.70]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.70
;   [Section 3.5.2]: http://sicp-book.com/book-Z-H-24.html#%_sec_3.5.2
;   4.4.4 Implementing the Query System - p482
;   ------------------------------------------------------------------------

(-start- "4.70")



(--end-- "4.70")

;   ========================================================================
;   
;   Exercise 4.71
;   =============
;   
;   Louis Reasoner wonders why the simple-query and disjoin procedures
;   (section [4.4.4.2]) are implemented using explicit delay operations,
;   rather than being defined as follows:
;   
;   (define (simple-query query-pattern frame-stream)
;     (stream-flatmap
;      (lambda (frame)
;        (stream-append (find-assertions query-pattern frame)
;                       (apply-rules query-pattern frame)))
;      frame-stream))
;   (define (disjoin disjuncts frame-stream)
;     (if (empty-disjunction? disjuncts)
;         the-empty-stream
;         (interleave
;          (qeval (first-disjunct disjuncts) frame-stream)
;          (disjoin (rest-disjuncts disjuncts) frame-stream))))
;   
;   Can you give examples of queries where these simpler definitions would
;   lead to undesirable behavior?
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.71]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.71
;   [Section 4.4.4.2]: http://sicp-book.com/book-Z-H-29.html#%_sec_4.4.4.2
;   4.4.4 Implementing the Query System - p486
;   ------------------------------------------------------------------------

(-start- "4.71")



(--end-- "4.71")

;   ========================================================================
;   
;   Exercise 4.72
;   =============
;   
;   Why do disjoin and stream-flatmap interleave the streams rather than
;   simply append them?  Give examples that illustrate why interleaving
;   works better.  (Hint: Why did we use interleave in section [3.5.3]?)
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.72]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.72
;   [Section 3.5.3]: http://sicp-book.com/book-Z-H-24.html#%_sec_3.5.3
;   4.4.4 Implementing the Query System - p487
;   ------------------------------------------------------------------------

(-start- "4.72")



(--end-- "4.72")

;   ========================================================================
;   
;   Exercise 4.73
;   =============
;   
;   Why does flatten-stream use delay explicitly? What would be wrong with
;   defining it as follows:
;   
;   (define (flatten-stream stream)
;     (if (stream-null? stream)
;         the-empty-stream
;         (interleave
;          (stream-car stream)
;          (flatten-stream (stream-cdr stream)))))
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.73]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.73
;   4.4.4 Implementing the Query System - p487
;   ------------------------------------------------------------------------

(-start- "4.73")



(--end-- "4.73")

;   ========================================================================
;   
;   Exercise 4.74
;   =============
;   
;   Alyssa P. Hacker proposes to use a simpler version of stream-flatmap in
;   negate, lisp-value, and find-assertions. She observes that the procedure
;   that is mapped over the frame stream in these cases always produces
;   either the empty stream or a singleton stream, so no interleaving is
;   needed when combining these streams.
;   
;   a. Fill in the missing expressions in Alyssa's program.
;   
;   (define (simple-stream-flatmap proc s)
;     (simple-flatten (stream-map proc s)))
;   
;   (define (simple-flatten stream)
;     (stream-map <??>
;                 (stream-filter <??> stream)))
;   
;   b. Does the query system's behavior change if we change it in this way?
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.74]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.74
;   4.4.4 Implementing the Query System - p487
;   ------------------------------------------------------------------------

(-start- "4.74")



(--end-- "4.74")

;   ========================================================================
;   
;   Exercise 4.75
;   =============
;   
;   Implement for the query language a new special form called unique. 
;   Unique should succeed if there is precisely one item in the data base
;   satisfying a specified query.  For example,
;   
;   (unique (job ?x (computer wizard)))
;   
;   should print the one-item stream
;   
;   (unique (job (Bitdiddle Ben) (computer wizard)))
;   
;   since Ben is the only computer wizard, and
;   
;   (unique (job ?x (computer programmer)))
;   
;   should print the empty stream, since there is more than one computer
;   programmer.  Moreover,
;   
;   (and (job ?x ?j) (unique (job ?anyone ?j)))
;   
;   should list all the jobs that are filled by only one person, and the
;   people who fill them.
;   
;   There are two parts to implementing unique.  The first is to write a
;   procedure that handles this special form, and the second is to make
;   qeval dispatch to that procedure.  The second part is trivial, since
;   qeval does its dispatching in a data-directed way.  If your procedure is
;   called uniquely-asserted, all you need to do is
;   
;   (put 'unique 'qeval uniquely-asserted)
;   
;   and qeval will dispatch to this procedure for every query whose type
;   (car) is the symbol unique.
;   
;   The real problem is to write the procedure uniquely-asserted. This
;   should take as input the contents (cdr) of the unique query, together
;   with a stream of frames.  For each frame in the stream, it should use
;   qeval to find the stream of all extensions to the frame that satisfy the
;   given query.  Any stream that does not have exactly one item in it
;   should be eliminated.  The remaining streams should be passed back to be
;   accumulated into one big stream that is the result of the unique query. 
;   This is similar to the implementation of the not special form.
;   
;   Test your implementation by forming a query that lists all people who
;   supervise precisely one person.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.75]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.75
;   4.4.4 Implementing the Query System - p488
;   ------------------------------------------------------------------------

(-start- "4.75")



(--end-- "4.75")

;   ========================================================================
;   
;   Exercise 4.76
;   =============
;   
;   Our implementation of and as a series combination of queries (figure
;   [4.5]) is elegant, but it is inefficient because in processing the
;   second query of the and we must scan the data base for each frame
;   produced by the first query.  If the data base has N elements, and a
;   typical query produces a number of output frames proportional to N (say
;   N/k), then scanning the data base for each frame produced by the first
;   query will require N²/k calls to the pattern matcher.  Another approach
;   would be to process the two clauses of the and separately, then look for
;   all pairs of output frames that are compatible.  If each query produces
;   N/k output frames, then this means that we must perform N²/k²
;   compatibility checks -- a factor of k fewer than the number of matches
;   required in our current method.
;   
;   Devise an implementation of and that uses this strategy.  You must
;   implement a procedure that takes two frames as inputs, checks whether
;   the bindings in the frames are compatible, and, if so, produces a frame
;   that merges the two sets of bindings.  This operation is similar to
;   unification.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.76]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.76
;   [Figure 4.5]:    http://sicp-book.com/book-Z-H-29.html#%_fig_4.5
;   4.4.4 Implementing the Query System - p488
;   ------------------------------------------------------------------------

(-start- "4.76")



(--end-- "4.76")

;   ========================================================================
;   
;   Exercise 4.77
;   =============
;   
;   In section [4.4.3] we saw that not and lisp-value can cause the query
;   language to give "wrong" answers if these filtering operations are
;   applied to frames in which variables are unbound.  Devise a way to fix
;   this shortcoming.  One idea is to perform the filtering in a "delayed"
;   manner by appending to the frame a "promise" to filter that is fulfilled
;   only when enough variables have been bound to make the operation
;   possible.  We could wait to perform filtering until all other operations
;   have been performed.  However, for efficiency's sake, we would like to
;   perform filtering as soon as possible so as to cut down on the number of
;   intermediate frames generated.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.77]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.77
;   [Section 4.4.3]: http://sicp-book.com/book-Z-H-29.html#%_sec_4.4.3
;   4.4.4 Implementing the Query System - p489
;   ------------------------------------------------------------------------

(-start- "4.77")



(--end-- "4.77")

;   ========================================================================
;   
;   Exercise 4.78
;   =============
;   
;   Redesign the query language as a nondeterministic program to be
;   implemented using the evaluator of section [4.3], rather than as a
;   stream process.  In this approach, each query will produce a single
;   answer (rather than the stream of all answers) and the user can type
;   try-again to see more answers.  You should find that much of the
;   mechanism we built in this section is subsumed by nondeterministic
;   search and backtracking.  You will probably also find, however, that
;   your new query language has subtle differences in behavior from the one
;   implemented here.  Can you find examples that illustrate this
;   difference?
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.78]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.78
;   [Section 4.3]:   http://sicp-book.com/book-Z-H-28.html#%_sec_4.3
;   4.4.4 Implementing the Query System - p489
;   ------------------------------------------------------------------------

(-start- "4.78")



(--end-- "4.78")

;   ========================================================================
;   
;   Exercise 4.79
;   =============
;   
;   When we implemented the Lisp evaluator in section [4.1], we saw how to
;   use local environments to avoid name conflicts between the parameters of
;   procedures.  For example, in evaluating
;   
;   (define (square x)
;     (* x x))
;   (define (sum-of-squares x y)
;     (+ (square x) (square y)))
;   (sum-of-squares 3 4)
;   
;   there is no confusion between the x in square and the x in
;   sum-of-squares, because we evaluate the body of each procedure in an
;   environment that is specially constructed to contain bindings for the
;   local variables.  In the query system, we used a different strategy to
;   avoid name conflicts in applying rules.  Each time we apply a rule we
;   rename the variables with new names that are guaranteed to be unique. 
;   The analogous strategy for the Lisp evaluator would be to do away with
;   local environments and simply rename the variables in the body of a
;   procedure each time we apply the procedure.
;   
;   Implement for the query language a rule-application method that uses
;   environments rather than renaming.  See if you can build on your
;   environment structure to create constructs in the query language for
;   dealing with large systems, such as the rule analog of block-structured
;   procedures.  Can you relate any of this to the problem of making
;   deductions in a context (e.g., "If I supposed that P were true, then I
;   would be able to deduce A and B.") as a method of problem solving? 
;   (This problem is open-ended.  A good answer is probably worth a Ph.D.)
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.79]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.79
;   [Section 4.1]:   http://sicp-book.com/book-Z-H-26.html#%_sec_4.1
;   4.4.4 Implementing the Query System - p489
;   ------------------------------------------------------------------------

(-start- "4.79")



(--end-- "4.79")

