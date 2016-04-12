#lang racket

; Section 3.5.3: Exploiting the Stream Paradigm

(require "common.rkt")

;   Exercise 3.63
;   =============
;   
;   Louis Reasoner asks why the sqrt-stream procedure was not written in the
;   following more straightforward way, without the local variable guesses:
;   
;   (define (sqrt-stream x)
;     (cons-stream 1.0
;                  (stream-map (lambda (guess)
;                                (sqrt-improve guess x))
;                              (sqrt-stream x))))
;   
;   Alyssa P. Hacker replies that this version of the procedure is
;   considerably less efficient because it performs redundant computation.
;   Explain Alyssa's answer.  Would the two versions still differ in
;   efficiency if our implementation of delay used only (lambda () <exp>)
;   without using the optimization provided by memo-proc (section [3.5.1])?
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.63]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.63
;   [Section 3.5.1]: http://sicp-book.com/book-Z-H-24.html#%_sec_3.5.1
;   3.5.3 Exploiting the Stream Paradigm - p338
;   ------------------------------------------------------------------------

(-start- "3.63")



(--end-- "3.63")

;   ========================================================================
;   
;   Exercise 3.64
;   =============
;   
;   Write a procedure stream-limit that takes as arguments a stream and a
;   number (the tolerance).  It should examine the stream until it finds two
;   successive elements that differ in absolute value by less than the
;   tolerance, and return the second of the two elements.  Using this, we
;   could compute square roots up to a given tolerance by
;   
;   (define (sqrt x tolerance)
;     (stream-limit (sqrt-stream x) tolerance))
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.64]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.64
;   3.5.3 Exploiting the Stream Paradigm - p338
;   ------------------------------------------------------------------------

(-start- "3.64")



(--end-- "3.64")

;   ========================================================================
;   
;   Exercise 3.65
;   =============
;   
;   Use the series
;   
;             1   1   1
;   ln2 = 1 - ─ + — - — + ···
;             1   3   4
;   
;   to compute three sequences of approximations to the natural logarithm of
;   2, in the same way we did above for π. How rapidly do these sequences
;   converge?
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.65]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.65
;   3.5.3 Exploiting the Stream Paradigm - p338
;   ------------------------------------------------------------------------

(-start- "3.65")



(--end-- "3.65")

;   ========================================================================
;   
;   Exercise 3.66
;   =============
;   
;   Examine the stream (pairs integers integers). Can you make any general
;   comments about the order in which the pairs are placed into the stream?
;   For example, about how many pairs precede the pair (1,100)? the pair
;   (99,100)? the pair (100,100)? (If you can make precise mathematical
;   statements here, all the better. But feel free to give more qualitative
;   answers if you find yourself getting bogged down.)
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.66]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.66
;   3.5.3 Exploiting the Stream Paradigm - p341
;   ------------------------------------------------------------------------

(-start- "3.66")



(--end-- "3.66")

;   ========================================================================
;   
;   Exercise 3.67
;   =============
;   
;   Modify the pairs procedure so that (pairs integers integers) will
;   produce the stream of all pairs of integers (i,j) (without the condition
;   i ≤ j).  Hint: You will need to mix in an additional stream.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.67]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.67
;   3.5.3 Exploiting the Stream Paradigm - p341
;   ------------------------------------------------------------------------

(-start- "3.67")



(--end-- "3.67")

;   ========================================================================
;   
;   Exercise 3.68
;   =============
;   
;   Louis Reasoner thinks that building a stream of pairs from three parts
;   is unnecessarily complicated.  Instead of separating the pair (S₀,T₀)
;   from the rest of the pairs in the first row, he proposes to work with
;   the whole first row, as follows:
;   
;   (define (pairs s t)
;     (interleave
;      (stream-map (lambda (x) (list (stream-car s) x))
;                  t)
;      (pairs (stream-cdr s) (stream-cdr t))))
;   
;   Does this work?  Consider what happens if we evaluate (pairs integers
;   integers) using Louis's definition of pairs.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.68]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.68
;   3.5.3 Exploiting the Stream Paradigm - p341
;   ------------------------------------------------------------------------

(-start- "3.68")



(--end-- "3.68")

;   ========================================================================
;   
;   Exercise 3.69
;   =============
;   
;   Write a procedure triples that takes three infinite streams, S, T, and
;   U, and produces the stream of triples (Sᵢ,T_(j),U_(k)) such that i ≤ j ≤
;   k. Use triples to generate the stream of all Pythagorean triples of
;   positive integers, i.e., the triples (i,j,k) such that i ≤ j and i² + j²
;   = k².
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.69]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.69
;   3.5.3 Exploiting the Stream Paradigm - p342
;   ------------------------------------------------------------------------

(-start- "3.69")



(--end-- "3.69")

