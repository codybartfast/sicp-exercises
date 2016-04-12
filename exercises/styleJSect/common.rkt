#lang racket

(define nl "\n")

(define line-length 76)
(define dash-line (make-string line-length #\-))

(define (display-line line)
  (display (string-append line nl)))

(define (-start- title)
  (display-line dash-line)
  (display-line (string-append "Exercise: " title " (output)"))
  (display-line dash-line))
                
(define (--end-- title)
  (display-line "")
  ;(display-line dash-line)
  (display-line ""))
   
(provide (all-defined-out))

;###########################################################################
;###########################################################################