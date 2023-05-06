; Auto-generated. Do not edit!


(cl:in-package aut_sys-msg)


;//! \htmlinclude lines.msg.html

(cl:defclass <lines> (roslisp-msg-protocol:ros-message)
  ((leftLine
    :reader leftLine
    :initarg :leftLine
    :type cl:boolean
    :initform cl:nil)
   (midLine
    :reader midLine
    :initarg :midLine
    :type cl:boolean
    :initform cl:nil)
   (rightLine
    :reader rightLine
    :initarg :rightLine
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass lines (<lines>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <lines>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'lines)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name aut_sys-msg:<lines> is deprecated: use aut_sys-msg:lines instead.")))

(cl:ensure-generic-function 'leftLine-val :lambda-list '(m))
(cl:defmethod leftLine-val ((m <lines>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aut_sys-msg:leftLine-val is deprecated.  Use aut_sys-msg:leftLine instead.")
  (leftLine m))

(cl:ensure-generic-function 'midLine-val :lambda-list '(m))
(cl:defmethod midLine-val ((m <lines>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aut_sys-msg:midLine-val is deprecated.  Use aut_sys-msg:midLine instead.")
  (midLine m))

(cl:ensure-generic-function 'rightLine-val :lambda-list '(m))
(cl:defmethod rightLine-val ((m <lines>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aut_sys-msg:rightLine-val is deprecated.  Use aut_sys-msg:rightLine instead.")
  (rightLine m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <lines>) ostream)
  "Serializes a message object of type '<lines>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'leftLine) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'midLine) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'rightLine) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <lines>) istream)
  "Deserializes a message object of type '<lines>"
    (cl:setf (cl:slot-value msg 'leftLine) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'midLine) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'rightLine) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<lines>)))
  "Returns string type for a message object of type '<lines>"
  "aut_sys/lines")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'lines)))
  "Returns string type for a message object of type 'lines"
  "aut_sys/lines")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<lines>)))
  "Returns md5sum for a message object of type '<lines>"
  "7071dad4f368d2425bf5a95ab6e8d6ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'lines)))
  "Returns md5sum for a message object of type 'lines"
  "7071dad4f368d2425bf5a95ab6e8d6ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<lines>)))
  "Returns full string definition for message of type '<lines>"
  (cl:format cl:nil "bool leftLine~%bool midLine~%bool rightLine~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'lines)))
  "Returns full string definition for message of type 'lines"
  (cl:format cl:nil "bool leftLine~%bool midLine~%bool rightLine~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <lines>))
  (cl:+ 0
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <lines>))
  "Converts a ROS message object to a list"
  (cl:list 'lines
    (cl:cons ':leftLine (leftLine msg))
    (cl:cons ':midLine (midLine msg))
    (cl:cons ':rightLine (rightLine msg))
))
