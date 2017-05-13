#lang racket

(require "common.rkt")

;   Exercise 1.45
;   =============
;   
;   We saw in section [1.3.3] that attempting to compute square roots by
;   naively finding a fixed point of y → x/y does not converge, and that
;   this can be fixed by average damping.  The same method works for finding
;   cube roots as fixed points of the average-damped y → x/y².
;   Unfortunately, the process does not work for fourth roots -- a single
;   average damp is not enough to make a fixed-point search for y → x/y³
;   converge.  On the other hand, if we average damp twice (i.e., use the
;   average damp of the average damp of y → x/y³) the fixed-point search
;   does converge.  Do some experiments to determine how many average damps
;   are required to compute nth roots as a fixed-point search based upon
;   repeated average damping of y → x/yⁿ⁻¹.  Use this to implement a simple
;   procedure for computing nth roots using fixed-point, average-damp, and
;   the repeated procedure of exercise [1.43]. Assume that any arithmetic
;   operations you need are available as primitives.
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.45]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.45
;   [Section 1.3.3]: http://sicp-book.com/book-Z-H-12.html#%_sec_1.3.3
;   [Exercise 1.43]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.43
;   1.3.4 Procedures as Returned Values - p78
;   ------------------------------------------------------------------------

(-start- "1.45")



(--end-- "1.45")

