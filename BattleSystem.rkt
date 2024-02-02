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

(define PIC_SIZE 175)

; Gen0
(define AZKI-PIC (bitmap "images/hololive/gen0/azki.jpg"))
(define AZKI (make-player "AZKi" 24 (scale (/ PIC_SIZE (image-width AZKI-PIC)) AZKI-PIC)))

(define SORA-PIC (bitmap "images/hololive/gen0/sora.jpg"))
(define SORA (make-player "Tokino Sora" 24 (scale (/ PIC_SIZE (image-width SORA-PIC)) SORA-PIC)))
(define TOKINO SORA) (define SEISO SORA)

(define MIKO-PIC (bitmap "images/hololive/gen0/miko.jpg"))
(define MIKO (make-player "Sakura Miko" 24 (scale (/ PIC_SIZE (image-width MIKO-PIC)) MIKO-PIC)))
(define SAKURA MIKO) (define MIKOCHI MIKO) (define BABY MIKO)

(define ROBOCO-PIC (bitmap "images/hololive/gen0/roboco.jpg"))
(define ROBOCO (make-player "Robocosan" 24 (scale (/ PIC_SIZE (image-width ROBOCO-PIC)) ROBOCO-PIC)))
(define ROBO ROBOCO) (define ROBOCOSAN ROBOCO)

(define SUISEI-PIC (bitmap "images/hololive/gen0/suisei.jpg"))
(define SUISEI (make-player "Hoshimachi Suisei" 24 (scale (/ PIC_SIZE (image-width SUISEI-PIC)) SUISEI-PIC)))
(define HOSHIMACHI SUISEI) (define PSYCHO SUISEI)

; Gen1
(define MEL-PIC (bitmap "images/hololive/gen1/mel.jpg"))
(define MEL (make-player "Yozora Mel" 24 (scale (/ PIC_SIZE (image-width MEL-PIC)) MEL-PIC)))
(define YOZORA MEL)

(define AKI-PIC (bitmap "images/hololive/gen1/aki.jpg"))
(define AKI (make-player "Aki Rosenthal" 24 (scale (/ PIC_SIZE (image-width AKI-PIC)) AKI-PIC)))
(define ROSENTHAL AKI)

(define HAACHAMA-PIC (bitmap "images/hololive/gen1/haachama.jpg"))
(define HAACHAMA (make-player "Akai Haato" 24 (scale (/ PIC_SIZE (image-width HAACHAMA-PIC)) HAACHAMA-PIC)))
(define AKAI HAACHAMA) (define HAATO HAACHAMA)

(define MATSURI-PIC (bitmap "images/hololive/gen1/matsuri.jpg"))
(define MATSURI (make-player "Natsuiro Matsuri" 24 (scale (/ PIC_SIZE (image-width MATSURI-PIC)) MATSURI-PIC)))
(define NATSUIRO MATSURI) (define LOLICON MATSURI)

(define FUBUKI-PIC (bitmap "images/hololive/gen1/matsuri.jpg"))
(define FUBUKI (make-player "Shirakami Fubuki" 24 (scale (/ PIC_SIZE (image-width FUBUKI-PIC)) FUBUKI-PIC)))
(define SHIRAKAMI FUBUKI) (define WOLF FUBUKI) (define FRIEND FUBUKI) (define FOX FUBUKI)

; Gen2
(define AQUA-PIC (bitmap "images/hololive/gen2/aqua.jpg"))
(define AQUA (make-player "Minato Aqua" 24 (scale (/ PIC_SIZE (image-width AQUA-PIC)) AQUA-PIC)))
(define MINATO AQUA) (define AQUTAN AQUA) (define ONION AQUA)

(define SHION-PIC (bitmap "images/hololive/gen2/shion.jpg"))
(define SHION (make-player "Murasaki Shion" 24 (scale (/ PIC_SIZE (image-width SHION-PIC)) SHION-PIC)))
(define MURASAKI SHION) (define WITCH SHION)

(define AYAME-PIC (bitmap "images/hololive/gen2/ayame.jpg"))
(define AYAME (make-player "Nakiri Ayame" 24 (scale (/ PIC_SIZE (image-width AYAME-PIC)) AYAME-PIC)))
(define NAKIRI AYAME) (define ONI AYAME)

