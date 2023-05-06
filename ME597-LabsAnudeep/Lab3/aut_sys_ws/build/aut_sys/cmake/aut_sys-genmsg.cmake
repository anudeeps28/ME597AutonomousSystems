# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "aut_sys: 5 messages, 0 services")

set(MSG_I_FLAGS "-Iaut_sys:/home/pi/aut_sys_ws/src/aut_sys/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(aut_sys_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/distance.msg" NAME_WE)
add_custom_target(_aut_sys_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "aut_sys" "/home/pi/aut_sys_ws/src/aut_sys/msg/distance.msg" ""
)

get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/motors.msg" NAME_WE)
add_custom_target(_aut_sys_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "aut_sys" "/home/pi/aut_sys_ws/src/aut_sys/msg/motors.msg" ""
)

get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/lines.msg" NAME_WE)
add_custom_target(_aut_sys_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "aut_sys" "/home/pi/aut_sys_ws/src/aut_sys/msg/lines.msg" ""
)

get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/leds.msg" NAME_WE)
add_custom_target(_aut_sys_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "aut_sys" "/home/pi/aut_sys_ws/src/aut_sys/msg/leds.msg" ""
)

get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/servos.msg" NAME_WE)
add_custom_target(_aut_sys_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "aut_sys" "/home/pi/aut_sys_ws/src/aut_sys/msg/servos.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aut_sys
)
_generate_msg_cpp(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/motors.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aut_sys
)
_generate_msg_cpp(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/lines.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aut_sys
)
_generate_msg_cpp(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/leds.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aut_sys
)
_generate_msg_cpp(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/servos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aut_sys
)

### Generating Services

### Generating Module File
_generate_module_cpp(aut_sys
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aut_sys
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(aut_sys_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(aut_sys_generate_messages aut_sys_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/distance.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_cpp _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/motors.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_cpp _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/lines.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_cpp _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/leds.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_cpp _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/servos.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_cpp _aut_sys_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(aut_sys_gencpp)
add_dependencies(aut_sys_gencpp aut_sys_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS aut_sys_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/aut_sys
)
_generate_msg_eus(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/motors.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/aut_sys
)
_generate_msg_eus(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/lines.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/aut_sys
)
_generate_msg_eus(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/leds.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/aut_sys
)
_generate_msg_eus(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/servos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/aut_sys
)

### Generating Services

### Generating Module File
_generate_module_eus(aut_sys
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/aut_sys
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(aut_sys_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(aut_sys_generate_messages aut_sys_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/distance.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_eus _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/motors.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_eus _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/lines.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_eus _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/leds.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_eus _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/servos.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_eus _aut_sys_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(aut_sys_geneus)
add_dependencies(aut_sys_geneus aut_sys_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS aut_sys_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aut_sys
)
_generate_msg_lisp(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/motors.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aut_sys
)
_generate_msg_lisp(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/lines.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aut_sys
)
_generate_msg_lisp(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/leds.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aut_sys
)
_generate_msg_lisp(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/servos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aut_sys
)

### Generating Services

### Generating Module File
_generate_module_lisp(aut_sys
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aut_sys
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(aut_sys_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(aut_sys_generate_messages aut_sys_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/distance.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_lisp _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/motors.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_lisp _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/lines.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_lisp _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/leds.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_lisp _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/servos.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_lisp _aut_sys_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(aut_sys_genlisp)
add_dependencies(aut_sys_genlisp aut_sys_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS aut_sys_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/aut_sys
)
_generate_msg_nodejs(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/motors.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/aut_sys
)
_generate_msg_nodejs(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/lines.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/aut_sys
)
_generate_msg_nodejs(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/leds.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/aut_sys
)
_generate_msg_nodejs(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/servos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/aut_sys
)

### Generating Services

### Generating Module File
_generate_module_nodejs(aut_sys
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/aut_sys
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(aut_sys_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(aut_sys_generate_messages aut_sys_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/distance.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_nodejs _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/motors.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_nodejs _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/lines.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_nodejs _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/leds.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_nodejs _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/servos.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_nodejs _aut_sys_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(aut_sys_gennodejs)
add_dependencies(aut_sys_gennodejs aut_sys_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS aut_sys_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/distance.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aut_sys
)
_generate_msg_py(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/motors.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aut_sys
)
_generate_msg_py(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/lines.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aut_sys
)
_generate_msg_py(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/leds.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aut_sys
)
_generate_msg_py(aut_sys
  "/home/pi/aut_sys_ws/src/aut_sys/msg/servos.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aut_sys
)

### Generating Services

### Generating Module File
_generate_module_py(aut_sys
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aut_sys
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(aut_sys_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(aut_sys_generate_messages aut_sys_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/distance.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_py _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/motors.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_py _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/lines.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_py _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/leds.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_py _aut_sys_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/aut_sys_ws/src/aut_sys/msg/servos.msg" NAME_WE)
add_dependencies(aut_sys_generate_messages_py _aut_sys_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(aut_sys_genpy)
add_dependencies(aut_sys_genpy aut_sys_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS aut_sys_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aut_sys)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aut_sys
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(aut_sys_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/aut_sys)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/aut_sys
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(aut_sys_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aut_sys)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aut_sys
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(aut_sys_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/aut_sys)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/aut_sys
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(aut_sys_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aut_sys)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aut_sys\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aut_sys
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(aut_sys_generate_messages_py std_msgs_generate_messages_py)
endif()
