#lang racket

(require "common.rkt")

;   Exercise 2.84
;   =============
;   
;   Using the raise operation of exercise [2.83], modify the apply-generic
;   procedure so that it coerces its arguments to have the same type by the
;   method of successive raising, as discussed in this section.  You will
;   need to devise a way to test which of two types is higher in the tower. 
;   Do this in a manner that is "compatible" with the rest of the system and
;   will not lead to problems in adding new levels to the tower.
;   
;   ------------------------------------------------------------------------
;   [Exercise 2.84]: http://sicp-book.com/book-Z-H-18.html#%_thm_2.84
;   [Exercise 2.83]: http://sicp-book.com/book-Z-H-18.html#%_thm_2.83
;   2.5.2 Combining Data of Different Types - p201
;   ------------------------------------------------------------------------

(-start- "2.84")



(--end-- "2.84")

