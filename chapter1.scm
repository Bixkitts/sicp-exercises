#! 1.2 !#
(define answer
        (/ (+ 5
              4
              (- 2 (- 3 (+ 6 (/ 4 5)))))
           (* 3
              (- 6 2)
              (- 2 7))))
(display answer)
(newline)

#! 1.3 !#
(define (square x) (* x x))
(define (proc x y z)
  (cond ((and (<= x y) (<= x z)) (+ (square y) (square z)))
        ((and (<= y x) (<= y z)) (+ (square x) (square z)))
        (else (+ (square x) (square y)))))
(define answer (proc 1 3 5))
(display answer)
(newline)
