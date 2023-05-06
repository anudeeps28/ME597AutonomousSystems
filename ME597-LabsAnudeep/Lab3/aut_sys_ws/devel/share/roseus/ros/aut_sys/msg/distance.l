;; Auto-generated. Do not edit!


(when (boundp 'aut_sys::distance)
  (if (not (find-package "AUT_SYS"))
    (make-package "AUT_SYS"))
  (shadow 'distance (find-package "AUT_SYS")))
(unless (find-package "AUT_SYS::DISTANCE")
  (make-package "AUT_SYS::DISTANCE"))

(in-package "ROS")
;;//! \htmlinclude distance.msg.html


(defclass aut_sys::distance
  :super ros::object
  :slots (_distance ))

(defmethod aut_sys::distance
  (:init
   (&key
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _distance (float __distance))
   self)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; float32 _distance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get aut_sys::distance :md5sum-) "6e77fb10f0c8b4833ec273aa9ac74459")
(setf (get aut_sys::distance :datatype-) "aut_sys/distance")
(setf (get aut_sys::distance :definition-)
      "float32 distance

")



(provide :aut_sys/distance "6e77fb10f0c8b4833ec273aa9ac74459")


