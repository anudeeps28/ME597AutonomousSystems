;; Auto-generated. Do not edit!


(when (boundp 'aut_sys::leds)
  (if (not (find-package "AUT_SYS"))
    (make-package "AUT_SYS"))
  (shadow 'leds (find-package "AUT_SYS")))
(unless (find-package "AUT_SYS::LEDS")
  (make-package "AUT_SYS::LEDS"))

(in-package "ROS")
;;//! \htmlinclude leds.msg.html


(defclass aut_sys::leds
  :super ros::object
  :slots (_r1 _r2 _r3 _g1 _g2 _g3 _b1 _b2 _b3 ))

(defmethod aut_sys::leds
  (:init
   (&key
    ((:r1 __r1) 0)
    ((:r2 __r2) 0)
    ((:r3 __r3) 0)
    ((:g1 __g1) 0)
    ((:g2 __g2) 0)
    ((:g3 __g3) 0)
    ((:b1 __b1) 0)
    ((:b2 __b2) 0)
    ((:b3 __b3) 0)
    )
   (send-super :init)
   (setq _r1 (round __r1))
   (setq _r2 (round __r2))
   (setq _r3 (round __r3))
   (setq _g1 (round __g1))
   (setq _g2 (round __g2))
   (setq _g3 (round __g3))
   (setq _b1 (round __b1))
   (setq _b2 (round __b2))
   (setq _b3 (round __b3))
   self)
  (:r1
   (&optional __r1)
   (if __r1 (setq _r1 __r1)) _r1)
  (:r2
   (&optional __r2)
   (if __r2 (setq _r2 __r2)) _r2)
  (:r3
   (&optional __r3)
   (if __r3 (setq _r3 __r3)) _r3)
  (:g1
   (&optional __g1)
   (if __g1 (setq _g1 __g1)) _g1)
  (:g2
   (&optional __g2)
   (if __g2 (setq _g2 __g2)) _g2)
  (:g3
   (&optional __g3)
   (if __g3 (setq _g3 __g3)) _g3)
  (:b1
   (&optional __b1)
   (if __b1 (setq _b1 __b1)) _b1)
  (:b2
   (&optional __b2)
   (if __b2 (setq _b2 __b2)) _b2)
  (:b3
   (&optional __b3)
   (if __b3 (setq _b3 __b3)) _b3)
  (:serialization-length
   ()
   (+
    ;; uint8 _r1
    1
    ;; uint8 _r2
    1
    ;; uint8 _r3
    1
    ;; uint8 _g1
    1
    ;; uint8 _g2
    1
    ;; uint8 _g3
    1
    ;; uint8 _b1
    1
    ;; uint8 _b2
    1
    ;; uint8 _b3
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _r1
       (write-byte _r1 s)
     ;; uint8 _r2
       (write-byte _r2 s)
     ;; uint8 _r3
       (write-byte _r3 s)
     ;; uint8 _g1
       (write-byte _g1 s)
     ;; uint8 _g2
       (write-byte _g2 s)
     ;; uint8 _g3
       (write-byte _g3 s)
     ;; uint8 _b1
       (write-byte _b1 s)
     ;; uint8 _b2
       (write-byte _b2 s)
     ;; uint8 _b3
       (write-byte _b3 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _r1
     (setq _r1 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _r2
     (setq _r2 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _r3
     (setq _r3 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _g1
     (setq _g1 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _g2
     (setq _g2 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _g3
     (setq _g3 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _b1
     (setq _b1 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _b2
     (setq _b2 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _b3
     (setq _b3 (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get aut_sys::leds :md5sum-) "0922e2641925161f827e709fa80313c4")
(setf (get aut_sys::leds :datatype-) "aut_sys/leds")
(setf (get aut_sys::leds :definition-)
      "uint8 r1
uint8 r2
uint8 r3
uint8 g1
uint8 g2
uint8 g3
uint8 b1
uint8 b2
uint8 b3

")



(provide :aut_sys/leds "0922e2641925161f827e709fa80313c4")


