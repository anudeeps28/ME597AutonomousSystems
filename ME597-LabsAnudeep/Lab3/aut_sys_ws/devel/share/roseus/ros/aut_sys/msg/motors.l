;; Auto-generated. Do not edit!


(when (boundp 'aut_sys::motors)
  (if (not (find-package "AUT_SYS"))
    (make-package "AUT_SYS"))
  (shadow 'motors (find-package "AUT_SYS")))
(unless (find-package "AUT_SYS::MOTORS")
  (make-package "AUT_SYS::MOTORS"))

(in-package "ROS")
;;//! \htmlinclude motors.msg.html


(defclass aut_sys::motors
  :super ros::object
  :slots (_leftSpeed _rightSpeed ))

(defmethod aut_sys::motors
  (:init
   (&key
    ((:leftSpeed __leftSpeed) 0.0)
    ((:rightSpeed __rightSpeed) 0.0)
    )
   (send-super :init)
   (setq _leftSpeed (float __leftSpeed))
   (setq _rightSpeed (float __rightSpeed))
   self)
  (:leftSpeed
   (&optional __leftSpeed)
   (if __leftSpeed (setq _leftSpeed __leftSpeed)) _leftSpeed)
  (:rightSpeed
   (&optional __rightSpeed)
   (if __rightSpeed (setq _rightSpeed __rightSpeed)) _rightSpeed)
  (:serialization-length
   ()
   (+
    ;; float32 _leftSpeed
    4
    ;; float32 _rightSpeed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _leftSpeed
       (sys::poke _leftSpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _rightSpeed
       (sys::poke _rightSpeed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _leftSpeed
     (setq _leftSpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _rightSpeed
     (setq _rightSpeed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get aut_sys::motors :md5sum-) "6a7e2ab059b1bb7e605831ab6e7ce11f")
(setf (get aut_sys::motors :datatype-) "aut_sys/motors")
(setf (get aut_sys::motors :definition-)
      "float32 leftSpeed
float32 rightSpeed

")



(provide :aut_sys/motors "6a7e2ab059b1bb7e605831ab6e7ce11f")


