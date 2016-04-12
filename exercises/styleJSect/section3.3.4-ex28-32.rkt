#lang racket

; Section 3.3.4: A Simulator for Digital Circuits

(require "common.rkt")

;   Exercise 3.28
;   =============
;   
;   Define an or-gate as a primitive function box.  Your or-gate constructor
;   should be similar to and-gate.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.28]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.28
;   3.3.4 A Simulator for Digital Circuits - p277
;   ------------------------------------------------------------------------

(-start- "3.28")



(--end-- "3.28")

;   ========================================================================
;   
;   Exercise 3.29
;   =============
;   
;   Another way to construct an or-gate is as a compound digital logic
;   device, built from and-gates and inverters.  Define a procedure or-gate
;   that accomplishes this.  What is the delay time of the or-gate in terms
;   of and-gate-delay and inverter-delay?
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.29]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.29
;   3.3.4 A Simulator for Digital Circuits - p278
;   ------------------------------------------------------------------------

(-start- "3.29")



(--end-- "3.29")

;   ========================================================================
;   
;   Exercise 3.30
;   =============
;   
;   Figure [3.27] shows a ripple-carry adder formed by stringing together n
;   full-adders.  This is the simplest form of parallel adder for adding two
;   n-bit binary numbers.  The inputs A₁, A₂, A₃, ..., A_(n) and B₁, B₂, B₃,
;   ..., B_(n) are the two binary numbers to be added (each A_(k) and B_(k)
;   is a 0 or a 1).  The circuit generates S₁, S₂, S₃, ..., S_(n), the n
;   bits of the sum, and C, the carry from the addition.  Write a procedure
;   ripple-carry-adder that generates this circuit.  The procedure should
;   take as arguments three lists of n wires each -- the A_(k), the B_(k),
;   and the S_(k) -- and also another wire C.  The major drawback of the
;   ripple-carry adder is the need to wait for the carry signals to
;   propagate.  What is the delay needed to obtain the complete output from
;   an n-bit ripple-carry adder, expressed in terms of the delays for
;   and-gates, or-gates, and inverters?
;   
;   Figure:
;   
;            A1 B1         A2 B2         A3 B3                  An Bn 
;       │    │  │   C1     │  │   C2     │  │   C3 │        │   │  │
;            │  │ ┌────┐   │  │ ┌────┐   │  │ ┌──────           │  │  Cn = 0
;       │    │  │ │    │   │  │ │    │   │  │ │    │        │   │  │ │ 
;           ┌┴──┴─┴┐   │  ┌┴──┴─┴┐   │  ┌┴──┴─┴┐               ┌┴──┴─┴┐
;       │   │      │   │  │      │   │  │      │   │        │  │      │
;           │  FA  │   │  │  FA  │   │  │  FA  │               │  FA  │
;       │   │      │   │  │      │   │  │      │   │        │  │      │
;           └─┬──┬─┘   │  └─┬──┬─┘   │  └─┬──┬─┘               └─┬──┬─┘
;       │     │  │     │    │  │     │    │  │     │        │    │  │
;   C ────────┘  │     └────┘  │     └────┘  │             ──────┘  │
;       │        │       C1    │       C2    │     │        │ Cn-1  Sn
;                S1            S2            S3                    
;   
;   Figure 3.27: A ripple-carry adder for n-bit numbers.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.30]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.30
;   [Figure 3.27]:   http://sicp-book.com/book-Z-H-22.html#%_fig_3.27
;   3.3.4 A Simulator for Digital Circuits - p278
;   ------------------------------------------------------------------------

(-start- "3.30")



(--end-- "3.30")

;   ========================================================================
;   
;   Exercise 3.31
;   =============
;   
;   The internal procedure accept-action-procedure! defined in make-wire
;   specifies that when a new action procedure is added to a wire, the
;   procedure is immediately run.  Explain why this initialization is
;   necessary.  In particular, trace through the half-adder example in the
;   paragraphs above and say how the system's response would differ if we
;   had defined accept-action-procedure! as
;   
;   (define (accept-action-procedure! proc)
;     (set! action-procedures (cons proc action-procedures)))
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.31]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.31
;   3.3.4 A Simulator for Digital Circuits - p282
;   ------------------------------------------------------------------------

(-start- "3.31")



(--end-- "3.31")

;   ========================================================================
;   
;   Exercise 3.32
;   =============
;   
;   The procedures to be run during each time segment of the agenda are kept
;   in a queue.  Thus, the procedures for each segment are called in the
;   order in which they were added to the agenda (first in, first out). 
;   Explain why this order must be used.  In particular, trace the behavior
;   of an and-gate whose inputs change from 0,1 to 1,0 in the same segment
;   and say how the behavior would differ if we stored a segment's
;   procedures in an ordinary list, adding and removing procedures only at
;   the front (last in, first out).
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.32]: http://sicp-book.com/book-Z-H-22.html#%_thm_3.32
;   3.3.4 A Simulator for Digital Circuits - p285
;   ------------------------------------------------------------------------

(-start- "3.32")



(--end-- "3.32")