(define CHOCO-PIC (bitmap "images/hololive/gen2/choco.jpg"))
(define CHOCO (make-player "Yuzuki Choco" 24 (scale (/ PIC_SIZE (image-width CHOCO-PIC)) CHOCO-PIC)))
(define YUZUKI CHOCO)

(define SUBARU-PIC (bitmap "images/hololive/gen2/subaru.jpg"))
(define SUBARU (make-player "Oozora Subaru" 24 (scale (/ PIC_SIZE (image-width SUBARU-PIC)) SUBARU-PIC)))
(define OOZORA SUBARU) (define POLICE SUBARU) (define DUCK SUBARU)

; Gamers
(define KORONE-PIC (bitmap "images/hololive/gamers/korone.jpg"))
(define KORONE (make-player "Inugami Korone" 24 (scale (/ PIC_SIZE (image-width KORONE-PIC)) KORONE-PIC)))
(define INUGAMI KORONE) (define DOG KORONE) (define KOONE KORONE)

(define MIO-PIC (bitmap "images/hololive/gamers/mio.jpg"))
(define MIO (make-player "Ookami Mio" 24 (scale (/ PIC_SIZE (image-width MIO-PIC)) MIO-PIC)))
(define OOKAMI MIO)

(define OKAYU-PIC (bitmap "images/hololive/gamers/okayu.jpg"))
(define OKAYU (make-player "Nekomata Okayu" 24 (scale (/ PIC_SIZE (image-width OKAYU-PIC)) OKAYU-PIC)))
(define NEKOMATA OKAYU) (define CAT OKAYU)

; Gen 3
(define FLARE-PIC (bitmap "images/hololive/gen3/flare.png"))
(define FLARE (make-player "Shiranui Flare" 24 (scale (/ PIC_SIZE (image-width FLARE-PIC)) FLARE-PIC)))
(define SHIRANUI FLARE)

(define MARINE-PIC (bitmap "images/hololive/gen3/marine.jpg"))
(define MARINE (make-player "Houshou Marine" 24 (scale (/ PIC_SIZE (image-width MARINE-PIC)) MARINE-PIC)))
(define HOUSHOU MARINE) (define CAPTAIN MARINE) (define MARIN MARINE) (define GRANDMA MARINE) (define HAG MARINE)

(define NOEL-PIC (bitmap "images/hololive/gen3/noel.jpg"))
(define NOEL (make-player "Shirogane Noel" 24 (scale (/ PIC_SIZE (image-width NOEL-PIC)) NOEL-PIC)))
(define SHIROGANE NOEL) (define COW NOEL)

(define PEKORA-PIC (bitmap "images/hololive/gen3/pekora.jpg"))
(define PEKORA (make-player "Usada Pekora" 24 (scale (/ PIC_SIZE (image-width PEKORA-PIC)) PEKORA-PIC)))
(define USADA PEKORA) (define RABBIT PEKORA) (define PEKO-CHAN PEKORA)

; Gen 4
(define COCO-PIC (bitmap "images/hololive/gen4/coco.jpg"))
(define COCO (make-player "Kiryu Coco" 24 (scale (/ PIC_SIZE (image-width COCO-PIC)) COCO-PIC)))
(define KIRYU COCO) (define DRAGON COCO)

(define KANATA-PIC (bitmap "images/hololive/gen4/kanata.jpg"))
(define KANATA (make-player "Amane Kanata" 24 (scale (/ PIC_SIZE (image-width KANATA-PIC)) KANATA-PIC)))
(define GORILLA KANATA) (define AMANE KANATA) (define GORILA KANATA) (define TENSHI KANATA)

(define LUNA-PIC (bitmap "images/hololive/gen4/luna.jpg"))
(define LUNA (make-player "Himemori Luna" 24 (scale (/ PIC_SIZE (image-width LUNA-PIC)) LUNA-PIC)))
(define HIMEMORI LUNA) (define PRINCESS LUNA) (define LOLI LUNA) (define NANORA LUNA)

(define WATAME-PIC (bitmap "images/hololive/gen4/watame.jpg"))
(define WATAME (make-player "Tsunomaki Watame" 24 (scale (/ PIC_SIZE (image-width WATAME-PIC)) WATAME-PIC)))
(define TSUNOMAKI WATAME) (define SHEEP WATAME) (define LAMB WATAME)

