#lang racket/base

(define (process-frame strikes)
  ;(display "\nprocess-frame:")
  ;(display strikes)
  (cond
    ((= (car strikes) 10)
     (cons (+ (car strikes) (cadr strikes) (caddr strikes)) (cdr strikes)))
    ((= (+ (car strikes) (cadr strikes)) 10)
     (cons (+ (car strikes) (cadr strikes) (caddr strikes)) (cddr strikes))) 
    (else
     (cons (+ (car strikes) (cadr strikes)) (cddr strikes)))))

(define (process-last-frame strikes)
  ;(display "\nprocess-last-frame:")
  (list (apply + strikes)))

(define (game strikes)
    (begin
      (define (process-game times score strikes)
        (cond ((= times 10) (+ score (car (process-last-frame strikes))))
              (else (letrec ((ac (process-frame strikes)))
                      (process-game (+ times 1) (+ score (car ac)) (cdr ac))))))
      (process-game 1 0 strikes)))




(define basic-game-strikes (list 1 4 4 5 6 4 5 5 10 0 1 7 3 6 4 10 2 8 6))
(game basic-game-strikes)
(define perfect-game-strikes (list 10 10 10 10 10 10 10 10 10 10 10 10))
(game perfect-game-strikes)

(provide process-frame
         process-last-frame
         game)

