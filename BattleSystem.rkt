#lang racket
(require 2htdp/image)

;; #################################
;; ##          ESTRUTURAS         ##
;; #################################

(define-struct player (name key image))
;(define-struct node (key isFilled left right))
(define-struct championship (competitors image num-players))

;; #################################
;; ##          CONSTANTES         ##
;; #################################

(define PIC_SIZE 100)

(define BAE-PIC (bitmap "images/baelz.jpg"))

(define BAE (make-player "Hakos Baelz" 24 (scale (/ PIC_SIZE (image-width BAE-PIC)) BAE-PIC)))
(define BAELZ BAE) (define HAKOS BAE) (define RAT BAE)

(define PLAYER2 (make-player "Player 2" 0 (rectangle PIC_SIZE PIC_SIZE "solid" "blue")))

(define LINE_SIZE 200)
(define DEFAULT_SIZE 2)

;; #################################
;; ##           FUNÇÕES           ##
;; #################################

;; make-duel: Número -> Imagem
;; Obj.: dado um tamanho, devolve um duelo desse tamanho
(define (make-duel size pic)
  (overlay/align
   "left" "center"
   (scale size pic)
   (beside
    (line 0 (* size LINE_SIZE) "black")
    (line (* size LINE_SIZE) 0 "black"))))

;; aux-championship: Numero Numero -> Imagem
;; Obj.: dado um número de batalhas e o tamanho da imagem, devolve uma estrutura de batalhas
(define (aux-championship num-battles size key player-list)
  (cond
    [(< num-battles 1) empty-image]
    [else (beside
           (above
            (aux-championship (/ num-battles 2) (/ size 2) (- key (/ num-battles 2)) player-list)
            (rectangle 0 (* (/ size num-battles) LINE_SIZE) "solid" "white")
            (aux-championship (/ num-battles 2) (/ size 2) (+ key (/ num-battles 2)) player-list))
           (make-duel size (get-pic key player-list)))]))

(define (get-pic key list)
  (let ((filtered (filter (lambda (x) (= key (player-key x))) list)))
    (cond
      [(empty? filtered) empty-image]
      [else (player-image (first filtered))])))

;; make-championship-image: Numer Numero -> Imagem
;; Obj.: dado um número de batalhas e o tamanho da imagem, devolve uma estrutura de batalhas de dois lados
(define (make-championship-image num-battles size player-list)
  (beside
   (aux-championship (/ num-battles 2) (/ size 2) (/ num-battles 2) player-list)
   (flip-horizontal
    (aux-championship (/ num-battles 2) (/ size 2) (+ num-battles (/ num-battles 2)) player-list))))

;; #################################
;; ##           PROGRAMA          ##
;; #################################

(define main-champ (make-championship empty empty-image 0))

;; #################################
;; ##          FUNÇÕES DE         ##
;; ##           EXECUÇÃO          ##
;; #################################

(define (draw) (championship-image main-champ))
(define (get-players) (championship-competitors main-champ))
(define (players) (map player-name (get-players)))

(define (start num-players)
  (set! main-champ
        (make-championship
         empty
         (make-championship-image num-players DEFAULT_SIZE empty)
         num-players))
  (draw))


(define (update-player-list player)
  (set! main-champ
        (make-championship
         (cons
          (make-player (player-name player) (+ (* 2 (length (get-players))) 1) (player-image player))
          (championship-competitors main-champ))
         (draw)
         (championship-num-players main-champ))))

(define (update-image)
  (set! main-champ
        (make-championship
         (get-players)
         (make-championship-image
          (championship-num-players main-champ)
          DEFAULT_SIZE
          (championship-competitors main-champ))
         (championship-num-players main-champ)))
  (draw))

(define (add player)
  (update-player-list player)
  (update-image))

(define (update-player name key list)
  (let ((current (first list)))
  (cond
    [(string=? (player-name current) name)
     (cons (make-player name key (player-image current)) (rest list))]
    [else (update-player name key (cons current (rest list)))])))

(define (get-key-from name list)
  (let ((current (first list)))
  (cond
    [(string=? (player-name current) name)
     (player-key current)]
    [else (get-key-from name (cons current (rest list)))])))

(define (calc-next-key num count)
  (cond
    [(= num 0) (expt 2 count)]
    [(even? num) (calc-next-key (/ num 2) (+ count 1))]
    [else (* (expt -1 (floor (/ num 2))) (expt 2 count))]))

(define (next-key num)
  (+ num (calc-next-key num 0)))

(define (win player)
  (set! main-champ
        (make-championship
         (update-player (player-name player)
                        (next-key (get-key-from (player-name player) (get-players)))
                        (get-players))
         (draw)
         (championship-num-players main-champ)))
  (update-image)
  (draw))