#lang racket

; Section 5.5.6: Lexical Addressing

(require "common.rkt")

;   Exercise 5.39
;   =============
;   
;   Write a procedure lexical-address-lookup that implements the new lookup
;   operation.  It should take two arguments -- a lexical address and a
;   run-time environment -- and return the value of the variable stored at
;   the specified lexical address.  Lexical-address-lookup should signal an
;   error if the value of the variable is the symbol *unassigned*.⁽⁴⁶⁾ Also
;   write a procedure lexical-address-set! that implements the operation
;   that changes the value of the variable at a specified lexical address.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.39]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.39
;   [Footnote 46]:   http://sicp-book.com/book-Z-H-35.html#footnote_Temp_826
;   5.5.6 Lexical Addressing - p602
;   ------------------------------------------------------------------------

(-start- "5.39")



(--end-- "5.39")

;   ========================================================================
;   
;   Exercise 5.40
;   =============
;   
;   Modify the compiler to maintain the compile-time environment as
;   described above.  That is, add a compile-time-environment argument to
;   compile and the various code generators, and extend it in
;   compile-lambda-body.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.40]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.40
;   5.5.6 Lexical Addressing - p602
;   ------------------------------------------------------------------------

(-start- "5.40")



(--end-- "5.40")

;   ========================================================================
;   
;   Exercise 5.41
;   =============
;   
;   Write a procedure find-variable that takes as arguments a variable and a
;   compile-time environment and returns the lexical address of the variable
;   with respect to that environment.  For example, in the program fragment
;   that is shown above, the compile-time environment during the compilation
;   of expression <e1> is ((y z) (a b c d e) (x y)).  Find-variable should
;   produce
;   
;   (find-variable 'c '((y z) (a b c d e) (x y)))
;   (1 2)
;   
;   (find-variable 'x '((y z) (a b c d e) (x y)))
;   (2 0)
;   
;   (find-variable 'w '((y z) (a b c d e) (x y)))
;   not-found
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.41]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.41
;   5.5.6 Lexical Addressing - p602
;   ------------------------------------------------------------------------

(-start- "5.41")



(--end-- "5.41")

;   ========================================================================
;   
;   Exercise 5.42
;   =============
;   
;   Using find-variable from exercise [5.41], rewrite compile-variable and
;   compile-assignment to output lexical-address instructions.  In cases
;   where find-variable returns not-found (that is, where the variable is
;   not in the compile-time environment), you should have the code
;   generators use the evaluator operations, as before, to search for the
;   binding. (The only place a variable that is not found at compile time
;   can be is in the global environment, which is part of the run-time
;   environment but is not part of the compile-time environment.⁽⁴⁷⁾ Thus,
;   if you wish, you may have the evaluator operations look directly in the
;   global environment, which can be obtained with the operation (op
;   get-global-environment), instead of having them search the whole
;   run-time environment found in env.) Test the modified compiler on a few
;   simple cases, such as the nested lambda combination at the beginning of
;   this section.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.42]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.42
;   [Exercise 5.41]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.41
;   [Footnote 47]:   http://sicp-book.com/book-Z-H-35.html#footnote_Temp_830
;   5.5.6 Lexical Addressing - p602
;   ------------------------------------------------------------------------

(-start- "5.42")



(--end-- "5.42")

;   ========================================================================
;   
;   Exercise 5.43
;   =============
;   
;   We argued in section [4.1.6] that internal definitions for block
;   structure should not be considered "real" defines.  Rather, a procedure
;   body should be interpreted as if the internal variables being defined
;   were installed as ordinary lambda variables initialized to their correct
;   values using set!.  Section [4.1.6] and exercise [4.16] showed how to
;   modify the metacircular interpreter to accomplish this by scanning out
;   internal definitions.  Modify the compiler to perform the same
;   transformation before it compiles a procedure body.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.43]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.43
;   [Section 4.1.6]: http://sicp-book.com/book-Z-H-26.html#%_sec_4.1.6
;   [Exercise 4.16]: http://sicp-book.com/book-Z-H-35.html#%_thm_4.16
;   5.5.6 Lexical Addressing - p603
;   ------------------------------------------------------------------------

(-start- "5.43")



(--end-- "5.43")

;   ========================================================================
;   
;   Exercise 5.44
;   =============
;   
;   In this section we have focused on the use of the compile-time
;   environment to produce lexical addresses.  But there are other uses for
;   compile-time environments.  For instance, in exercise [5.38] we
;   increased the efficiency of compiled code by open-coding primitive
;   procedures.  Our implementation treated the names of open-coded
;   procedures as reserved words.  If a program were to rebind such a name,
;   the mechanism described in exercise [5.38] would still open-code it as a
;   primitive, ignoring the new binding.  For example, consider the
;   procedure
;   
;   (lambda (+ * a b x y)
;     (+ (* a x) (* b y)))
;   
;   which computes a linear combination of x and y.  We might call it with
;   arguments +matrix, *matrix, and four matrices, but the open-coding
;   compiler would still open-code the + and the * in (+ (* a x) (* b y)) as
;   primitive + and *.  Modify the open-coding compiler to consult the
;   compile-time environment in order to compile the correct code for
;   expressions involving the names of primitive procedures. (The code will
;   work correctly as long as the program does not define or set! these
;   names.)
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.44]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.44
;   [Exercise 5.38]: http://sicp-book.com/book-Z-H-35.html#%_thm_5.38
;   5.5.6 Lexical Addressing - p603
;   ------------------------------------------------------------------------

(-start- "5.44")



(--end-- "5.44")

