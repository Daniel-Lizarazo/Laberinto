(require (lib "graphics.ss" "graphics"));;Importacion de la libreria                             
(open-graphics);;Abrir la libreria
;;------------------------------------------
;;------------------------------------------
(define (intro);;Animación de carga
  (define wininicio (open-viewport "Between pixels" 600 503))
  ((draw-pixmap wininicio) "Logo.png" (make-posn 0 0) "blue")
  (sleep 0.13)
  ((draw-solid-rectangle wininicio)(make-posn 270 420) 10 10 "blue");;Cuadro azul
  (sleep 0.23)
  ((draw-solid-rectangle wininicio)(make-posn 290 420) 10 10 "blue")
  (sleep 0.23)
  ((draw-solid-rectangle wininicio)(make-posn 310 420) 10 10 "blue")
  (sleep 0.23)
  (close-viewport wininicio)
  (menu)
  )
;;------------------------------------------
;;Movimiento del avatar y colisiones
;;------------------------------------------
(define (intronivel1)
  (define inivel1 (open-viewport "Intro NV1" 600 503))
  ((draw-pixmap inivel1) "Nivel1.png" (make-posn 0 0) "blue")
  (get-mouse-click inivel1)
  (define x (posn-x (query-mouse-posn inivel1)))
  (define y (posn-y (query-mouse-posn inivel1)))
  (if (and (>= x 0) (<= x 600) (>= y 0) (<= y 503))
      (begin
        (close-viewport inivel1)
        (nivel1)
        )
      ))
(define (movimiento x1 y1 ventana key)
  ; (display "{")
;   (display (posn-x (query-mouse-posn ventana)))
;   (display "-")
;   (display (posn-y (query-mouse-posn ventana)))
;   (display "} ")
;   (display "[")
;   (display x1)
;   (display "-")
;   (display y1)
;   (display "] ")

      
  (define (comprobador a b);; a = valor en x // b = valor en y
    (if {or (and (> a 244) (> b 24) (< a 269) (< b 269)) (and (> a 214) (> b 30) (< a 239) (< b 207)) ;;Limites de los bordes del laberinto. Los limites se definen con cuadrilateros. Para definir un limite se requiere   
            (and (> a 152) (> b 183) (< a 245) (< b 208))  (and (> a 152) (> b 152) (< a 177) (< b 186)) ;;la esquina superior izquierda y la esquina inferior derecha. Si las coordenadas de la esquina superior izquierda fueran (x1,y1)
            (and (> a 30) (> b 30) (< a 214) (< b 55)) (and (> a 176) (> b 152) (< a 208) (< b 177));; y las de la esquina inferior derecha (x2,y2), el limite se definiria como [and (> a x1) (> b y1) (< a x1) (< b y2)]
            (and (> a 30) (> b 54) (< a 55) (< b 177)) (and (> a 54) (> b 122) (< a 86) (< b 147))
            (and (> a 122) (> b 153) (< a 153) (< b 178)) (and (> a 54) (> b 61) (< a 85) (< b 85))
            (and (> a 60) (> b 84) (< a 85) (< b 116)) (and (> a 84) (> b 91) (< a 147) (< b 116))
            (and (> a 91) (> b 60) (< a 117) (< b 92)) (and (> a 116) (> b 60) (< a 208) (< b 85))
            (and (> a 182) (> b 84) (< a 208) (< b 116)) (and (> a 152) (> b 91) (< a 183) (< b 116))
            (and (> a 152) (> b 115) (< a 177) (< b 147)) (and (> a 91) (> b 122) (< a 153) (< b 147))
            (and (> a 91) (> b 146) (< a 116) (< b 177)) (and (> a 60) (> b 152) (< a 92) (< b 177))
            (and (> a 60) (> b 176) (< a 86) (< b 239)) (and (> a 30) (> b 183) (< a 61) (< b 208))
            (and (> a 30) (> b 207) (< a 55) (< b 269)) (and (> a 54) (> b 244) (< a 177) (< b 269))
            (and (> a 91) (> b 213) (< a 117) (< b 245)) (and (> a 116) (> b 213) (< a 239) (< b 239))
            (and (> a 213) (> b 238) (< a 239) (< b 269)) (and (> a 183) (> b 244) (< a 214) (< b 269))
            (and (> a 183) (> b 122) (< a 208) (< b 153)) (and (> a 122) (> b 176) (< a 147) (< b 208))
            (and (> a 91) (> b 183) (< a 123) (< b 208))}
        #t;;se puede mover el personaje
        #f
        )
    )
  (define (puntaje)
    (if (and (> x1 249) (> y1 249) (< x1 260) (< y1 260))
        ((draw-string ventana) (make-posn 73 290) "10" "red")
        )
    )
  (if (equal? key 'down);;Abajo
      (begin
        (if (and (comprobador x1 (+ y1 18)) (comprobador (+ x1 5) (+ y1 18)) (comprobador (+ x1 8) (+ y1 18)));;Comprueba que el movimiento a realizar quede dentro del espacio definido
            (begin
              ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18);;En caso de ser verdadero elimina el espacio que ocupa
              ((draw-pixmap ventana) "Estudiante.png" (make-posn x1 (+ y1 1)) "blue");; y se re-dibuja en la dirección ingresada por teclado
              (movimiento x1 (+ y1 1) ventana (key-value (get-key-press ventana)));; espera el siguiente movimiento
              )
            (movimiento x1 y1 ventana (key-value (get-key-press ventana)));; en caso de que el movimiento no quede dentro del espacio definido se espera un nuevo movimiento
            )
        )
      (if (equal? key 'up);;Arriba
          (begin
            (if (and (comprobador x1 (- y1 1)) (comprobador (+ x1 5) (- y1 1)) (comprobador (+ x1 8) (- y1 1)))
                (begin
                  ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18)
                  ((draw-pixmap ventana) "Estudiante.png" (make-posn x1 (- y1 1)) "blue")
                  (movimiento x1 (- y1 1) ventana (key-value (get-key-press ventana)))
                  )
                (movimiento x1 y1 ventana (key-value (get-key-press ventana)))
                )
            )
          (if (equal? key 'right);;Derecha
              (begin
                (if (and (comprobador (+ x1 9) y1) (comprobador (+ x1 9) (+ y1 5)) (comprobador (+ x1 9) (+ y1 10)) (comprobador (+ x1 9) (+ y1 11)) (comprobador (+ x1 9) (+ y1 17)))
                    (begin
                      ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18)
                      ((draw-pixmap ventana) "Estudiante.png" (make-posn (+ x1 1) y1) "blue")
                      (movimiento (+ x1 1) y1 ventana (key-value (get-key-press ventana)))
                      )
                    (movimiento x1 y1 ventana (key-value (get-key-press ventana)))
                    )
                )
              
              (if (equal? key 'left);;Izquierda
                  (begin
                    (if (and (comprobador (- x1 1) y1) (comprobador (- x1 1) (+ y1 5)) (comprobador (- x1 1) (+ y1 11)) (comprobador (- x1 1) (+ y1 10)) (comprobador (- x1 1) (+ y1 17)))
                        (begin
                          (puntaje)
                          ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18)
                          ((draw-pixmap ventana) "Estudiante.png" (make-posn (- x1 1) y1) "blue")
                          (movimiento (- x1 1) y1 ventana (key-value (get-key-press ventana)))
                          )
                        (movimiento x1 y1 ventana (key-value (get-key-press ventana)))
                        )
                    )
                  (begin
                    (puntaje)
                    (movimiento x1 y1 ventana (key-value (get-key-press ventana)))
                    )  
                  )
              )
          )
      )
  )

