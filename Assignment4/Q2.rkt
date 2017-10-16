#lang racket
(define (ourLog x e)

(define (logHelper x e counter val1)

(let ((val2 (/ (expt x counter) counter)))

  (cond
    [(even? counter)
      (let ((val3 (- val1 val2)))
        (if (< (abs (- val3 val1)) e)
            (display (list val3 counter))
        (logHelper x e (+ counter 1) val3)))]
            
    [else (let ((val3 (+ val1 val2)))
        (if (< (abs (- val3 val1)) e)
            (display (list val3 counter))
        (logHelper x e (+ counter 1) val3)))]
      
  )

  )
  )
(cond [(not(and (>= e 0) (<= e 1))) (display "Invalid precision value")]
      [(not(and (>= x -1)(<= x 1))) (display "Invalid x value")]
      [else (logHelper x e 2 (/ x 1))]
 )
)
  