; Auto-generated. Do not edit!


(cl:in-package aut_sys-msg)


;//! \htmlinclude leds.msg.html

(cl:defclass <leds> (roslisp-msg-protocol:ros-message)
  ((r1
    :reader r1
    :initarg :r1
    :type cl:fixnum
    :initform 0)
   (r2
    :reader r2
    :initarg :r2
    :type cl:fixnum
    :initform 0)
   (r3
    :reader r3
    :initarg :r3
    :type cl:fixnum
    :initform 0)
   (g1
    :reader g1
    :initarg :g1
    :type cl:fixnum
    :initform 0)
   (g2
    :reader g2
    :initarg :g2
    :type cl:fixnum
    :initform 0)
   (g3
    :reader g3
    :initarg :g3
    :type cl:fixnum
    :initform 0)
   (b1
    :reader b1
    :initarg :b1
    :type cl:fixnum
    :initform 0)
   (b2
    :reader b2
    :initarg :b2
    :type cl:fixnum
    :initform 0)
   (b3
    :reader b3
    :initarg :b3
    :type cl:fixnum
    :initform 0))
)

(cl:defclass leds (<leds>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <leds>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'leds)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name aut_sys-msg:<leds> is deprecated: use aut_sys-msg:leds instead.")))

(cl:ensure-generic-function 'r1-val :lambda-list '(m))
(cl:defmethod r1-val ((m <leds>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aut_sys-msg:r1-val is deprecated.  Use aut_sys-msg:r1 instead.")
  (r1 m))

(cl:ensure-generic-function 'r2-val :lambda-list '(m))
(cl:defmethod r2-val ((m <leds>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aut_sys-msg:r2-val is deprecated.  Use aut_sys-msg:r2 instead.")
  (r2 m))

(cl:ensure-generic-function 'r3-val :lambda-list '(m))
(cl:defmethod r3-val ((m <leds>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aut_sys-msg:r3-val is deprecated.  Use aut_sys-msg:r3 instead.")
  (r3 m))

(cl:ensure-generic-function 'g1-val :lambda-list '(m))
(cl:defmethod g1-val ((m <leds>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aut_sys-msg:g1-val is deprecated.  Use aut_sys-msg:g1 instead.")
  (g1 m))

(cl:ensure-generic-function 'g2-val :lambda-list '(m))
(cl:defmethod g2-val ((m <leds>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aut_sys-msg:g2-val is deprecated.  Use aut_sys-msg:g2 instead.")
  (g2 m))

(cl:ensure-generic-function 'g3-val :lambda-list '(m))
(cl:defmethod g3-val ((m <leds>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aut_sys-msg:g3-val is deprecated.  Use aut_sys-msg:g3 instead.")
  (g3 m))

(cl:ensure-generic-function 'b1-val :lambda-list '(m))
(cl:defmethod b1-val ((m <leds>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aut_sys-msg:b1-val is deprecated.  Use aut_sys-msg:b1 instead.")
  (b1 m))

(cl:ensure-generic-function 'b2-val :lambda-list '(m))
(cl:defmethod b2-val ((m <leds>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aut_sys-msg:b2-val is deprecated.  Use aut_sys-msg:b2 instead.")
  (b2 m))

(cl:ensure-generic-function 'b3-val :lambda-list '(m))
(cl:defmethod b3-val ((m <leds>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aut_sys-msg:b3-val is deprecated.  Use aut_sys-msg:b3 instead.")
  (b3 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <leds>) ostream)
  "Serializes a message object of type '<leds>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g3)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b1)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b2)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b3)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <leds>) istream)
  "Deserializes a message object of type '<leds>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g3)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b1)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b2)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b3)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<leds>)))
  "Returns string type for a message object of type '<leds>"
  "aut_sys/leds")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'leds)))
  "Returns string type for a message object of type 'leds"
  "aut_sys/leds")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<leds>)))
  "Returns md5sum for a message object of type '<leds>"
  "0922e2641925161f827e709fa80313c4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'leds)))
  "Returns md5sum for a message object of type 'leds"
  "0922e2641925161f827e709fa80313c4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<leds>)))
  "Returns full string definition for message of type '<leds>"
  (cl:format cl:nil "uint8 r1~%uint8 r2~%uint8 r3~%uint8 g1~%uint8 g2~%uint8 g3~%uint8 b1~%uint8 b2~%uint8 b3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'leds)))
  "Returns full string definition for message of type 'leds"
  (cl:format cl:nil "uint8 r1~%uint8 r2~%uint8 r3~%uint8 g1~%uint8 g2~%uint8 g3~%uint8 b1~%uint8 b2~%uint8 b3~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <leds>))
  (cl:+ 0
     1
     1
     1
     1
     1
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <leds>))
  "Converts a ROS message object to a list"
  (cl:list 'leds
    (cl:cons ':r1 (r1 msg))
    (cl:cons ':r2 (r2 msg))
    (cl:cons ':r3 (r3 msg))
    (cl:cons ':g1 (g1 msg))
    (cl:cons ':g2 (g2 msg))
    (cl:cons ':g3 (g3 msg))
    (cl:cons ':b1 (b1 msg))
    (cl:cons ':b2 (b2 msg))
    (cl:cons ':b3 (b3 msg))
))
