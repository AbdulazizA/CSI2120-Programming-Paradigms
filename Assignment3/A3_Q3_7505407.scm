(define (cubeLess X B)
  (- B (* X (* X X))))


(define (smallerCube a)  (let ((count 1))  (smallerCube1 a count))) 
(define (smallerCube1 a count)  (if ( >(* count (* count count)) a)      '()      
(cons (list count (cubeLess count a)) (smallerCube1 a (+ count 1)))))

(define (restSum L)
     (if (not (null? L)) 
         (+ (car (cdr L)) (restSum (cdr(cdr(cdr L))))
            )
      0 ))