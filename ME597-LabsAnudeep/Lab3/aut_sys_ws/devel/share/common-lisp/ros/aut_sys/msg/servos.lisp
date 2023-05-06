; Auto-generated. Do not edit!


(cl:in-package aut_sys-msg)


;//! \htmlinclude servos.msg.html

(cl:defclass <servos> (roslisp-msg-protocol:ros-message)
  ((pan
    :reader pan
    :initarg :pan
    :type cl:float
    :initform 0.0)
   (tilt
    :reader tilt
    :initarg :tilt
    :type cl:float
    :initform 0.0))
)

(cl:defclass servos (<servos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <servos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'servos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name aut_sys-msg:<servos> is deprecated: use aut_sys-msg:servos instead.")))

(cl:ensure-generic-function 'pan-val :lambda-list '(m))
(cl:defmethod pan-val ((m <servos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aut_sys-msg:pan-val is deprecated.  Use aut_sys-msg:pan instead.")
  (pan m))

(cl:ensure-generic-function 'tilt-val :lambda-list '(m))
(cl:defmethod tilt-val ((m <servos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aut_sys-msg:tilt-val is deprecated.  Use aut_sys-msg:tilt instead.")
  (tilt m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <servos>) ostream)
  "Serializes a message object of type '<servos>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pan))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'tilt))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <servos>) istream)
  "Deserializes a message object of type '<servos>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pan) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'tilt) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<servos>)))
  "Returns string type for a message object of type '<servos>"
  "aut_sys/servos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'servos)))
  "Returns string type for a message object of type 'servos"
  "aut_sys/servos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<servos>)))
  "Returns md5sum for a message object of type '<servos>"
  "938e11f380abc0513a5b7367d0f157bf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'servos)))
  "Returns md5sum for a message object of type 'servos"
  "938e11f380abc0513a5b7367d0f157bf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<servos>)))
  "Returns full string definition for message of type '<servos>"
  (cl:format cl:nil "float32 pan~%float32 tilt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'servos)))
  "Returns full string definition for message of type 'servos"
  (cl:format cl:nil "float32 pan~%float32 tilt~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <servos>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <servos>))
  "Converts a ROS message object to a list"
  (cl:list 'servos
    (cl:cons ':pan (pan msg))
    (cl:cons ':tilt (tilt msg))
))
