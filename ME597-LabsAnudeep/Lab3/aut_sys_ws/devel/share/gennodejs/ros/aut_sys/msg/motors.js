// Auto-generated. Do not edit!

// (in-package aut_sys.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class motors {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.leftSpeed = null;
      this.rightSpeed = null;
    }
    else {
      if (initObj.hasOwnProperty('leftSpeed')) {
        this.leftSpeed = initObj.leftSpeed
      }
      else {
        this.leftSpeed = 0.0;
      }
      if (initObj.hasOwnProperty('rightSpeed')) {
        this.rightSpeed = initObj.rightSpeed
      }
      else {
        this.rightSpeed = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type motors
    // Serialize message field [leftSpeed]
    bufferOffset = _serializer.float32(obj.leftSpeed, buffer, bufferOffset);
    // Serialize message field [rightSpeed]
    bufferOffset = _serializer.float32(obj.rightSpeed, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type motors
    let len;
    let data = new motors(null);
    // Deserialize message field [leftSpeed]
    data.leftSpeed = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [rightSpeed]
    data.rightSpeed = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'aut_sys/motors';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6a7e2ab059b1bb7e605831ab6e7ce11f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 leftSpeed
    float32 rightSpeed
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new motors(null);
    if (msg.leftSpeed !== undefined) {
      resolved.leftSpeed = msg.leftSpeed;
    }
    else {
      resolved.leftSpeed = 0.0
    }

    if (msg.rightSpeed !== undefined) {
      resolved.rightSpeed = msg.rightSpeed;
    }
    else {
      resolved.rightSpeed = 0.0
    }

    return resolved;
    }
};

module.exports = motors;
