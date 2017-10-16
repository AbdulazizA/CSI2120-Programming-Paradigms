#lang racket

(define (filter a b)
  (filter1 a b (norm a)))

(define (filter1 a b c)
  (if (null? a)
      null
      (if (and (>= (length b)(length a))(> (length a) 0))
          (cons (norm(map (lambda (x y) (*(/ x c) y)) a (sameS a b))) (filter1 a (cdr b) c))
          (filter1 (removel a) b c ))))
   
(define (norm l)
  (if (null? l) 0
      (+(car l) (norm(cdr l)))))

(define (removel a)
    (if (null? (cdr a))
        '()
        (cons (car a) (removel (cdr a)))))
  
(define (sameS a b)
  (if(null? a)
     '()
     (cons (car b) (sameS (cdr a) (cdr b)))))