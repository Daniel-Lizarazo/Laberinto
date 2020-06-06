(require (lib "graphics.ss" "graphics"))       ;Importacion de la libreria                             ;Abrir la libreria
(require 2htdp/universe)
(require 2htdp/image)
(open-graphics)  
;;------------------------------------------
(define (intro)
  (define wininicio (open-viewport "Between pixels" 600 503))
  ((draw-pixmap wininicio) "Logo.png" (make-posn 0 0) "blue")
  (sleep 0.1)
  ((draw-solid-rectangle wininicio)(make-posn 270 420) 10 10 "blue")
  (sleep 0.2)
  ((draw-solid-rectangle wininicio)(make-posn 290 420) 10 10 "blue")
  (sleep 0.2)
  ((draw-solid-rectangle wininicio)(make-posn 310 420) 10 10 "blue")
  (sleep 0.2)
  (close-viewport wininicio)
  (menu)
  )

(define (nivel1)
  (define win1 (open-viewport "Nivel1" 350 350)) 
  ((draw-pixmap win1) "labe.png" (make-posn 0 0) "blue")
  ((draw-string win1) (make-posn 24 290) "Puntaje:" "red")
  ((draw-solid-rectangle win1)(make-posn 249 249) 5 5 "red")
  ((draw-pixmap win1) "Parcial.png" (make-posn 185 280) "blue")

  (define (movimiento x1 y1 lad1 key)
    (display (posn-x (query-mouse-posn win1)))
    (display "-")
    (display "/")
    (display (posn-y (query-mouse-posn win1)))
    (display "/")
      
    (define (comprobador a b);; a = valor en x // b = valor en y
      (if {or (and (> a 244) (> b 24) (< a 269) (< b 269)) (and (> a 213) (> b 30) (< a 239) (< b 207)) ;;Limites de los bordes del laberinto. Los limites se definen con cuadrilateros. Para definir un limite se requiere   
              (and (> a 152) (> b 183) (< a 245) (< b 208))  (and (> a 152) (> b 152) (< a 177) (< b 186)) ;;la esquina superior izquierda y la esquina inferior derecha. Si las coordenadas de la esquina superior izquierda fueran (x1,y1)
              (and (> a 30) (> b 30) (< a 214) (< b 55)) (and (> a 176) (> b 152) (< a 208) (< b 177))
              (and (> a 30) (> b 54) (< a 55) (< b 177)) (and (> a 54) (> b 122) (< a 86) (< b 147))
              (and (> a 122) (> b 153) (< a 153) (< b 178)) };; y las de la esquina inferior derecha (x2,y2), el limite se definiria como [and (> a x1) (> b y1) (< a x1) (< b y2)]
          #t;;se puede mover el personaje
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
          (if (and (comprobador x1 (+ y1 18)) (comprobador (+ x1 5) (+ y1 18)) (comprobador (+ x1 8) (+ y1 18))) 
              (begin
                ((clear-solid-rectangle win1)(make-posn x1 y1) 9 18)
                ((draw-pixmap win1) "Estudiante.png" (make-posn x1 (+ y1 1)) "blue")
                (movimiento x1 (+ y1 1) lad1 (key-value (get-key-press win1)))
                )
              (movimiento x1 y1 lad1 (key-value (get-key-press win1)))
              )
          )
        (if (equal? key 'up)
            (begin
              (if (and (comprobador x1 (- y1 1)) (comprobador (+ x1 5) (- y1 1)) (comprobador (+ x1 8) (- y1 1)))
                  (begin
                    ((clear-solid-rectangle win1)(make-posn x1 y1) 9 18)
                    ((draw-pixmap win1) "Estudiante.png" (make-posn x1 (- y1 1)) "blue")
                    (movimiento x1 (- y1 1) lad1 (key-value (get-key-press win1)))
                    )
                  (movimiento x1 y1 lad1 (key-value (get-key-press win1)))
                  )
              )
            (if (equal? key 'right)
                (begin
                  (if (and (comprobador (+ x1 9) y1) (comprobador (+ x1 9) (+ y1 5)) (comprobador (+ x1 9) (+ y1 10)) (comprobador (+ x1 9) (+ y1 11)) (comprobador (+ x1 9) (+ y1 17)))
                      (begin
                        ((clear-solid-rectangle win1)(make-posn x1 y1) 9 18)
                        ((draw-pixmap win1) "Estudiante.png" (make-posn (+ x1 1) y1) "blue")
                        (movimiento (+ x1 1) y1 lad1 (key-value (get-key-press win1)))
                        )
                      (movimiento x1 y1 lad1 (key-value (get-key-press win1)))
                      )
                  )
              
                (if (equal? key 'left)
                    (begin
                      (if (and (comprobador (- x1 1) y1) (comprobador (- x1 1) (+ y1 5)) (comprobador (- x1 1) (+ y1 11)) (comprobador (- x1 1) (+ y1 10)) (comprobador (- x1 1) (+ y1 17)))
                          (begin
                            (puntaje)
                            ((clear-solid-rectangle win1)(make-posn x1 y1) 9 18)
                            ((draw-pixmap win1) "Estudiante.png" (make-posn (- x1 1) y1) "blue")
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

  ((draw-pixmap win1) "Taller.png" (make-posn 70 133) "blue")
  ((draw-pixmap win1) "Estudiante.png" (make-posn 249 32) "blue")
  (movimiento 249 32 10 (key-value (get-key-press win1)))
  )

(define (instrucciones)
  (define instruc (open-viewport "Instrucciones" 600 503))
  ((draw-pixmap instruc) "Instrucciones.png" (make-posn 0 0) "blue")
  (get-mouse-click instruc)
  (define x (posn-x (query-mouse-posn instruc)))
  (define y (posn-y (query-mouse-posn instruc)))
  (if (and (>= x 490) (<= x 590) (>= y 460) (<= y 495))
      (begin
        (close-viewport instruc)
        (menu)
        )
      (begin
        (close-viewport instruc)
        (instrucciones)
        ))
  )
(define (creditos)
  (define cred (open-viewport "Créditos" 600 503))
  ((draw-pixmap cred) "Créditos.png" (make-posn 0 0) "blue")
  (get-mouse-click cred)
  (define x (posn-x (query-mouse-posn cred)))
  (define y (posn-y (query-mouse-posn cred)))
  (if (and (>= x 490) (<= x 590) (>= y 20) (<= y 55))
      (begin
        (close-viewport cred)
        (menu)
        ))
  (if (and (>= x 0) (<= x 955) (>= y 0) (<= y 900))
      (begin
        (close-viewport cred)
        (creditos)
        ))
  )

  
(define (menu)
  (define winmenu (open-viewport "Menú principal" 600 503))
  ((draw-pixmap winmenu) "Menú.png" (make-posn 0 0) "blue")
  (get-mouse-click winmenu)
  (define x (posn-x (query-mouse-posn winmenu)))
  (define y (posn-y (query-mouse-posn winmenu)))
  (if (and (>= x 70) (<= x 270) (>= y 220) (<= y 290))
      (begin
        (close-viewport winmenu)
        (nivel1)
        ))
  (if (and (>= x 330) (<= x 530) (>= y 220) (<= y 290))
      (begin
        (close-viewport winmenu)
        ;(nivel2)
        ))
  (if (and (>= x 210) (<= x 410) (>= y 350) (<= y 390))
      (begin
        (close-viewport winmenu)
        (instrucciones)
        ))
  (if (and (>= x 245) (<= x 375) (>= y 420) (<= y 460))
      (begin
        (close-viewport winmenu)
        (creditos)
        ))
  (if (and (>= x 0) (<= x 955) (>= y 0) (<= y 900))
      (begin
        (close-viewport winmenu)
        (menu)
        ))
  )

(intro)
  

  

  












