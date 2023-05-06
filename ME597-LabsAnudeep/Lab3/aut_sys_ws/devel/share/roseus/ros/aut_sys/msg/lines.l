;; Auto-generated. Do not edit!


(when (boundp 'aut_sys::lines)
  (if (not (find-package "AUT_SYS"))
    (make-package "AUT_SYS"))
  (shadow 'lines (find-package "AUT_SYS")))
(unless (find-package "AUT_SYS::LINES")
  (make-package "AUT_SYS::LINES"))

(in-package "ROS")
;;//! \htmlinclude lines.msg.html


(defclass aut_sys::lines
  :super ros::object
  :slots (_leftLine _midLine _rightLine ))

(defmethod aut_sys::lines
  (:init
   (&key
    ((:leftLine __leftLine) nil)
    ((:midLine __midLine) nil)
    ((:rightLine __rightLine) nil)
    )
   (send-super :init)
   (setq _leftLine __leftLine)
   (setq _midLine __midLine)
   (setq _rightLine __rightLine)
   self)
  (:leftLine
   (&optional (__leftLine :null))
   (if (not (eq __leftLine :null)) (setq _leftLine __leftLine)) _leftLine)
  (:midLine
   (&optional (__midLine :null))
   (if (not (eq __midLine :null)) (setq _midLine __midLine)) _midLine)
  (:rightLine
   (&optional (__rightLine :null))
   (if (not (eq __rightLine :null)) (setq _rightLine __rightLine)) _rightLine)
  (:serialization-length
   ()
   (+
    ;; bool _leftLine
    1
    ;; bool _midLine
    1
    ;; bool _rightLine
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _leftLine
       (if _leftLine (write-byte -1 s) (write-byte 0 s))
     ;; bool _midLine
       (if _midLine (write-byte -1 s) (write-byte 0 s))
     ;; bool _rightLine
       (if _rightLine (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _leftLine
     (setq _leftLine (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _midLine
     (setq _midLine (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _rightLine
     (setq _rightLine (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get aut_sys::lines :md5sum-) "7071dad4f368d2425bf5a95ab6e8d6ce")
(setf (get aut_sys::lines :datatype-) "aut_sys/lines")
(setf (get aut_sys::lines :definition-)
      "bool leftLine
bool midLine
bool rightLine

")



(provide :aut_sys/lines "7071dad4f368d2425bf5a95ab6e8d6ce")