;   ========================================================================
;   
;   Exercise 3.70
;   =============
;   
;   It would be nice to be able to generate streams in which the pairs
;   appear in some useful order, rather than in the order that results from
;   an ad hoc interleaving process.  We can use a technique similar to the
;   merge procedure of exercise [3.56], if we define a way to say that one
;   pair of integers is "less than" another.  One way to do this is to
;   define a "weighting function" W(i,j) and stipulate that (i₁,j₁) is less
;   than (i₂,j₂) if W(i₁,j₁) < W(i₂,j₂).  Write a procedure merge-weighted
;   that is like merge, except that merge-weighted takes an additional
;   argument weight, which is a procedure that computes the weight of a
;   pair, and is used to determine the order in which elements should appear
;   in the resulting merged stream.⁽⁶⁹⁾ Using this, generalize pairs to a
;   procedure weighted-pairs that takes two streams, together with a
;   procedure that computes a weighting function, and generates the stream
;   of pairs, ordered according to weight.  Use your procedure to generate
;   
;   a. the stream of all pairs of positive integers (i,j) with i ≤ j ordered
;   according to the sum i + j
;   
;   b.  the stream of all pairs of positive integers (i,j) with i ≤ j, where
;   neither i nor j is divisible by 2, 3, or 5, and the pairs are ordered
;   according to the sum 2 i + 3 j + 5 i j.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.70]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.70
;   [Exercise 3.56]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.56
;   [Footnote 69]:   http://sicp-book.com/book-Z-H-24.html#footnote_Temp_485
;   3.5.3 Exploiting the Stream Paradigm - p342
;   ------------------------------------------------------------------------

(-start- "3.70")



(--end-- "3.70")

;   ========================================================================
;   
;   Exercise 3.71
;   =============
;   
;   Numbers that can be expressed as the sum of two cubes in more than one
;   way are sometimes called Ramanujan numbers, in honor of the
;   mathematician Srinivasa Ramanujan.⁽⁷⁰⁾ Ordered streams of pairs provide
;   an elegant solution to the problem of computing these numbers.  To find
;   a number that can be written as the sum of two cubes in two different
;   ways, we need only generate the stream of pairs of integers (i,j)
;   weighted according to the sum i³ + j³ (see exercise [3.70]), then search
;   the stream for two consecutive pairs with the same weight.  Write a
;   procedure to generate the Ramanujan numbers.  The first such number is
;   1,729.  What are the next five?
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.71]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.71
;   [Exercise 3.70]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.70
;   [Footnote 70]:   http://sicp-book.com/book-Z-H-24.html#footnote_Temp_487
;   3.5.3 Exploiting the Stream Paradigm - p342
;   ------------------------------------------------------------------------

(-start- "3.71")



(--end-- "3.71")

;   ========================================================================
;   
;   Exercise 3.72
;   =============
;   
;   In a similar way to exercise [3.71] generate a stream of all numbers
;   that can be written as the sum of two squares in three different ways
;   (showing how they can be so written).
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.72]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.72
;   [Exercise 3.71]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.71
;   3.5.3 Exploiting the Stream Paradigm - p343
;   ------------------------------------------------------------------------

(-start- "3.72")



(--end-- "3.72")

;   ========================================================================
;   
;   Exercise 3.73
;   =============
;   
;   Figure:
;   
;    +              v              - 
;   
;         /\    /\    /\       │  │
;   ─>───/  \  /  \  /  \  /───┤  ├──
;   i        \/    \/    \/    │  │
;                R                 C
;   
;   v = v₀ + (1/C)∫_(0)^t i dt + R i 
;   
;         ┌────────────┐
;         │            │
;     ┌──>│  scale: R  ├────────────────────┐ 
;     │   │            │                    │
;     │   └────────────┘                    └──>│`-,
;     │                                         │   `-,   v
;     │   ┌────────────┐     ┌────────────┐     │ add  |>───>
;   i │   │            │     │            │     │   ,-`
;   ──┴──>│ scale: 1/C ├────>│  integral  ├────>│,-`
;         │            │     │            │     
;         └────────────┘     └────────────┘     
;                                  ^
;                                  |
;                                  v₀
;   
;   Figure 3.33: An RC circuit and the associated signal-flow diagram.
;   
;   We can model electrical circuits using streams to represent the values
;   of currents or voltages at a sequence of times.  For instance, suppose
;   we have an RC circuit consisting of a resistor of resistance R and a
;   capacitor of capacitance C in series.  The voltage response v of the
;   circuit to an injected current i is determined by the formula in figure
;   [3.33], whose structure is shown by the accompanying signal-flow
;   diagram.
;   
;   Write a procedure RC that models this circuit.  RC should take as inputs
;   the values of R, C, and dt and should return a procedure that takes as
;   inputs a stream representing the current i and an initial value for the
;   capacitor voltage v₀ and produces as output the stream of voltages v. 
;   For example, you should be able to use RC to model an RC circuit with R
;   = 5 ohms, C = 1 farad, and a 0.5-second time step by evaluating (define
;   RC1 (RC 5 1 0.5)).  This defines RC1 as a procedure that takes a stream
;   representing the time sequence of currents and an initial capacitor
;   voltage and produces the output stream of voltages.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.73]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.73
;   [Figure 3.33]:   http://sicp-book.com/book-Z-H-24.html#%_fig_3.33
;   3.5.3 Exploiting the Stream Paradigm - p344
;   ------------------------------------------------------------------------

