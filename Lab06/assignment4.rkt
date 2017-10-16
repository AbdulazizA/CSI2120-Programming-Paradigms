#lang racket
;The following function involves division. Modify the code to use if to prevent division by zero.
;(define (divideIt x) (/ (+ (* 5 x) (* 3 (* x x)) 2) x))  

(define (divideItCheck x) (if (= x 0)
                           "x can not be zero"
                           (/ (+ (* 5 x) (* 3 (* x x)) 2) x)))



;In the following expression, relplace the atoms 2 and 5 with local variables a and b with the help 
;of a let binding (but leave the program otherwise unchanged).
;(* 6 (- 10 5) (+ 2 (* 5 (- 4 (* 2 5))))) 

(let((a 2) (b 5)) (* 6 (- b 10) (+ a (* b (- 4(* a b))))))

;The following code calculates the sum of the squares for the numbers 1 to 4. 
;Use a lambda and a local let binding for the lambda to calculate the squares.
;(+ (* 1 1) (* 2 2) (* 3 3) (* 4 4))

(let ((f (lambda(x) (* x x))))
      (+ ( f 1) (f 2) (f 3) (f 4) )) 


;Write a function lettergrade that takes as input a numeric grade between 0 and 100 and applys the uOttawa 
;conversion to lettergrade. Hint: Use a conditional. You can find the grading scheme at here Use a top-level define. 
;Your function should be callable as follows:
;(lettergrade 87)
;=> 'A



(define (lettergrade x)
   (cond ((>= x 90) 'A+)
         ((>= x 85) 'A)
         ((>= x 80) 'A-)
         ((>= x 75) 'B+)
         ((>= x 70) 'B)
         ((>= x 65) 'C+)
         ((>= x 60) 'C)
         ((>= x 55) 'D+)
         ((>= x 50) 'D)
         ((>= x 40) 'E)
         (else 'F)))

(define (mysum lst)
  (let loop ((lst lst) (accum 0))
    (cond
      ((empty? lst) accum)
      ((not (number? (car lst))) '())
      (else (loop (cdr lst) (+ accum (car lst)))))))


(define (compress L)
    (if (or (null? L) (null? (cdr L))  )
       L
         (if (not(number? (car L)))
            (cons (car L) (compress(cdr L)))
            (compress(cdr L)))     
))

(define (quaternay X) 
    (if ( <= X 3 )
       X
            (cons (quaternay(floor(/ X 4))) (modulo X 4) ) 
            
))

(define (func X)
  (let loop ((n X) (acc 0) (mult 1))
    (if (< n 4)
        (+ (* mult n) acc)
        (loop (quotient n 4)
              (+ (* mult (modulo n 4)) acc)
              (* mult 10)))))

(define (cubeLess X B)
  (- B (* X (* X X))))


(define (smallerCube B)
  
  (let loop((n B) (m 1))
    (if (> n (* m (* m m)))
       (list  m (cubeLess m n) (loop n (+ m 1)))
        '())))

(define (restSum L)
     (if (not (null? L)) 
         (+ (car (cdr L)) (restSum (cdr(cdr(cdr L))))
            )
      0 ))
         
      