(define TOWA-PIC (bitmap "images/hololive/gen4/towa.jpg"))
(define TOWA (make-player "Tokoyami Towa" 24 (scale (/ PIC_SIZE (image-width TOWA-PIC)) TOWA-PIC)))
(define TOKOYAMI TOWA) (define DEMON TOWA)

; Gen 5
(define LAMY-PIC (bitmap "images/hololive/gen5/lamy.jpg"))
(define LAMY (make-player "Yukihana Lamy" 24 (scale (/ PIC_SIZE (image-width LAMY-PIC)) LAMY-PIC)))
(define YUKIHANA LAMY) (define ALCÓOLATRA LAMY)

(define BOTAN-PIC (bitmap "images/hololive/gen5/botan.jpg"))
(define BOTAN (make-player "Shishiro Botan" 24 (scale (/ PIC_SIZE (image-width BOTAN-PIC)) BOTAN-PIC)))
(define SHISHIRO BOTAN) (define LION BOTAN)

(define NENE-PIC (bitmap "images/hololive/gen5/nene.jpg"))
(define NENE (make-player "Momosuzu Nene" 24 (scale (/ PIC_SIZE (image-width NENE-PIC)) NENE-PIC)))
(define MOMOSSUZU NENE) (define NENENENE NENE) (define SEAL NENE) (define FOCA NENE)

(define POLKA-PIC (bitmap "images/hololive/gen5/polka.jpg"))
(define POLKA (make-player "Omaru Polka" 24 (scale (/ PIC_SIZE (image-width POLKA-PIC)) POLKA-PIC)))
(define OMARU POLKA) (define PORUKA POLKA)

; HoloX
(define CHLOE-PIC (bitmap "images/hololive/holoX/chloe.jpg"))
(define CHLOE (make-player "Sakamata Chloe" 24 (scale (/ PIC_SIZE (image-width CHLOE-PIC)) CHLOE-PIC)))
(define SAKAMATA CHLOE)

(define IROHA-PIC (bitmap "images/hololive/holoX/iroha.jpg"))
(define IROHA (make-player "Kazama Iroha" 24 (scale (/ PIC_SIZE (image-width IROHA-PIC)) IROHA-PIC)))
(define KAZAMA IROHA)

(define KOYORI-PIC (bitmap "images/hololive/holoX/koyori.jpg"))
(define KOYORI (make-player "Hakui Koyori" 24 (scale (/ PIC_SIZE (image-width KOYORI-PIC)) KOYORI-PIC)))
(define HAKUI KOYORI) (define COIOTE KOYORI)

(define LAPLUS-PIC (bitmap "images/hololive/holoX/laplus.jpg"))
(define LAPLUS (make-player "La+ Darknesss" 24 (scale (/ PIC_SIZE (image-width LAPLUS-PIC)) LAPLUS-PIC)))
(define LA+ LAPLUS) (define BRAT LAPLUS)

(define LUI-PIC (bitmap "images/hololive/holoX/lui.jpg"))
(define LUI (make-player "Takane Lui" 24 (scale (/ PIC_SIZE (image-width LUI-PIC)) LUI-PIC)))
(define TAKANE LUI)

; In1
(define IOFI-PIC (bitmap "images/hololive/ind1/iofi.jpg"))
(define IOFI (make-player "Airani Iofifteen" 24 (scale (/ PIC_SIZE (image-width IOFI-PIC)) IOFI-PIC)))
(define AIRANI IOFI) (define IOFIFTEEN IOFI)

(define MOONA-PIC (bitmap "images/hololive/ind1/moona.jpg"))
(define MOONA (make-player "Moona Hoshinova" 24 (scale (/ PIC_SIZE (image-width MOONA-PIC)) MOONA-PIC)))
(define HOSHINOVA MOONA)

(define RISU-PIC (bitmap "images/hololive/ind1/risu.jpg"))
(define RISU (make-player "Ayunda Risu" 24 (scale (/ PIC_SIZE (image-width RISU-PIC)) RISU-PIC)))
(define SQUIRREL RISU) (define NUTS RISU) (define ESQUILO RISU) (define AYUNDA RISU)

; In2
(define ANYA-PIC (bitmap "images/hololive/ind2/anya.jpg"))
(define ANYA (make-player "Anya Melfissa" 24 (scale (/ PIC_SIZE (image-width ANYA-PIC)) ANYA-PIC)))
(define MELFISSA ANYA)

