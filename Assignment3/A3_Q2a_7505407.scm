(define (sumNumbers lst)
	(define (sumNum lst)
		(if (null? lst)
			'(0)
                (let ((comp (sumNum (cdr lst))))
                          (if (number? (car lst))
                              (cons (+ (car lst) (car comp)) (cdr comp))
                              (append comp (list (car lst)))
                              
                           )
                  )
		)
	)
  
	(if (list? lst)
		(reverse(sumNum lst))
                #f
	)
)