#lang racket

; Section 2.1.2: Abstraction Barriers

(require "common.rkt")

;   Exercise 2.2
;   ============
;   
;   Consider the problem of representing line segments in a plane.  Each
;   segment is represented as a pair of points: a starting point and an
;   ending point. Define a constructor make-segment and selectors
;   start-segment and end-segment that define the representation of segments
;   in terms of points.  Furthermore, a point can be represented as a pair
;   of numbers: the x coordinate and the y coordinate.  Accordingly, specify
;   a constructor make-point and selectors x-point and y-point that define
;   this representation.  Finally, using your selectors and constructors,
;   define a procedure midpoint-segment that takes a line segment as
;   argument and returns its midpoint (the point whose coordinates are the
;   average of the coordinates of the endpoints). To try your procedures,
;   you'll need a way to print points:
;   
;   (define (print-point p)
;     (newline)
;     (display "(")
;     (display (x-point p))
;     (display ",")
;     (display (y-point p))
;     (display ")"))
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.2]:  http://sicp-book.com/book-Z-H-14.html#%_thm_2.2
;   2.1.2 Abstraction Barriers - p89
;   ------------------------------------------------------------------------

(-start- "2.2")



(--end-- "2.2")

;   ========================================================================
;   
;   Exercise 2.3
;   ============
;   
;   Implement a representation for rectangles in a plane. (Hint: You may
;   want to make use of exercise [2.2].) In terms of your constructors and
;   selectors, create procedures that compute the perimeter and the area of
;   a given rectangle.  Now implement a different representation for
;   rectangles.  Can you design your system with suitable abstraction
;   barriers, so that the same perimeter and area procedures will work using
;   either representation?
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.3]:  http://sicp-book.com/book-Z-H-14.html#%_thm_2.3
;   [Exercise 2.2]:  http://sicp-book.com/book-Z-H-14.html#%_thm_2.2
;   2.1.2 Abstraction Barriers - p90
;   ------------------------------------------------------------------------

(-start- "2.3")



(--end-- "2.3")