(define REINE-PIC (bitmap "images/hololive/ind2/reine.jpg"))
(define REINE (make-player "Pavolia Reine" 24 (scale (/ PIC_SIZE (image-width REINE-PIC)) REINE-PIC)))
(define PAVOLIA REINE) (define PAVÃO REINE)



; In3
(define KAELA-PIC (bitmap "images/hololive/ind3/kaela.jpg"))
(define KAELA (make-player "Kaela Kovalskia" 24 (scale (/ PIC_SIZE (image-width KAELA-PIC)) KAELA-PIC)))
(define KOVALSKIA KAELA) (define MINECRAFT KAELA)

(define KOBO-PIC (bitmap "images/hololive/ind3/kobo.jpg"))
(define KOBO (make-player "Kobo Kanaeru" 24 (scale (/ PIC_SIZE (image-width KOBO-PIC)) KOBO-PIC)))
(define KANAERU KOBO)

(define VESTIA-PIC (bitmap "images/hololive/ind3/vestia.jpg"))
(define VESTIA (make-player "Vestia Zeta" 24 (scale (/ PIC_SIZE (image-width VESTIA-PIC)) VESTIA-PIC)))
(define ZETA VESTIA)

; Myth
(define AME-PIC (bitmap "images/hololive/myth/ame.jpg"))
(define AME (make-player "Amelia Watson" 24 (scale (/ PIC_SIZE (image-width AME-PIC)) AME-PIC)))
(define AMELIA AME) (define WATSON AME) (define DETECTIVE AME) (define POUNDER AME)

(define CALLI-PIC (bitmap "images/hololive/myth/calli.jpg"))
(define CALLI (make-player "Mori Calliope" 24 (scale (/ PIC_SIZE (image-width CALLI-PIC)) CALLI-PIC)))
(define MORI CALLI) (define CALLIOPE CALLI) (define REAPER CALLI)

(define GURA-PIC (bitmap "images/hololive/myth/gura.jpg"))
(define GURA (make-player "Gawr Gura" 24 (scale (/ PIC_SIZE (image-width GURA-PIC)) GURA-PIC)))
(define GAWR GURA) (define SHARK GURA) (define SAME-CHAN GURA) (define SAME GURA)

(define INA-PIC (bitmap "images/hololive/myth/ina.jpg"))
(define INA (make-player "Ninomae Ina'nis" 24 (scale (/ PIC_SIZE (image-width INA-PIC)) INA-PIC)))
(define NINOMAE INA) (define INANIS INA) (define SQUID INA)

(define KIARA-PIC (bitmap "images/hololive/myth/kiara.jpg"))
(define KIARA (make-player "Takanashi Kiara" 24 (scale (/ PIC_SIZE (image-width KIARA-PIC)) KIARA-PIC)))
(define TAKANASHI KIARA) (define CHICKEN KIARA) (define KFC KIARA) (define PHOENIX KIARA)


; Council / Promise
(define BAE-PIC (bitmap "images/hololive/promise/baelz.jpg"))
(define BAE (make-player "Hakos Baelz" 24 (scale (/ PIC_SIZE (image-width BAE-PIC)) BAE-PIC)))
(define BAELZ BAE) (define HAKOS BAE) (define RAT BAE)

(define FAUNA-PIC (bitmap "images/hololive/promise/fauna.jpg"))
(define FAUNA (make-player "Ceres Fauna" 24 (scale (/ PIC_SIZE (image-width FAUNA-PIC)) FAUNA-PIC)))
(define CERES FAUNA) (define TREE FAUNA) (define SAPLING FAUNA)

(define KRONII-PIC (bitmap "images/hololive/promise/kronii.jpg"))
(define KRONII (make-player "Ouro Kronii" 24 (scale (/ PIC_SIZE (image-width KRONII-PIC)) KRONII-PIC)))
(define OURO KRONII) (define TIME KRONII)

(define MUMEI-PIC (bitmap "images/hololive/promise/mumei.jpg"))
(define MUMEI (make-player "Nanashi Mumei" 24 (scale (/ PIC_SIZE (image-width MUMEI-PIC)) MUMEI-PIC)))
(define NANASHI MUMEI) (define OWL MUMEI) (define CIVILIZATION MUMEI)

