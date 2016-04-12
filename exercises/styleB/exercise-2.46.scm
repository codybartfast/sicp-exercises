#lang racket
(require "../utils.scm")
(require "../meta.scm")

(title "Exercise 2.46")

;   Exercise 2.46
;   =============
;   
;   A two-dimensional vector v running from the origin to a point can be
;   represented as a pair consisting of an x-coordinate and a y-coordinate. 
;   Implement a data abstraction for vectors by giving a constructor
;   make-vect and corresponding selectors xcor-vect and ycor-vect.  In terms
;   of your selectors and constructor, implement procedures add-vect,
;   sub-vect, and scale-vect that perform the operations vector addition,
;   vector subtraction, and multiplying a vector by a scalar:
;   
;   (x₁, y₁) + (x₂, y₂) = (x₁ + x₂, y₁ + y₂)
;   (x₁, y₁) - (x₂, y₂) = (x₁ - x₂, y₁ - y₂)
;              s.(x, y) = (s.x, s.y)
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.46]: http://sicp-book.com/book-Z-H-15.html#%_thm_2.46
;   2.2.4 Example: A Picture Language - p136
;   ------------------------------------------------------------------------