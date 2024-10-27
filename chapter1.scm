; 1.2
;--------------
(define answer
        (/ (+ 5
              4
              (- 2 (- 3 (+ 6 (/ 4 5)))))
           (* 3
              (- 6 2)
              (- 2 7))))
(display answer)
(newline)

; 1.3
;--------------
(define (square x) (* x x))
(define (proc x y z)
  (cond ((and (<= x y) (<= x z)) (+ (square y) (square z)))
        ((and (<= y x) (<= y z)) (+ (square x) (square z)))
        (else (+ (square x) (square y)))))
(define answer (proc 1 3 5))
(display answer)
(newline)

; 1.4
;---------------
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
; if b is greater than zero, the operator is an
; addition, otherwise it is a subtraction thus
; adding the absolute value of b

; 1.5
;---------------
;(define (p) (p))
;
;(define (test x y)
;  (if (= x 0)
;      0
;      y))
;(define answer (test 0 (p)))

; normal order execution expands everything
; first and then evaluates it, which results in the
; fork-bomb (p) never executing.
; With applicative-order, (p) as an argument is immediately
; evaluated which results in an endless recursion and locks
; up the interpreter

; Code from 1.1.7:
;---------------
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (sqrt x)
  (sqrt-iter 1.0 x))

(define answer (sqrt 9))
(display answer)
(newline)

; 1.6
;------------------
;(define (new-if predicate then-clause else-clause)
;  (cond (predicate then-clause)
;        (else else-clause)))
;
;(define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;          guess
;          (sqrt-iter (improve guess x)
;                     x)))
;
;(define answer (sqrt 9))
;(display answer)
;(newline)

; new-if will eagerly evaluate sqrt-iter because of applicative
; order evaluation, causing an infinite recursion.
; a normal if conditional is special in that the consequent or
; alternative get computer strictly after the predicate.
