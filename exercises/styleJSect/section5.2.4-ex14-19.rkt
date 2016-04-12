#lang racket

; Section 5.2.4: Monitoring Machine Performance

(require "common.rkt")

;   Exercise 5.14
;   =============
;   
;   Measure the number of pushes and the maximum stack depth required to
;   compute n! for various small values of n using the factorial machine
;   shown in figure [5.11].  From your data determine formulas in terms of n
;   for the total number of push operations and the maximum stack depth used
;   in computing n! for any n > 1. Note that each of these is a linear
;   function of n and is thus determined by two constants.  In order to get
;   the statistics printed, you will have to augment the factorial machine
;   with instructions to initialize the stack and print the statistics. You
;   may want to also modify the machine so that it repeatedly reads a value
;   for n, computes the factorial, and prints the result (as we did for the
;   GCD machine in figure [5.4]), so that you will not have to repeatedly
;   invoke get-register-contents, set-register-contents!, and start.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.14]: http://sicp-book.com/book-Z-H-32.html#%_thm_5.14
;   [Figure 5.11]:   http://sicp-book.com/book-Z-H-31.html#%_fig_5.11
;   [Figure 5.4]:    http://sicp-book.com/book-Z-H-31.html#%_fig_5.4
;   5.2.4 Monitoring Machine Performance - p532
;   ------------------------------------------------------------------------

(-start- "5.14")



(--end-- "5.14")

;   ========================================================================
;   
;   Exercise 5.15
;   =============
;   
;   Add instruction counting to the register machine simulation. That is,
;   have the machine model keep track of the number of instructions
;   executed.  Extend the machine model's interface to accept a new message
;   that prints the value of the instruction count and resets the count to
;   zero.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.15]: http://sicp-book.com/book-Z-H-32.html#%_thm_5.15
;   5.2.4 Monitoring Machine Performance - p532
;   ------------------------------------------------------------------------

(-start- "5.15")



(--end-- "5.15")

;   ========================================================================
;   
;   Exercise 5.16
;   =============
;   
;   Augment the simulator to provide for instruction tracing. That is,
;   before each instruction is executed, the simulator should print the text
;   of the instruction.  Make the machine model accept trace-on and
;   trace-off messages to turn tracing on and off.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.16]: http://sicp-book.com/book-Z-H-32.html#%_thm_5.16
;   5.2.4 Monitoring Machine Performance - p532
;   ------------------------------------------------------------------------

(-start- "5.16")



(--end-- "5.16")

;   ========================================================================
;   
;   Exercise 5.17
;   =============
;   
;   Extend the instruction tracing of exercise [5.16] so that before
;   printing an instruction, the simulator prints any labels that
;   immediately precede that instruction in the controller sequence.  Be
;   careful to do this in a way that does not interfere with instruction
;   counting (exercise [5.15]). You will have to make the simulator retain
;   the necessary label information.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.17]: http://sicp-book.com/book-Z-H-32.html#%_thm_5.17
;   [Exercise 5.16]: http://sicp-book.com/book-Z-H-32.html#%_thm_5.16
;   [Exercise 5.15]: http://sicp-book.com/book-Z-H-32.html#%_thm_5.15
;   5.2.4 Monitoring Machine Performance - p532
;   ------------------------------------------------------------------------

(-start- "5.17")



(--end-- "5.17")

;   ========================================================================
;   
;   Exercise 5.18
;   =============
;   
;   Modify the make-register procedure of section [5.2.1] so that registers
;   can be traced. Registers should accept messages that turn tracing on and
;   off.  When a register is traced, assigning a value to the register
;   should print the name of the register, the old contents of the register,
;   and the new contents being assigned.  Extend the interface to the
;   machine model to permit you to turn tracing on and off for designated
;   machine registers.
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.18]: http://sicp-book.com/book-Z-H-32.html#%_thm_5.18
;   [Section 5.2.1]: http://sicp-book.com/book-Z-H-32.html#%_sec_5.2.1
;   5.2.4 Monitoring Machine Performance - p532
;   ------------------------------------------------------------------------

(-start- "5.18")



(--end-- "5.18")

;   ========================================================================
;   
;   Exercise 5.19
;   =============
;   
;   Alyssa P. Hacker wants a breakpoint feature in the simulator to help her
;   debug her machine designs.  You have been hired to install this feature
;   for her.  She wants to be able to specify a place in the controller
;   sequence where the simulator will stop and allow her to examine the
;   state of the machine.  You are to implement a procedure
;   
;   (set-breakpoint <machine> <label> <n>)
;   
;   that sets a breakpoint just before the nth instruction after the given
;   label.  For example,
;   
;   (set-breakpoint gcd-machine 'test-b 4)
;   
;   installs a breakpoint in gcd-machine just before the assignment to
;   register a.  When the simulator reaches the breakpoint it should print
;   the label and the offset of the breakpoint and stop executing
;   instructions.  Alyssa can then use get-register-contents and
;   set-register-contents! to manipulate the state of the simulated machine.
;   She should then be able to continue execution by saying
;   
;   (proceed-machine <machine>)
;   
;   She should also be able to remove a specific breakpoint by means of
;   
;   (cancel-breakpoint <machine> <label> <n>)
;   
;   or to remove all breakpoints by means of
;   
;   (cancel-all-breakpoints <machine>)
;   
;   ------------------------------------------------------------------------
;   [Exercise 5.19]: http://sicp-book.com/book-Z-H-32.html#%_thm_5.19
;   5.2.4 Monitoring Machine Performance - p532
;   ------------------------------------------------------------------------

(-start- "5.19")



(--end-- "5.19")

