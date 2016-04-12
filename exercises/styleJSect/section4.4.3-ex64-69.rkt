#lang racket

; Section 4.4.3: Is Logic Programming Mathematical Logic?

(require "common.rkt")

;   Exercise 4.64
;   =============
;   
;   Louis Reasoner mistakenly deletes the outranked-by rule (section
;   [4.4.1]) from the data base.  When he realizes this, he quickly
;   reinstalls it.  Unfortunately, he makes a slight change in the rule, and
;   types it in as
;   
;   (rule (outranked-by ?staff-person ?boss)
;         (or (supervisor ?staff-person ?boss)
;             (and (outranked-by ?middle-manager ?boss)
;                  (supervisor ?staff-person ?middle-manager))))
;   
;   Just after Louis types this information into the system, DeWitt Aull
;   comes by to find out who outranks Ben Bitdiddle. He issues the query
;   
;   (outranked-by (Bitdiddle Ben) ?who)
;   
;   After answering, the system goes into an infinite loop.  Explain why.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.64]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.64
;   [Section 4.4.1]: http://sicp-book.com/book-Z-H-29.html#%_sec_4.4.1
;   4.4.3 Is Logic Programming Mathematical Logic? - p466
;   ------------------------------------------------------------------------

(-start- "4.64")



(--end-- "4.64")

;   ========================================================================
;   
;   Exercise 4.65
;   =============
;   
;   Cy D. Fect, looking forward to the day when he will rise in the
;   organization, gives a query to find all the wheels (using the wheel rule
;   of section [4.4.1]):
;   
;   (wheel ?who)
;   
;   To his surprise, the system responds
;   
;   ;;; Query results:
;   (wheel (Warbucks Oliver))
;   (wheel (Bitdiddle Ben))
;   (wheel (Warbucks Oliver))
;   (wheel (Warbucks Oliver))
;   (wheel (Warbucks Oliver))
;   
;   Why is Oliver Warbucks listed four times?
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.65]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.65
;   [Section 4.4.1]: http://sicp-book.com/book-Z-H-29.html#%_sec_4.4.1
;   4.4.3 Is Logic Programming Mathematical Logic? - p467
;   ------------------------------------------------------------------------

(-start- "4.65")



(--end-- "4.65")

;   ========================================================================
;   
;   Exercise 4.66
;   =============
;   
;   Ben has been generalizing the query system to provide statistics about
;   the company.  For example, to find the total salaries of all the
;   computer programmers one will be able to say
;   
;   (sum ?amount
;        (and (job ?x (computer programmer))
;             (salary ?x ?amount)))
;   
;   In general, Ben's new system allows expressions of the form
;   
;   (accumulation-function <variable>
;                          <query pattern>)
;   
;   where accumulation-function can be things like sum, average, or maximum.
;   Ben reasons that it should be a cinch to implement this.  He will simply
;   feed the query pattern to qeval.  This will produce a stream of frames. 
;   He will then pass this stream through a mapping function that extracts
;   the value of the designated variable from each frame in the stream and
;   feed the resulting stream of values to the accumulation function.  Just
;   as Ben completes the implementation and is about to try it out, Cy walks
;   by, still puzzling over the wheel query result in exercise [4.65].  When
;   Cy shows Ben the system's response, Ben groans, "Oh, no, my simple
;   accumulation scheme won't work!"
;   
;   What has Ben just realized?  Outline a method he can use to salvage the
;   situation.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.66]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.66
;   [Exercise 4.65]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.65
;   4.4.3 Is Logic Programming Mathematical Logic? - p467
;   ------------------------------------------------------------------------

(-start- "4.66")



(--end-- "4.66")

;   ========================================================================
;   
;   Exercise 4.67
;   =============
;   
;   Devise a way to install a loop detector in the query system so as to
;   avoid the kinds of simple loops illustrated in the text and in exercise
;   [4.64].  The general idea is that the system should maintain some sort
;   of history of its current chain of deductions and should not begin
;   processing a query that it is already working on.  Describe what kind of
;   information (patterns and frames) is included in this history, and how
;   the check should be made.  (After you study the details of the
;   query-system implementation in section [4.4.4], you may want to modify
;   the system to include your loop detector.)
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.67]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.67
;   [Section 4.4.4]: http://sicp-book.com/book-Z-H-29.html#%_sec_4.4.4
;   [Exercise 4.64]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.64
;   4.4.3 Is Logic Programming Mathematical Logic? - p467
;   ------------------------------------------------------------------------

(-start- "4.67")



(--end-- "4.67")

;   ========================================================================
;   
;   Exercise 4.68
;   =============
;   
;   Define rules to implement the reverse operation of exercise [2.18],
;   which returns a list containing the same elements as a given list in
;   reverse order.  (Hint: Use append-to-form.) Can your rules answer both
;   (reverse (1 2 3) ?x) and (reverse ?x (1 2 3)) ?
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.68]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.68
;   [Exercise 2.18]: http://sicp-book.com/book-Z-H-29.html#%_thm_2.18
;   4.4.3 Is Logic Programming Mathematical Logic? - p468
;   ------------------------------------------------------------------------

(-start- "4.68")



(--end-- "4.68")

;   ========================================================================
;   
;   Exercise 4.69
;   =============
;   
;   Beginning with the data base and the rules you formulated in exercise
;   [4.63], devise a rule for adding "greats" to a grandson relationship.
;   This should enable the system to deduce that Irad is the great-grandson
;   of Adam, or that Jabal and Jubal are the
;   great-great-great-great-great-grandsons of Adam.  (Hint: Represent the
;   fact about Irad, for example, as ((great grandson) Adam Irad).  Write
;   rules that determine if a list ends in the word grandson.  Use this to
;   express a rule that allows one to derive the relationship ((great . 
;   ?rel) ?x ?y), where ?rel is a list ending in grandson.) Check your rules
;   on queries such as ((great grandson) ?g ?ggs) and (?relationship Adam
;   Irad).
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.69]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.69
;   [Exercise 4.63]: http://sicp-book.com/book-Z-H-29.html#%_thm_4.63
;   4.4.3 Is Logic Programming Mathematical Logic? - p468
;   ------------------------------------------------------------------------

(-start- "4.69")



(--end-- "4.69")