(define (nivel1);; primer nivel
  (define win1 (open-viewport "Nivel1" 300 350));;creación de la ventana
  ((draw-pixmap win1) "Laberinto.png" (make-posn 0 0) "blue");;dibujo del laberinto
  ((draw-string win1) (make-posn 24 290) "Puntaje:" "red")
  ((draw-pixmap win1) "Parcial.png" (make-posn 185 280) "blue");;dibujo del item Parcial
  ((draw-pixmap win1) "Taller.png" (make-posn 70 133) "blue");;dibujo del item Taller
  ((draw-pixmap win1) "Estudiante.png" (make-posn 249 32) "blue");;dibujo del Avatar
  (movimiento 249 32 win1 (key-value (get-key-press win1)));;llamado a la función movimiento {movimiento x y ventana (lector de teclado)}
  )

(define (intronivel2)
  (define inivel2 (open-viewport "Intro NV2" 600 503))
  ((draw-pixmap inivel2) "Nivel2.png" (make-posn 0 0) "blue")
  (get-mouse-click inivel2)
  (define x (posn-x (query-mouse-posn inivel2)))
  (define y (posn-y (query-mouse-posn inivel2)))
  (if (and (>= x 0) (<= x 600) (>= y 0) (<= y 503))
      (begin
        (close-viewport inivel2)
        (nivel2)
        )
      ))

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
        (intronivel1)
        ))
  (if (and (>= x 330) (<= x 530) (>= y 220) (<= y 290))
      (begin
        (close-viewport winmenu)
        (intronivel2)
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
  

  

  












