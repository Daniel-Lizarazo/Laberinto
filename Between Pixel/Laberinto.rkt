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
;;Puntaje
;;------------------------------------------
(define (puntaje p d x ventana);;Esta función cumple con el objetivo de mostrar en pantalla el puntaje actual del jugador, para eso divide cada digito del puntaje actual y dibuja una imagen con el número correspondiente
  (if (<= x 239)
      (cond ((= (modulo (quotient p d) 10) 0) (begin
                                                ((draw-pixmap ventana) "0.png" (make-posn x 294) "blue");; p = puntaje d = variable para separar digitos x = posición en X para dibujar la imagen
                                                (puntaje p (/ d 10) (+ x 18) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 1) (begin
                                                ((draw-pixmap ventana) "1.png" (make-posn x 294) "blue")
                                                (puntaje p (/ d 10) (+ x 18) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 2) (begin
                                                ((draw-pixmap ventana) "2.png" (make-posn x 294) "blue")
                                                (puntaje p (/ d 10) (+ x 18) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 3) (begin
                                                ((draw-pixmap ventana) "3.png" (make-posn x 294) "blue")
                                                (puntaje p (/ d 10) (+ x 18) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 4) (begin
                                                ((draw-pixmap ventana) "4.png" (make-posn x 294) "blue")
                                                (puntaje p (/ d 10) (+ x 18) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 5) (begin
                                                ((draw-pixmap ventana) "5.png" (make-posn x 294) "blue")
                                                (puntaje p (/ d 10) (+ x 18) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 6) (begin
                                                ((draw-pixmap ventana) "6.png" (make-posn x 294) "blue")
                                                (puntaje p (/ d 10) (+ x 18) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 7) (begin
                                                ((draw-pixmap ventana) "7.png" (make-posn x 294) "blue")
                                                (puntaje p (/ d 10) (+ x 18) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 8) (begin
                                                ((draw-pixmap ventana) "8.png" (make-posn x 294) "blue")
                                                (puntaje p (/ d 10) (+ x 18) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 9) (begin
                                                ((draw-pixmap ventana) "9.png" (make-posn x 294) "blue")
                                                (puntaje p (/ d 10) (+ x 18) ventana)
                                                )
                                              )
            ((= (modulo (quotient p d) 10) 9) (begin
                                                ((draw-pixmap ventana) "9.png" (make-posn x 294) "blue")
                                                (puntaje p (/ d 10) (+ x 18) ventana)
                                                )
                                              )
            )
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
          (and (> a 91) (> b 183) (< a 123) (< b 208))}
      #t;;se puede mover el personaje
      #f
      )
  )


(define (movimiento x1 y1 ventana key puntos items);; puntos = puntos sumados en el nivel items = items recogidos
  
  (define (talleres a b ventana)
    (if (and (> a 70) (> b 133) (< a 85) (< b 148))
        (begin
          ((clear-solid-rectangle ventana)(make-posn 70 133) 15 14)
          (if (= items 0)
              (begin
                (puntaje (+ 35 puntos) 100 203 ventana)
                (movimiento x1 y1 ventana (key-value (get-key-press ventana)) (+ puntos 35) (+ items 1))
                )
              )
          )
        (if (and (> a 68) (> b 222) (< a 73) (< b 240))
            (begin
              ((clear-solid-rectangle ventana)(make-posn 68 222) 15 14)
              (if (= items 1)
                  (begin
                    (puntaje (+ 35 puntos) 100 203 ventana)
                    (movimiento x1 y1 ventana (key-value (get-key-press ventana)) (+ puntos 35) (+ items 1))
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
              (talleres x1 (+ y1 18) ventana)
              (talleres (+ x1 5) (+ y1 18) ventana)
              (talleres (+ x1 8) (+ y1 18) ventana)
              ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18);;En caso de ser verdadero elimina el espacio que ocupa
              ((draw-pixmap ventana) "Estudiante.png" (make-posn x1 (+ y1 1)) "blue");; y se re-dibuja en la dirección ingresada por teclado
              (movimiento x1 (+ y1 1) ventana (key-value (get-key-press ventana)) puntos items);; espera el siguiente movimiento
              )
            (movimiento x1 y1 ventana (key-value (get-key-press ventana)) puntos items);; en caso de que el movimiento no quede dentro del espacio definido se espera un nuevo movimiento
            )
        )
      (if (equal? key 'up);;Arriba
          (begin
            (if (and (comprobador x1 (- y1 1)) (comprobador (+ x1 5) (- y1 1)) (comprobador (+ x1 8) (- y1 1)))
                (begin
                  (talleres x1 (- y1 1) ventana)
                  (talleres (+ x1 5) (- y1 1) ventana)
                  (talleres (+ x1 8) (- y1 1) ventana)
                  ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18)
                  ((draw-pixmap ventana) "Estudiante.png" (make-posn x1 (- y1 1)) "blue")
                  (movimiento x1 (- y1 1) ventana (key-value (get-key-press ventana)) puntos items)
                  )
                (movimiento x1 y1 ventana (key-value (get-key-press ventana)) puntos items)
                )
            )
          (if (equal? key 'right);;Derecha
              (begin
                (if (and (comprobador (+ x1 9) y1) (comprobador (+ x1 9) (+ y1 5)) (comprobador (+ x1 9) (+ y1 10)) (comprobador (+ x1 9) (+ y1 11)) (comprobador (+ x1 9) (+ y1 17)))
                    (begin
                      (talleres (+ x1 9) y1 ventana)
                      (talleres (+ x1 9) (+ y1 5) ventana)
                      (talleres (+ x1 9) (+ y1 10) ventana)
                      (talleres (+ x1 9) (+ y1 11) ventana)
                      (talleres (+ x1 9) (+ y1 17) ventana)
                      ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18)
                      ((draw-pixmap ventana) "Estudiante.png" (make-posn (+ x1 1) y1) "blue")
                      (movimiento (+ x1 1) y1 ventana (key-value (get-key-press ventana)) puntos items)
                      )
                    (movimiento x1 y1 ventana (key-value (get-key-press ventana)) puntos items)
                    )
                )
              
              (if (equal? key 'left);;Izquierda
                  (begin
                    (if (and (comprobador (- x1 1) y1) (comprobador (- x1 1) (+ y1 5)) (comprobador (- x1 1) (+ y1 11)) (comprobador (- x1 1) (+ y1 10)) (comprobador (- x1 1) (+ y1 17)))
                        (begin
                          (talleres (- x1 1) y1 ventana)
                          (talleres (- x1 1) (+ y1 5) ventana)
                          (talleres (- x1 1) (+ y1 11) ventana)
                          (talleres (- x1 1) (+ y1 10) ventana)
                          (talleres (- x1 1) (+ y1 17) ventana)
                          ((clear-solid-rectangle ventana)(make-posn x1 y1) 9 18)
                          ((draw-pixmap ventana) "Estudiante.png" (make-posn (- x1 1) y1) "blue")
                          (movimiento (- x1 1) y1 ventana (key-value (get-key-press ventana)) puntos items)
                          )
                        (movimiento x1 y1 ventana (key-value (get-key-press ventana)) puntos items)
                        )
                    )
                  (begin
                    (movimiento x1 y1 ventana (key-value (get-key-press ventana)) puntos items)
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
  (define win1 (open-viewport "Nivel1" 300 333));;creación de la ventana
  ((draw-pixmap win1) "Laberinto.png" (make-posn 0 0) "blue");;dibujo del laberinto
  ((draw-pixmap win1) "Taller.png" (make-posn 70 133) "blue");;dibujo del item Taller
  ((draw-pixmap win1) "Taller.png" (make-posn 187 125) "blue")
  ((draw-pixmap win1) "Estudiante.png" (make-posn 249 32) "blue");;dibujo del Avatar
  ((draw-pixmap win1) "0.png" (make-posn 203 294) "blue")
  ((draw-pixmap win1) "0.png" (make-posn 221 294) "blue")
  ((draw-pixmap win1) "0.png" (make-posn 239 294) "blue")
  (movimiento 249 32 win1 (key-value (get-key-press win1)) 0 0);;llamado a la función movimiento {movimiento x y ventana (lector de teclado)}
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
  

  

  












