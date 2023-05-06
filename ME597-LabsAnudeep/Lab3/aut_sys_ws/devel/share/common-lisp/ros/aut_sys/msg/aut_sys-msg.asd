
(cl:in-package :asdf)

(defsystem "aut_sys-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "distance" :depends-on ("_package_distance"))
    (:file "_package_distance" :depends-on ("_package"))
    (:file "leds" :depends-on ("_package_leds"))
    (:file "_package_leds" :depends-on ("_package"))
    (:file "lines" :depends-on ("_package_lines"))
    (:file "_package_lines" :depends-on ("_package"))
    (:file "motors" :depends-on ("_package_motors"))
    (:file "_package_motors" :depends-on ("_package"))
    (:file "servos" :depends-on ("_package_servos"))
    (:file "_package_servos" :depends-on ("_package"))
  ))