(require (lib "graphics.ss" "graphics"))
(open-graphics)                                ;Abrir la libreria
(require (lib "draw.ss" "htdp"))
(define wininicio (open-viewport "Between pixels" 600 503))
((draw-solid-rectangle wininicio) (make-posn 0 0) 600 503 "red")
(define (nivel1)
  (define win1 (open-viewport "Nivel1" 200 200))
  ((draw-solid-rectangle win1)(make-posn 100 100) 10 10 "red")
  ((draw-solid-rectangle win1) (make-posn 0 0) 600 503 "red")
  ((draw-string win1) (make-posn 130 180) "Puntaje:" "red")
  


(define (movimiento x1 y1 lad1 key)
  (if (equal? key 'down)
      (begin
        (cuadro x1 y1 lad1)
        (movimiento x1 (+ y1 5) lad1 (key-value (get-key-press win1))) )
      (if (equal? key 'up)
          (begin
            (cuadro x1 y1 lad1)
            (movimiento x1 (- y1 5) lad1 (key-value (get-key-press win1))) )
          (if (equal? key 'right)
              (begin
                (cuadro x1 y1 lad1)
                (movimiento (+ x1 5) y1 lad1 (key-value (get-key-press win1))) )
              (if (equal? key 'left)
                  (begin
                    (cuadro x1 y1 lad1)
                    (movimiento (- x1 5) y1 lad1 (key-value (get-key-press win1))) )
                  (movimiento x1 y1 lad1 (key-value (get-key-press win1)))
                  )))))
    (define (cuadro x y lad)                       
        (begin
          ((draw-solid-rectangle win1)(make-posn x y) lad lad "blue")   
          ((clear-solid-rectangle win1)(make-posn x y) lad lad) 
          (if (and (>= x 100) (<= x 110) (>= y 100) (<= 110))
              (begin
                (puntaje)
                )
              )))
    
  (define (puntaje)
    ((draw-string win1) (make-posn 185 180) "10" "red"))
    

(movimiento 0 0 10 (key-value (get-key-press win1)))
  )
(nivel1)