(define SANA-PIC (bitmap "images/hololive/promise/sana.png"))
(define SANA (make-player "Tsukomo Sana" 24 (scale (/ PIC_SIZE (image-width SANA-PIC)) SANA-PIC)))
(define TSUKOMO SANA) (define SPACE SANA)

(define IRYS-PIC (bitmap "images/hololive/promise/irys.jpg"))
(define IRYS (make-player "IRyS" 24 (scale (/ PIC_SIZE (image-width IRYS-PIC)) IRYS-PIC)))
(define SANTA IRYS)

; Advent
(define BIBOO-PIC (bitmap "images/hololive/advent/biboo.jpg"))
(define BIBOO (make-player "Koseki Bijou" 24 (scale (/ PIC_SIZE (image-width BIBOO-PIC)) BIBOO-PIC)))
(define KOSEKI BIBOO) (define BIJOU BIBOO) (define ROCK BIBOO) (define STONE BIBOO)

(define FUWAMOCO-PIC (bitmap "images/hololive/advent/fuwamoco.jpg"))
(define FUWAMOCO (make-player "Fuwawa and Mococo Abyssgard" 24 (scale (/ PIC_SIZE (image-width FUWAMOCO-PIC)) FUWAMOCO-PIC)))
(define FUWAWA FUWAMOCO) (define MOCOCO FUWAMOCO) (define ABYSSGARD FUWAMOCO) (define GUARDS FUWAMOCO) (define SISTERS FUWAMOCO) (define TWINS FUWAMOCO)

(define NERISSA-PIC (bitmap "images/hololive/advent/nerissa.jpg"))
(define NERISSA (make-player "Nerissa Ravencroft" 24 (scale (/ PIC_SIZE (image-width NERISSA-PIC)) NERISSA-PIC)))
(define RAVENCROFT NERISSA) (define RAVEN NERISSA) (define NERIZZLER NERISSA)

(define SHIORI-PIC (bitmap "images/hololive/advent/shiori.jpg"))
(define SHIORI (make-player "Shiori Novella" 24 (scale (/ PIC_SIZE (image-width SHIORI-PIC)) SHIORI-PIC)))
(define NOVELLA SHIORI)

; Regloss
(define AO-PIC (bitmap "images/hololive/regloss/ao.png"))
(define AO (make-player "Hiodoshi Ao" 24 (scale (/ PIC_SIZE (image-width AO-PIC)) AO-PIC)))
(define HIODOSHI AO)

(define KANADE-PIC (bitmap "images/hololive/regloss/kanade.png"))
(define KANADE (make-player "Otonose Kanade" 24 (scale (/ PIC_SIZE (image-width KANADE-PIC)) KANADE-PIC)))
(define OTONOSE KANADE)

(define RADEN-PIC (bitmap "images/hololive/regloss/raden.png"))
(define RADEN (make-player "Juufuutei Raden" 24 (scale (/ PIC_SIZE (image-width RADEN-PIC)) RADEN-PIC)))
(define JUUFUUTEI RADEN)

(define RIRIKA-PIC (bitmap "images/hololive/regloss/ririka.png"))
(define RIRIKA (make-player "Ichijou Ririka" 24 (scale (/ PIC_SIZE (image-width RIRIKA-PIC)) RIRIKA-PIC)))
(define ICHIJOU RIRIKA)

(define TODOROKI-PIC (bitmap "images/hololive/regloss/todoroki.png"))
(define TODOROKI (make-player "Todoroki Hajime" 24 (scale (/ PIC_SIZE (image-width TODOROKI-PIC)) TODOROKI-PIC)))
(define HAJIME TODOROKI)

(define LINE_SIZE 200)
(define DEFAULT_SIZE 2)
(define RATIO 0.5)

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
            (aux-championship (/ num-battles 2) (* size RATIO) (- key (/ num-battles 2)) player-list)
            (rectangle 0 (* (/ 1 num-battles) size LINE_SIZE) "solid" "white")
            (aux-championship (/ num-battles 2) (* size RATIO) (+ key (/ num-battles 2)) player-list))
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
    [else (cons current (update-player name key (rest list)))])))

(define (get-key-from name list)
  (let ((current (first list)))
  (cond
    [(string=? (player-name current) name)
     (player-key current)]
    [else (get-key-from name (rest list))])))

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