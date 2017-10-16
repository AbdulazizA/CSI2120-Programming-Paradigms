#lang racket
(define (sum-list l)
  (let loop ((l l) (acc 0))
    (if (null? l)
        acc
        (loop (cdr l) (+ (car l) acc))
        )))