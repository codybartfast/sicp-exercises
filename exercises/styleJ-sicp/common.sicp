#lang sicp

#|
When moving from Racket to Sicp I've just removed stuff that sicp
doesn't like.  If/when that causes a problem I'll have to go figure...
|#

(define line-length 72)

(define nl "\n")

(define (str . parts)
  (apply string-append  parts))
;;racket:  (apply string-append  (map ~a parts)))


(define (display-line line)
  (display (str "" line nl)))

(define (display-lines lines)
  (for-each display-line lines))

(define (prnl lines)
  (for-each display-line lines))

(define (prn . lines)
  (prnl lines))

(define (dbl-un text)
  (str text nl (make-string (string-length text) #\=)))

(define (double-underline text)
  (apply prn (dbl-un text)))

(define dsh-line (make-string line-length #\-))

(define (dsh-un text)
  (list text (make-string (string-length text) #\-) ""))

(define (out title)
   (list
    dsh-line
    (str "Output: Exercise " title)
    dsh-line
    ""))
    

(define (-start- ex-number)
  (display-lines (out ex-number)))

(define (--end-- _)
  (display "\n\n"))


(define (ignore . whatever)
  (display ""))


(#%provide (all-defined))
;#########################################################################
;#########################################################################
