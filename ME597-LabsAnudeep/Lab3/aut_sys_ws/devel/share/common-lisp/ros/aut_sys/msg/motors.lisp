; Auto-generated. Do not edit!


(cl:in-package aut_sys-msg)


;//! \htmlinclude motors.msg.html

(cl:defclass <motors> (roslisp-msg-protocol:ros-message)
  ((leftSpeed
    :reader leftSpeed
    :initarg :leftSpeed
    :type cl:float
    :initform 0.0)
   (rightSpeed
    :reader rightSpeed
    :initarg :rightSpeed
    :type cl:float
    :initform 0.0))
)

(cl:defclass motors (<motors>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motors>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motors)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name aut_sys-msg:<motors> is deprecated: use aut_sys-msg:motors instead.")))

(cl:ensure-generic-function 'leftSpeed-val :lambda-list '(m))
(cl:defmethod leftSpeed-val ((m <motors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aut_sys-msg:leftSpeed-val is deprecated.  Use aut_sys-msg:leftSpeed instead.")
  (leftSpeed m))

(cl:ensure-generic-function 'rightSpeed-val :lambda-list '(m))
(cl:defmethod rightSpeed-val ((m <motors>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aut_sys-msg:rightSpeed-val is deprecated.  Use aut_sys-msg:rightSpeed instead.")
  (rightSpeed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motors>) ostream)
  "Serializes a message object of type '<motors>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'leftSpeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'rightSpeed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motors>) istream)
  "Deserializes a message object of type '<motors>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'leftSpeed) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'rightSpeed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motors>)))
  "Returns string type for a message object of type '<motors>"
  "aut_sys/motors")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motors)))
  "Returns string type for a message object of type 'motors"
  "aut_sys/motors")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motors>)))
  "Returns md5sum for a message object of type '<motors>"
  "6a7e2ab059b1bb7e605831ab6e7ce11f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motors)))
  "Returns md5sum for a message object of type 'motors"
  "6a7e2ab059b1bb7e605831ab6e7ce11f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motors>)))
  "Returns full string definition for message of type '<motors>"
  (cl:format cl:nil "float32 leftSpeed~%float32 rightSpeed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motors)))
  "Returns full string definition for message of type 'motors"
  (cl:format cl:nil "float32 leftSpeed~%float32 rightSpeed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motors>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motors>))
  "Converts a ROS message object to a list"
  (cl:list 'motors
    (cl:cons ':leftSpeed (leftSpeed msg))
    (cl:cons ':rightSpeed (rightSpeed msg))
))
