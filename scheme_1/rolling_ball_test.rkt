#lang racket/base

(require rackunit
         "rolling_ball.rkt")

(test-case
 "should process no bouns frame"
 (check-equal? (process-frame (list 1 2 3)) (list 3 3)))

(test-case "should process spare frame"
           (check-equal? (process-frame (list 2 8 3)) (list 13 3)))

(test-case "should process strike frame"
           (check-equal? (process-frame (list 10 2 3)) (list 15 2 3)))

(test-case "should process last frame"
           (check-equal? (process-last-frame (list 10 2)) (list 12)))

(test-case "should process whole game"
           (check-equal? (game (list 1 4 4 5 6 4 5 5 10 0 1 7 3 6 4 10 2 8 6)) 133))

(test-case "should process perfect game"
           (check-equal? (game (list 10 10 10 10 10 10 10 10 10 10 10 10)) 300))
