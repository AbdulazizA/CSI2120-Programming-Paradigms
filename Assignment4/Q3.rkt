#lang racket

(define (lca T k1 k2)

  (define (listHelper T k1 k2)

    (cond
      [(and (member k1 (flatten (cadr T))) (member k2 (flatten (cddr T)))) (print T)]
      [(and (member k1 (flatten (car T)))  (member k2 (flatten (cddr T)))) (print T)]
      [(and (member k1 (flatten (cadr T))) (member k2 (flatten (car T)))) (print T)]
      [(and (member k2 (flatten (cadr T))) (member k1 (flatten (cddr T)))) (print T)]
      [(and (member k2 (flatten (car T))) (member k1 (flatten (cddr T)))) (print T)]
      [(and (member k2 (flatten (cadr T))) (member k1 (flatten (car T)))) (print T)]
      [(and (member k1 (flatten (cadr T))) (member k2 (flatten (cadr T)))) (listHelper (cadr T) k1 k2)]
      [(and (member k1 (flatten (cddr T))) (member k2 (flatten (cddr T)))) (listHelper (car (cddr T)) k1 k2)]
    )
   )
  
 (cond
    [(and (member k1 (flatten T)) (member k2 (flatten T)))  (listHelper T k1 k2)]
    [else '()]
 )  
)