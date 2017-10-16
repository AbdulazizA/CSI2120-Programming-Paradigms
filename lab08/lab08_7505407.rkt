(define (removeLetter s x)
  (list->string (delete x (string->list s) '())
   ))
  
(define (delete n lst clean)
  (cond
    ((empty? lst) clean)
    ((equal? n (car lst)) (delete n (cdr lst) clean))
    (else
      (delete n (cdr lst) (append clean (list (car lst)))))))