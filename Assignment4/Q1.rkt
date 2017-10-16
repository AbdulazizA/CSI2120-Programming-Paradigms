#lang racket

(define (qsort e)
  (if (or (null? e) (<= (length e) 1)) e
      (let loop ((left null) (right null)
                   (pivot (car e)) (rest (cdr e)))
            (if (null? rest)
                (append (append (qsort left) (list pivot)) (qsort right))
               (if (<= (car rest) pivot)
                    (loop (append left (list (car rest))) right pivot (cdr rest))
                    (loop left (append right (list (car rest))) pivot (cdr rest)))))))

(define (ordered? lst)
      (cond ((null? lst) #t)
            ((eq? (length lst) 1) #t)
      ((> (car (cdr lst)) (car lst))
        (ordered? (cdr lst)))
      (else #f))
     )

(define (checkSorted lst)
  (let loop ((n lst) (acc `()) (count 1))
    (cond 
      ((and (null? n) (null? acc)) #t)
      ((and (null? n) (not(null? acc))) (begin  (display "\"ERROR: The following lists are not sorted: ") (display (reverse acc))(display "\"") #f))
      (else (if (ordered? (car n))
        (loop (cdr n) acc (+ count 1))
        (loop (cdr n) (cons count acc) (+ count 1))
        )   
    ))
  ))

(define (mergeALot lst)
 (cond ((checkSorted lst)
 (qsort (apply append lst))) 
  ))
(mergeALot '((1 4 7) (5 6 1)))