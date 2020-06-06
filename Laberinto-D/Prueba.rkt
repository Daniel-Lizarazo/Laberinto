;; -----------------------------------------
(require (lib "graphics.ss" "graphics"))
(require 2htdp/universe)
(require 2htdp/image);Importacion de la libreria
(open-graphics)                                ;Abrir la libreria
 ;Dibujar la ventana principal
;;------------------------------------------
;



;;------------------------------------------
(define win1 (open-viewport "Nivel1" 350 350))
((draw-viewport win1) "red")
((draw-pixmap win1) "labe.png" (make-posn 0 0) "blue")
((draw-string win1) (make-posn 24 290) "Puntaje:" "red")
((draw-solid-rectangle win1)(make-posn 249 249) 5 5 "red")
((draw-pixmap win1) "tesoro.png" (make-posn 185 280) "blue")

(define (movimiento x1 y1 lad1 key)
  (display (posn-x (query-mouse-posn win1)))
  (display "-")
  (display "/")
  (display (posn-y (query-mouse-posn win1)))
  (display "/")
      
  (define (comprobador a b)
    (if (or (and (> a 244) (> b 24) (< a 269) (< b 269)) (and (> a 213) (> b 31) (< a 239) (< b 207)) (and (> a 152) (> b 183) (< a 245) (< b 208)) (and (> a 153) (> b 152) (< a 177) (< b 184)))
        #t
        #f
        )
    )
  (define (puntaje)
    (if (and (> x1 249) (> y1 249) (< x1 260) (< y1 260))
        ((draw-string win1) (make-posn 73 290) "10" "red")
        )
    )
      
  (if (equal? key 'down)
      (begin
        (if (comprobador x1 (+ y1 24))
            (begin
              ((clear-solid-rectangle win1)(make-posn x1 y1) 20 24)
              ((draw-pixmap win1) "hombre.png" (make-posn x1 (+ y1 1)) "blue")
              (movimiento x1 (+ y1 1) lad1 (key-value (get-key-press win1)))
              )
            (movimiento x1 y1 lad1 (key-value (get-key-press win1)))
            )
        )
      (if (equal? key 'up)
          (begin
            (if (comprobador x1 (- y1 1) )
                (begin
                  ((clear-solid-rectangle win1)(make-posn x1 y1) 20 24)
                  ((draw-pixmap win1) "hombre.png" (make-posn x1 (- y1 1)) "blue")
                  (movimiento x1 (- y1 1) lad1 (key-value (get-key-press win1)))
                  )
                (movimiento x1 y1 lad1 (key-value (get-key-press win1)))
                )
            )
          (if (equal? key 'right)
              (begin
                (if (comprobador (+ x1 20) y1)
                    (begin
                      ((clear-solid-rectangle win1)(make-posn x1 y1) 20 24)
                      ((draw-pixmap win1) "hombre.png" (make-posn (+ x1 1) y1) "blue")
                      (movimiento (+ x1 1) y1 lad1 (key-value (get-key-press win1)))
                      )
                    (movimiento x1 y1 lad1 (key-value (get-key-press win1)))
                    )
                )
              
          (if (equal? key 'left)
              (begin
                (if (comprobador (- x1 1) y1)
                    (begin
                      (puntaje)
                      ((clear-solid-rectangle win1)(make-posn x1 y1) 20 24)
                      ((draw-pixmap win1) "hombre.png" (make-posn (- x1 1) y1) "blue")
                      (movimiento (- x1 1) y1 lad1 (key-value (get-key-press win1)))
                      )
                    (movimiento x1 y1 lad1 (key-value (get-key-press win1)))
                    )
                )
              
          (begin
            (puntaje)
            (movimiento x1 y1 lad1 (key-value (get-key-press win1)))
            )
                      
          )
      )
  )
)
      
      
)
  
        
      
    

  (movimiento 247 32 10 (key-value (get-key-press win1)))
            