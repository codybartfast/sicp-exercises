#lang racket

; Section 4.3.2: Examples of Nondeterministic Programs

(require "common.rkt")

;   Exercise 4.38
;   =============
;   
;   Modify the multiple-dwelling procedure to omit the requirement that
;   Smith and Fletcher do not live on adjacent floors.  How many solutions
;   are there to this modified puzzle?
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.38]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.38
;   4.3.2 Examples of Nondeterministic Programs - p419
;   ------------------------------------------------------------------------

(-start- "4.38")



(--end-- "4.38")

;   ========================================================================
;   
;   Exercise 4.39
;   =============
;   
;   Does the order of the restrictions in the multiple-dwelling procedure
;   affect the answer? Does it affect the time to find an answer?  If you
;   think it matters, demonstrate a faster program obtained from the given
;   one by reordering the restrictions.  If you think it does not matter,
;   argue your case.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.39]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.39
;   4.3.2 Examples of Nondeterministic Programs - p419
;   ------------------------------------------------------------------------

(-start- "4.39")



(--end-- "4.39")

;   ========================================================================
;   
;   Exercise 4.40
;   =============
;   
;   In the multiple dwelling problem, how many sets of assignments are there
;   of people to floors, both before and after the requirement that floor
;   assignments be distinct?  It is very inefficient to generate all
;   possible assignments of people to floors and then leave it to
;   backtracking to eliminate them.  For example, most of the restrictions
;   depend on only one or two of the person-floor variables, and can thus be
;   imposed before floors have been selected for all the people. Write and
;   demonstrate a much more efficient nondeterministic procedure that solves
;   this problem based upon generating only those possibilities that are not
;   already ruled out by previous restrictions.  (Hint: This will require a
;   nest of let expressions.)
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.40]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.40
;   4.3.2 Examples of Nondeterministic Programs - p419
;   ------------------------------------------------------------------------

(-start- "4.40")



(--end-- "4.40")

;   ========================================================================
;   
;   Exercise 4.41
;   =============
;   
;   Write an ordinary Scheme program to solve the multiple dwelling puzzle.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.41]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.41
;   4.3.2 Examples of Nondeterministic Programs - p420
;   ------------------------------------------------------------------------

(-start- "4.41")



(--end-- "4.41")

;   ========================================================================
;   
;   Exercise 4.42
;   =============
;   
;   Solve the following "Liars" puzzle (from Phillips 1934): 
;   
;       Five schoolgirls sat for an examination.  Their parents -- so
;       they thought -- showed an undue degree of interest in the
;       result.  They therefore agreed that, in writing home about the
;       examination, each girl should make one true statement and one
;       untrue one.  The following are the relevant passages from their
;       letters:
;   
;       * Betty: "Kitty was second in the examination.  I was only
;       third."
;   
;       * Ethel: "You'll be glad to hear that I was on top.  Joan was
;       second."
;   
;       * Joan: "I was third, and poor old Ethel was bottom."
;   
;       * Kitty: "I came out second.  Mary was only fourth."
;   
;       * Mary: "I was fourth.  Top place was taken by Betty."
;   
;       What in fact the order in which the five girls were placed?
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.42]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.42
;   4.3.2 Examples of Nondeterministic Programs - p420
;   ------------------------------------------------------------------------

(-start- "4.42")



(--end-- "4.42")

;   ========================================================================
;   
;   Exercise 4.43
;   =============
;   
;   Use the amb evaluator to solve the following puzzle:⁽⁴⁹⁾ 
;   
;       Mary Ann Moore's father has a yacht and so has each of his four
;       friends: Colonel Downing, Mr. Hall, Sir Barnacle Hood, and Dr.
;       Parker.  Each of the five also has one daughter and each has
;       named his yacht after a daughter of one of the others.  Sir
;       Barnacle's yacht is the Gabrielle, Mr. Moore owns the Lorna; Mr.
;       Hall the Rosalind.  The Melissa, owned by Colonel Downing, is
;       named after Sir Barnacle's daughter.  Gabrielle's father owns
;       the yacht that is named after Dr. Parker's daughter.  Who is
;       Lorna's father? 
;   
;   Try to write the program so that it runs efficiently (see exercise
;   [4.40]).  Also determine how many solutions there are if we are not told
;   that Mary Ann's last name is Moore.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.43]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.43
;   [Exercise 4.40]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.40
;   [Footnote 49]:   http://sicp-book.com/book-Z-H-28.html#footnote_Temp_616
;   4.3.2 Examples of Nondeterministic Programs - p420
;   ------------------------------------------------------------------------

