;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname bisectionmethod) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; (bm function posn error) consumes a function and a posn, Posn, and produces
;; a root of the function with margin of error, error
;; bm: Function Posn Num

;; Requires:
;; * Function to be a one variable lambda function

(define (bm function posn error)
  (local
    [(define ivt (/ (+ (posn-x posn) (posn-y posn)) 2))]
    (cond
      [(< (abs (function ivt)) error) ivt]
      [(< (function ivt) 0) (bm function (make-posn ivt (posn-y posn)))]
      [else (bm function (make-posn (posn-x posn) ivt))])))