(-start- "3.73")



(--end-- "3.73")

;   ========================================================================
;   
;   Exercise 3.74
;   =============
;   
;   Alyssa P. Hacker is designing a system to process signals coming from
;   physical sensors.  One important feature she wishes to produce is a
;   signal that describes the zero crossings of the input signal. That is,
;   the resulting signal should be + 1 whenever the input signal changes
;   from negative to positive, - 1 whenever the input signal changes from
;   positive to negative, and 0 otherwise.  (Assume that the sign of a 0
;   input is positive.) For example, a typical input signal with its
;   associated zero-crossing signal would be
;   
;   ...1  2  1.5  1  0.5  -0.1  -2  -3  -2  -0.5  0.2  3  4 ...
;   
;   ... 0  0    0  0    0     -1  0   0   0     0    1  0  0 ...
;   
;   In Alyssa's system, the signal from the sensor is represented as a
;   stream sense-data and the stream zero-crossings is the corresponding
;   stream of zero crossings.  Alyssa first writes a procedure
;   sign-change-detector that takes two values as arguments and compares the
;   signs of the values to produce an appropriate 0, 1, or - 1.  She then
;   constructs her zero-crossing stream as follows:
;   
;   (define (make-zero-crossings input-stream last-value)
;     (cons-stream
;      (sign-change-detector (stream-car input-stream) last-value)
;      (make-zero-crossings (stream-cdr input-stream)
;                           (stream-car input-stream))))
;   
;   (define zero-crossings (make-zero-crossings sense-data 0))
;   
;   Alyssa's boss, Eva Lu Ator, walks by and suggests that this program is
;   approximately equivalent to the following one, which uses the
;   generalized version of stream-map from exercise [3.50]:
;   
;   (define zero-crossings
;     (stream-map sign-change-detector sense-data <expression>))
;   
;   Complete the program by supplying the indicated <expression>.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.74]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.74
;   [Exercise 3.50]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.50
;   3.5.3 Exploiting the Stream Paradigm - p344
;   ------------------------------------------------------------------------

(-start- "3.74")



(--end-- "3.74")

;   ========================================================================
;   
;   Exercise 3.75
;   =============
;   
;   Unfortunately, Alyssa's zero-crossing detector in exercise [3.74] proves
;   to be insufficient, because the noisy signal from the sensor leads to
;   spurious zero crossings.  Lem E. Tweakit, a hardware specialist,
;   suggests that Alyssa smooth the signal to filter out the noise before
;   extracting the zero crossings.  Alyssa takes his advice and decides to
;   extract the zero crossings from the signal constructed by averaging each
;   value of the sense data with the previous value.  She explains the
;   problem to her assistant, Louis Reasoner, who attempts to implement the
;   idea, altering Alyssa's program as follows:
;   
;   (define (make-zero-crossings input-stream last-value)
;     (let ((avpt (/ (+ (stream-car input-stream) last-value) 2)))
;       (cons-stream (sign-change-detector avpt last-value)
;                    (make-zero-crossings (stream-cdr input-stream)
;                                         avpt))))
;   
;   This does not correctly implement Alyssa's plan. Find the bug that Louis
;   has installed and fix it without changing the structure of the program. 
;   (Hint: You will need to increase the number of arguments to
;   make-zero-crossings.)
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.75]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.75
;   [Exercise 3.74]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.74
;   3.5.3 Exploiting the Stream Paradigm - p345
;   ------------------------------------------------------------------------

(-start- "3.75")



(--end-- "3.75")

;   ========================================================================
;   
;   Exercise 3.76
;   =============
;   
;   Eva Lu Ator has a criticism of Louis's approach in exercise [3.75].  The
;   program he wrote is not modular, because it intermixes the operation of
;   smoothing with the zero-crossing extraction.  For example, the extractor
;   should not have to be changed if Alyssa finds a better way to condition
;   her input signal.  Help Louis by writing a procedure smooth that takes a
;   stream as input and produces a stream in which each element is the
;   average of two successive input stream elements.  Then use smooth as a
;   component to implement the zero-crossing detector in a more modular
;   style.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.76]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.76
;   [Exercise 3.75]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.75
;   3.5.3 Exploiting the Stream Paradigm - p346
;   ------------------------------------------------------------------------

(-start- "3.76")



(--end-- "3.76")