(-start- "4.43")



(--end-- "4.43")

;   ========================================================================
;   
;   Exercise 4.44
;   =============
;   
;   Exercise [2.42] described the "eight-queens puzzle" of placing queens on
;   a chessboard so that no two attack each other. Write a nondeterministic
;   program to solve this puzzle.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.44]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.44
;   [Exercise 2.42]: http://sicp-book.com/book-Z-H-28.html#%_thm_2.42
;   4.3.2 Examples of Nondeterministic Programs - p420
;   ------------------------------------------------------------------------

(-start- "4.44")



(--end-- "4.44")

;   ========================================================================
;   
;   Exercise 4.45
;   =============
;   
;   With the grammar given above, the following sentence can be parsed in
;   five different ways: "The professor lectures to the student in the class
;   with the cat." Give the five parses and explain the differences in
;   shades of meaning among them.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.45]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.45
;   4.3.2 Examples of Nondeterministic Programs - p425
;   ------------------------------------------------------------------------

(-start- "4.45")



(--end-- "4.45")

;   ========================================================================
;   
;   Exercise 4.46
;   =============
;   
;   The evaluators in sections [4.1] and [4.2] do not determine what order
;   operands are evaluated in. We will see that the amb evaluator evaluates
;   them from left to right. Explain why our parsing program wouldn't work
;   if the operands were evaluated in some other order.
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.46]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.46
;   [Section 4.1]:   http://sicp-book.com/book-Z-H-26.html#%_sec_4.1
;   [Section 4.2]:   http://sicp-book.com/book-Z-H-27.html#%_sec_4.2
;   4.3.2 Examples of Nondeterministic Programs - p425
;   ------------------------------------------------------------------------

(-start- "4.46")



(--end-- "4.46")

;   ========================================================================
;   
;   Exercise 4.47
;   =============
;   
;   Louis Reasoner suggests that, since a verb phrase is either a verb or a
;   verb phrase followed by a prepositional phrase, it would be much more
;   straightforward to define the procedure parse-verb-phrase as follows
;   (and similarly for noun phrases):
;   
;   (define (parse-verb-phrase)
;     (amb (parse-word verbs)
;          (list 'verb-phrase
;                (parse-verb-phrase)
;                (parse-prepositional-phrase))))
;   
;   Does this work?  Does the program's behavior change if we interchange
;   the order of expressions in the amb?
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.47]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.47
;   4.3.2 Examples of Nondeterministic Programs - p425
;   ------------------------------------------------------------------------

(-start- "4.47")



(--end-- "4.47")

;   ========================================================================
;   
;   Exercise 4.48
;   =============
;   
;   Extend the grammar given above to handle more complex sentences.  For
;   example, you could extend noun phrases and verb phrases to include
;   adjectives and adverbs, or you could handle compound sentences.⁽⁵³⁾
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.48]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.48
;   [Footnote 53]:   http://sicp-book.com/book-Z-H-28.html#footnote_Temp_626
;   4.3.2 Examples of Nondeterministic Programs - p426
;   ------------------------------------------------------------------------

(-start- "4.48")



(--end-- "4.48")

;   ========================================================================
;   
;   Exercise 4.49
;   =============
;   
;   Alyssa P. Hacker is more interested in generating interesting sentences
;   than in parsing them.  She reasons that by simply changing the procedure
;   parse-word so that it ignores the "input sentence" and instead always
;   succeeds and generates an appropriate word, we can use the programs we
;   had built for parsing to do generation instead.  Implement Alyssa's
;   idea, and show the first half-dozen or so sentences generated.⁽⁵⁴⁾
;   
;   ------------------------------------------------------------------------
;   [Exercise 4.49]: http://sicp-book.com/book-Z-H-28.html#%_thm_4.49
;   [Footnote 54]:   http://sicp-book.com/book-Z-H-28.html#footnote_Temp_628
;   4.3.2 Examples of Nondeterministic Programs - p426
;   ------------------------------------------------------------------------

(-start- "4.49")



(--end-- "4.49")

