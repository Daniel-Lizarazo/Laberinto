(require (lib "graphics.ss" "graphics"));;Importacion de la libreria                             
(open-graphics);;Abrir la libreria
;;------------------------------------------
;;------------------------------------------
(define (intro);;Animación de carga
  (define wininicio (open-viewport "Between pixels" 600 503))
  ((draw-pixmap wininicio) "Logo.png" (make-posn 0 0) "blue")
  (sleep 0.1)
  ((draw-solid-rectangle wininicio)(make-posn 270 420) 10 10 "blue");;Cuadro azul
  (sleep 0.1)
  ((draw-solid-rectangle wininicio)(make-posn 290 420) 10 10 "blue")
  (sleep 0.1)
  ((draw-solid-rectangle wininicio)(make-posn 310 420) 10 10 "blue")
  (sleep 0.1)
  (close-viewport wininicio)
  (menu)
  )

;;------------------------------------------
;;Puntaje
;;------------------------------------------
(define (puntaje p d x y cont ventana);;Esta función cumple con el objetivo de mostrar en pantalla el puntaje actual del jugador, para eso divide cada digito del puntaje actual y dibuja una imagen con el número correspondiente
  (if (< cont 3)
      (cond ((= (modulo (quotient p d) 10) 0) (begin
                                                ((draw-pixmap ventana) "0.png" (make-posn x y) "blue");; p = puntaje d = variable para separar digitos x = posición en X para dibujar la imagen
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 1) (begin
                                                ((draw-pixmap ventana) "1.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 2) (begin
                                                ((draw-pixmap ventana) "2.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 3) (begin
                                                ((draw-pixmap ventana) "3.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 4) (begin
                                                ((draw-pixmap ventana) "4.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 5) (begin
                                                ((draw-pixmap ventana) "5.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 6) (begin
                                                ((draw-pixmap ventana) "6.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 7) (begin
                                                ((draw-pixmap ventana) "7.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 8) (begin
                                                ((draw-pixmap ventana) "8.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 9) (begin
                                                ((draw-pixmap ventana) "9.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 9) (begin
                                                ((draw-pixmap ventana) "9.png" (make-posn x y) "blue")
                                                (puntaje p (/ d 10) (+ x 18) y (+ cont 1) ventana)
                                                )
                                              )
            (else display "are you crack?")
            )
      (display " Uribe = paraco")
      )
  )

;;------------------------------------------
;;Movimiento del avatar y colisiones
;;------------------------------------------
(define (comprobador a b);; a = valor en x // b = valor en y
  (if {or (and (> a 244) (> b 24) (< a 269) (< b 269)) (and (> a 214) (> b 30) (< a 239) (< b 207)) ;;Limites de los bordes del laberinto. Los limites se definen con cuadrilateros. Para definir un limite se requiere   
          (and (> a 152) (> b 183) (< a 245) (< b 208))  (and (> a 152) (> b 152) (< a 177) (< b 186)) ;;la esquina superior izquierda y la esquina inferior derecha. Si las coordenadas de la esquina superior izquierda fueran (x1,y1)
          (and (> a 30) (> b 30) (< a 215) (< b 55)) (and (> a 176) (> b 152) (< a 208) (< b 177));; y las de la esquina inferior derecha (x2,y2), el limite se definiria como [and (> a x1) (> b y1) (< a x1) (< b y2)]
          (and (> a 30) (> b 54) (< a 55) (< b 177)) (and (> a 54) (> b 122) (< a 86) (< b 147))
          (and (> a 122) (> b 153) (< a 153) (< b 178)) (and (> a 54) (> b 61) (< a 85) (< b 85))
          (and (> a 60) (> b 84) (< a 85) (< b 116)) (and (> a 84) (> b 91) (< a 147) (< b 116))
          (and (> a 91) (> b 60) (< a 117) (< b 92)) (and (> a 116) (> b 60) (< a 208) (< b 85))
          (and (> a 182) (> b 84) (< a 208) (< b 116)) (and (> a 152) (> b 91) (< a 183) (< b 116))
          (and (> a 152) (> b 115) (< a 177) (< b 147)) (and (> a 91) (> b 122) (< a 153) (< b 147))
          (and (> a 91) (> b 146) (< a 116) (< b 177)) (and (> a 60) (> b 152) (< a 92) (< b 177))
          (and (> a 60) (> b 176) (< a 86) (< b 238)) (and (> a 30) (> b 183) (< a 61) (< b 208))
          (and (> a 30) (> b 207) (< a 55) (< b 269)) (and (> a 54) (> b 244) (< a 177) (< b 269))
          (and (> a 91) (> b 213) (< a 117) (< b 245)) (and (> a 116) (> b 213) (< a 239) (< b 239))
          (and (> a 213) (> b 238) (< a 239) (< b 269)) (and (> a 183) (> b 244) (< a 214) (< b 269))
          (and (> a 183) (> b 122) (< a 208) (< b 153)) (and (> a 122) (> b 176) (< a 147) (< b 208))
          (and (> a 91) (> b 183) (< a 123) (< b 208)) (and (> a 183) (> b 268) (< a 208) (< b 269))}
      #t;;se puede mover el personaje
      #f
      )
  )

(define (Salida1 puntos1)
  (define salida (open-viewport "Salida - Nivel 1" 600 503))
  ((draw-pixmap salida) "Salida1.png" (make-posn 0 0) "blue")
  (puntaje puntos1 100 432 307 0 salida)
  (play-sound "Final.mp3" #t)
  (get-mouse-click salida)
  (define x (posn-x (query-mouse-posn salida)))
  (define y (posn-y (query-mouse-posn salida)))
  (if (and (>= x 0) (<= x 600) (>= y 0) (<= y 503))
      (begin
        (close-viewport salida)
        (menu)
        )
      )
  )

(define (movimiento x1 y1 ventana ventana2 key puntos item1 item2 item3 item4);; puntos = puntos sumados en el nivel items = items recogidos
  
  
  (define (salida x y)
    (if (and (> x 182) (> y 268) (< x 208) (< y 272))
        (begin
          (close-viewport ventana)
          (Salida1 puntos)
          )
        )
    )
  (define (objetos a b ventana vetana2)
    (if (and (> a 70) (> b 133) (< a 85) (< b 148))
        (begin
          ((clear-solid-rectangle ventana)(make-posn 70 133) 15 14)
          (if (= item1 0)
              (begin
                (play-sound "item2.mp3" #t)
                (puntaje (+ 35 puntos) 100 203 294 0 ventana)
                (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) (+ puntos 35) (+ item1 1) item2 item3 item4)
                )
              )
          )
        (if (and (> a 187) (> b 125) (< a 201) (< b 139))
            (begin
              ((clear-solid-rectangle ventana)(make-posn 187 125) 15 14)
              (if (= item2 0)
                  (begin
                    (play-sound "item2.mp3" #t)
                    (puntaje (+ 35 puntos) 100 203 294 0 ventana)
                    (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) (+ puntos 35) item1 (+ item2 1) item3 item4)
                    )
                  )
              )
                
            )
        )
    )
  
    

  (if (equal? key 'down);;Abajo
      (begin
        (if (and (comprobador x1 (+ y1 18)) (comprobador (+ x1 5) (+ y1 18)) (comprobador (+ x1 8) (+ y1 18)));;Comprueba que el movimiento a realizar quede dentro del espacio definido
            (begin
              (objetos x1 (+ y1 18) ventana ventana2)
              (objetos (+ x1 5) (+ y1 18) ventana ventana2)
              (objetos (+ x1 8) (+ y1 18) ventana ventana2)
              ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18);;En caso de ser verdadero elimina el espacio que ocupa
              ((draw-pixmap ventana) "Estudiante.png" (make-posn x1 (+ y1 1)) "blue");; y se re-dibuja en la dirección ingresada por teclado
              (movimiento x1 (+ y1 1) ventana  ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4);; espera el siguiente movimiento
              )
            (begin
              (salida (+ x1 8) (+ y1 18))
              (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4);; en caso de que el movimiento no quede dentro del espacio definido se espera un nuevo movimiento
              )
            )
        )
      (if (equal? key 'up);;Arriba
          (begin
            (if (and (comprobador x1 (- y1 1)) (comprobador (+ x1 5) (- y1 1)) (comprobador (+ x1 8) (- y1 1)))
                (begin
                  (objetos x1 (- y1 1) ventana ventana2)
                  (objetos (+ x1 5) (- y1 1) ventana ventana2)
                  (objetos (+ x1 8) (- y1 1) ventana ventana2)
                  ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18)
                  ((draw-pixmap ventana) "Estudiante.png" (make-posn x1 (- y1 1)) "blue")
                  (movimiento x1 (- y1 1) ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4)
                  )
                (begin
                  (salida x1 (- y1 1))
                  (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4);; en caso de que el movimiento no quede dentro del espacio definido se espera un nuevo movimiento
                  )
                )
            )
          (if (equal? key 'right);;Derecha
              (begin
                (if (and (comprobador (+ x1 9) y1) (comprobador (+ x1 9) (+ y1 5)) (comprobador (+ x1 9) (+ y1 10)) (comprobador (+ x1 9) (+ y1 11)) (comprobador (+ x1 9) (+ y1 17)))
                    (begin
                      (objetos (+ x1 9) y1 ventana ventana2)
                      (objetos (+ x1 9) (+ y1 5) ventana ventana2)
                      (objetos (+ x1 9) (+ y1 10) ventana ventana2)
                      (objetos (+ x1 9) (+ y1 11) ventana ventana2)
                      (objetos (+ x1 9) (+ y1 17) ventana ventana2)
                      ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18)
                      ((draw-pixmap ventana) "Estudiante.png" (make-posn (+ x1 1) y1) "blue")
                      (movimiento (+ x1 1) y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4)
                      )
                    (begin
                      (salida (+ x1 9) (+ y1 17))
                      (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4);; en caso de que el movimiento no quede dentro del espacio definido se espera un nuevo movimiento
                      )
                    )
                )
              (if (equal? key 'left);;Izquierda
                  (begin
                    (if (and (comprobador (- x1 1) y1) (comprobador (- x1 1) (+ y1 5)) (comprobador (- x1 1) (+ y1 11)) (comprobador (- x1 1) (+ y1 10)) (comprobador (- x1 1) (+ y1 17)))
                        (begin
                          (objetos (- x1 1) y1 ventana ventana2)
                          (objetos (- x1 1) (+ y1 5) ventana ventana2)
                          (objetos (- x1 1) (+ y1 11) ventana ventana2)
                          (objetos (- x1 1) (+ y1 10) ventana ventana2)
                          (objetos (- x1 1) (+ y1 17) ventana ventana2)
                          ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18)
                          ((draw-pixmap ventana) "Estudiante.png" (make-posn (- x1 1) y1) "blue")
                          (movimiento (- x1 1) y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4)
                          )
                        (begin
                          (salida (- x1 1) y1)
                          (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4);; en caso de que el movimiento no quede dentro del espacio definido se espera un nuevo movimiento
                          )
                        )
                    )
                  (begin
                    (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4)
                    )  
                  )
              )
          )
      )
  )
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
      )
  )

(define (nivel1);; primer nivel
  (define win1 (open-viewport "Nivel 1" 300 333));;creación de la ventana
  ((draw-pixmap win1) "Laberinto.png" (make-posn 0 0) "blue");;dibujo del laberinto
  ((draw-pixmap win1) "Taller.png" (make-posn 70 133) "blue");;dibujo del item Taller
  ((draw-pixmap win1) "Taller.png" (make-posn 187 125) "blue")
  ((draw-pixmap win1) "Estudiante.png" (make-posn 249 32) "blue");;dibujo del Avatar
  ((draw-pixmap win1) "0.png" (make-posn 203 294) "blue")
  ((draw-pixmap win1) "0.png" (make-posn 221 294) "blue")
  ((draw-pixmap win1) "0.png" (make-posn 239 294) "blue")
  (movimiento  188 247 win1 0(key-value (get-key-press win1)) 0 0 0 0 0);;llamado a la función movimiento {movimiento x y ventana (lector de teclado)}
  )
(define (Salida2 puntos1)
  (define salida (open-viewport "Salida - Nivel 1" 600 503))
  ((draw-pixmap salida) "Salida2.png" (make-posn 0 0) "blue")
  (puntaje puntos1 100 375 306 0 salida)
  (get-mouse-click salida)
  (define x (posn-x (query-mouse-posn salida)))
  (define y (posn-y (query-mouse-posn salida)))
  (if (and (>= x 0) (<= x 600) (>= y 0) (<= y 503))
      (begin
        (close-viewport salida)
        (menu)
        )
      )
  )
(define (movimientonivel2 x y n m x1 y1 ventana ventana2 key puntos item1 item2 item3 item4)
(define (movimiento x1 y1 ventana ventana2 key puntos item1 item2 item3 item4);; puntos = puntos sumados en el nivel items = items recogidos
  
  
  (define (salida x y)
    (if (and (> x 182) (> y 268) (< x 208) (< y 272))
        (begin
          (close-viewport ventana)
          (Salida2 puntos)
          )
        )
    )
  (define (objetos a b ventana vetana2)
    (if (and (> a 160) (> b 253) (< a 175) (< b 268))
        (begin
          ((clear-solid-rectangle ventana)(make-posn 160 253) 15 14)
          (if (= item1 0)
              (begin
                (play-sound "item2.mp3" #t)
                (puntaje (+ 35 puntos) 100 203 294 0 ventana)
                (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) (+ puntos 35) (+ item1 1) item2 item3 item4)
                )
              )
          )
        (if (and (> a 131) (> b 192) (< a 146) (< b 207))
            (begin
              ((clear-solid-rectangle ventana)(make-posn 131 192) 15 14)
              (if (= item2 0)
                  (begin
                    (play-sound "item2.mp3" #t)
                    (puntaje (+ 35 puntos) 100 203 294 0 ventana)
                    (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) (+ puntos 35) item1 (+ item2 1) item3 item4)
                    )
                  )
              )
            (if (and (> a 130) (> b 99) (< a 145) (< b 114))
                (begin
                  ((clear-solid-rectangle ventana)(make-posn 130 99) 15 14)
                  (if (= item2 0)
                      (begin
                        (play-sound "item2.mp3" #t)
                        (puntaje (+ 35 puntos) 100 203 294 0 ventana)
                        (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) (+ puntos 35) item1 (+ item2 1) item3 item4)
                        )
                      )
                  )
                (if (and (> a 69) (> b 223) (< a 84) (< b 238))
                    (begin
                      ((clear-solid-rectangle ventana)(make-posn 69 223) 15 14)
                      (if (= item2 0)
                          (begin
                            (play-sound "item2.mp3" #t)
                            (puntaje (+ 35 puntos) 100 203 294 0 ventana)
                            (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) (+ puntos 35) item1 (+ item2 1) item3 item4)
                            )
                          )
                      )
                    )
                )
            )
        )
    )

  (if (equal? key 'down);;Abajo
      (begin
        (if (and (comprobador x1 (+ y1 18)) (comprobador (+ x1 5) (+ y1 18)) (comprobador (+ x1 8) (+ y1 18)));;Comprueba que el movimiento a realizar quede dentro del espacio definido
            (begin
              (objetos x1 (+ y1 18) ventana ventana2)
              (objetos (+ x1 5) (+ y1 18) ventana ventana2)
              (objetos (+ x1 8) (+ y1 18) ventana ventana2)
              ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18);;En caso de ser verdadero elimina el espacio que ocupa
              ((draw-pixmap ventana) "Estudiante.png" (make-posn x1 (+ y1 1)) "blue");; y se re-dibuja en la dirección ingresada por teclado
              (movimiento x1 (+ y1 1) ventana  ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4);; espera el siguiente movimiento
              )
            (begin
              (salida (+ x1 8) (+ y1 18))
              (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4);; en caso de que el movimiento no quede dentro del espacio definido se espera un nuevo movimiento
              )
            )
        )
      (if (equal? key 'up);;Arriba
          (begin
            (if (and (comprobador x1 (- y1 1)) (comprobador (+ x1 5) (- y1 1)) (comprobador (+ x1 8) (- y1 1)))
                (begin
                  (objetos x1 (- y1 1) ventana ventana2)
                  (objetos (+ x1 5) (- y1 1) ventana ventana2)
                  (objetos (+ x1 8) (- y1 1) ventana ventana2)
                  ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18)
                  ((draw-pixmap ventana) "Estudiante.png" (make-posn x1 (- y1 1)) "blue")
                  (movimiento x1 (- y1 1) ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4)
                  )
                (begin
                  (salida x1 (- y1 1))
                  (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4);; en caso de que el movimiento no quede dentro del espacio definido se espera un nuevo movimiento
                  )
                )
            )
          (if (equal? key 'right);;Derecha
              (begin
                (if (and (comprobador (+ x1 9) y1) (comprobador (+ x1 9) (+ y1 5)) (comprobador (+ x1 9) (+ y1 10)) (comprobador (+ x1 9) (+ y1 11)) (comprobador (+ x1 9) (+ y1 17)))
                    (begin
                      (objetos (+ x1 9) y1 ventana ventana2)
                      (objetos (+ x1 9) (+ y1 5) ventana ventana2)
                      (objetos (+ x1 9) (+ y1 10) ventana ventana2)
                      (objetos (+ x1 9) (+ y1 11) ventana ventana2)
                      (objetos (+ x1 9) (+ y1 17) ventana ventana2)
                      ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18)
                      ((draw-pixmap ventana) "Estudiante.png" (make-posn (+ x1 1) y1) "blue")
                      (movimiento (+ x1 1) y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4)
                      )
                    (begin
                      (salida (+ x1 9) (+ y1 17))
                      (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4);; en caso de que el movimiento no quede dentro del espacio definido se espera un nuevo movimiento
                      )
                    )
                )
              (if (equal? key 'left);;Izquierda
                  (begin
                    (if (and (comprobador (- x1 1) y1) (comprobador (- x1 1) (+ y1 5)) (comprobador (- x1 1) (+ y1 11)) (comprobador (- x1 1) (+ y1 10)) (comprobador (- x1 1) (+ y1 17)))
                        (begin
                          (objetos (- x1 1) y1 ventana ventana2)
                          (objetos (- x1 1) (+ y1 5) ventana ventana2)
                          (objetos (- x1 1) (+ y1 11) ventana ventana2)
                          (objetos (- x1 1) (+ y1 10) ventana ventana2)
                          (objetos (- x1 1) (+ y1 17) ventana ventana2)
                          ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18)
                          ((draw-pixmap ventana) "Estudiante.png" (make-posn (- x1 1) y1) "blue")
                          (movimiento (- x1 1) y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4)
                          )
                        (begin
                          (salida (- x1 1) y1)
                          (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4);; en caso de que el movimiento no quede dentro del espacio definido se espera un nuevo movimiento
                          )
                        )
                    )
                  (begin
                    (movimiento x1 y1 ventana ventana2 (key-value (get-key-press ventana)) puntos item1 item2 item3 item4)
                    )  
                  )
              )
          )
      )
  )
  (define (movimientopp x y ventana n m)
      (if (< m 50);;Arriba
          (begin
            (if (and (comprobador x (- y 1)) (comprobador (+ x 5) (- y 1)) (comprobador (+ x 8) (- y 1)))
                (begin
                  ((clear-solid-rectangle ventana)(make-posn x y) 12 17)
                  ((draw-pixmap ventana) "Profesor.png" (make-posn x (- y 2)) "blue")
                  (sleep 0.1)(movimientopp x (- y 2) ventana n (+ m 1))
                  )
                (begin
                  (sleep 0.1)(movimientopp x y ventana n (+ m 1));; en caso de que el movimiento no quede dentro del espacio definido se espera un nuevo movimiento
                  )
                )
            ))
          (if (= m 50)
              (movimientonivel2 x y 0 m x1 y1 ventana ventana2 key puntos item1 item2 item3 item4))  
          )
  (if (< n 50);;Abajo
      (begin
        (if (and (comprobador x (+ y 18)) (comprobador (+ x 5) (+ y 18)) (comprobador (+ x 8) (+ y 18)));;Comprueba que el movimiento a realizar quede dentro del espacio definido
            (begin
              ((clear-solid-rectangle ventana)(make-posn x y) 12 17);;En caso de ser verdadero elimina el espacio que ocupa
              ((draw-pixmap ventana) "Profesor.png" (make-posn x (+ y 2)) "blue");; y se re-dibuja en la dirección ingresada por teclado
              (sleep 0.1)(movimientonivel2 x (+ y 2) (+ n 1) m x1 y1 ventana ventana2 key puntos item1 item2 item3 item4);; espera el siguiente movimiento
              )
            (begin
              (sleep 0.1)(movimientonivel2 x y (+ n 1) m x1 y1 ventana ventana2 key puntos item1 item2 item3 item4);; en caso de que el movimiento no quede dentro del espacio definido se espera un nuevo movimiento
              )
            )
        ))
      (if (= n 50)
          (movimientopp x y ventana n 0))
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
      )
  )
(define (nivel2);; primer nivel
  (define win1 (open-viewport "Nivel 2" 300 333));;creación de la ventana
  ((draw-pixmap win1) "Laberinto.png" (make-posn 0 0) "blue");;dibujo del laberinto
  ((draw-pixmap win1) "Taller.png" (make-posn 160 253) "blue");;dibujo del item Taller
  ((draw-pixmap win1) "Taller.png" (make-posn 131 192) "blue")
  ((draw-pixmap win1) "Taller.png" (make-posn 130 99) "blue")
  ((draw-pixmap win1) "Taller.png" (make-posn 69 223) "blue")
  ((draw-pixmap win1) "Profesor.png" (make-posn 36 127) "blue")
  ((draw-pixmap win1) "Estudiante.png" (make-posn 249 32) "blue");;dibujo del Avatar
  ((draw-pixmap win1) "0.png" (make-posn 203 294) "blue")
  ((draw-pixmap win1) "0.png" (make-posn 221 294) "blue")
  ((draw-pixmap win1) "0.png" (make-posn 239 294) "blue")
  (movimientonivel2 36 127 0 50 249 32 win1 0 (key-value (get-key-press win1)) 0 0 0 0 0)
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
        )
      )
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
        )
      )
  (if (and (>= x 0) (<= x 955) (>= y 0) (<= y 900))
      (begin
        (close-viewport cred)
        (creditos)
        )
      )
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
        )
      )
  (if (and (>= x 330) (<= x 530) (>= y 220) (<= y 290))
      (begin
        (close-viewport winmenu)
        (intronivel2)
        )
      )
  (if (and (>= x 210) (<= x 410) (>= y 350) (<= y 390))
      (begin
        (close-viewport winmenu)
        (instrucciones)
        )
      )
  (if (and (>= x 245) (<= x 375) (>= y 420) (<= y 460))
      (begin
        (close-viewport winmenu)
        (creditos)
        )
      )
  (if (and (>= x 0) (<= x 955) (>= y 0) (<= y 900))
      (begin
        (close-viewport winmenu)
        (menu)
        )
      )
  )

(intro)