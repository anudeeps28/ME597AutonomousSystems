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

class leds {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.r1 = null;
      this.r2 = null;
      this.r3 = null;
      this.g1 = null;
      this.g2 = null;
      this.g3 = null;
      this.b1 = null;
      this.b2 = null;
      this.b3 = null;
    }
    else {
      if (initObj.hasOwnProperty('r1')) {
        this.r1 = initObj.r1
      }
      else {
        this.r1 = 0;
      }
      if (initObj.hasOwnProperty('r2')) {
        this.r2 = initObj.r2
      }
      else {
        this.r2 = 0;
      }
      if (initObj.hasOwnProperty('r3')) {
        this.r3 = initObj.r3
      }
      else {
        this.r3 = 0;
      }
      if (initObj.hasOwnProperty('g1')) {
        this.g1 = initObj.g1
      }
      else {
        this.g1 = 0;
      }
      if (initObj.hasOwnProperty('g2')) {
        this.g2 = initObj.g2
      }
      else {
        this.g2 = 0;
      }
      if (initObj.hasOwnProperty('g3')) {
        this.g3 = initObj.g3
      }
      else {
        this.g3 = 0;
      }
      if (initObj.hasOwnProperty('b1')) {
        this.b1 = initObj.b1
      }
      else {
        this.b1 = 0;
      }
      if (initObj.hasOwnProperty('b2')) {
        this.b2 = initObj.b2
      }
      else {
        this.b2 = 0;
      }
      if (initObj.hasOwnProperty('b3')) {
        this.b3 = initObj.b3
      }
      else {
        this.b3 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type leds
    // Serialize message field [r1]
    bufferOffset = _serializer.uint8(obj.r1, buffer, bufferOffset);
    // Serialize message field [r2]
    bufferOffset = _serializer.uint8(obj.r2, buffer, bufferOffset);
    // Serialize message field [r3]
    bufferOffset = _serializer.uint8(obj.r3, buffer, bufferOffset);
    // Serialize message field [g1]
    bufferOffset = _serializer.uint8(obj.g1, buffer, bufferOffset);
    // Serialize message field [g2]
    bufferOffset = _serializer.uint8(obj.g2, buffer, bufferOffset);
    // Serialize message field [g3]
    bufferOffset = _serializer.uint8(obj.g3, buffer, bufferOffset);
    // Serialize message field [b1]
    bufferOffset = _serializer.uint8(obj.b1, buffer, bufferOffset);
    // Serialize message field [b2]
    bufferOffset = _serializer.uint8(obj.b2, buffer, bufferOffset);
    // Serialize message field [b3]
    bufferOffset = _serializer.uint8(obj.b3, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type leds
    let len;
    let data = new leds(null);
    // Deserialize message field [r1]
    data.r1 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [r2]
    data.r2 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [r3]
    data.r3 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [g1]
    data.g1 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [g2]
    data.g2 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [g3]
    data.g3 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [b1]
    data.b1 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [b2]
    data.b2 = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [b3]
    data.b3 = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'aut_sys/leds';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0922e2641925161f827e709fa80313c4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 r1
    uint8 r2
    uint8 r3
    uint8 g1
    uint8 g2
    uint8 g3
    uint8 b1
    uint8 b2
    uint8 b3
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new leds(null);
    if (msg.r1 !== undefined) {
      resolved.r1 = msg.r1;
    }
    else {
      resolved.r1 = 0
    }

    if (msg.r2 !== undefined) {
      resolved.r2 = msg.r2;
    }
    else {
      resolved.r2 = 0
    }

    if (msg.r3 !== undefined) {
      resolved.r3 = msg.r3;
    }
    else {
      resolved.r3 = 0
    }

    if (msg.g1 !== undefined) {
      resolved.g1 = msg.g1;
    }
    else {
      resolved.g1 = 0
    }

    if (msg.g2 !== undefined) {
      resolved.g2 = msg.g2;
    }
    else {
      resolved.g2 = 0
    }

    if (msg.g3 !== undefined) {
      resolved.g3 = msg.g3;
    }
    else {
      resolved.g3 = 0
    }

    if (msg.b1 !== undefined) {
      resolved.b1 = msg.b1;
    }
    else {
      resolved.b1 = 0
    }

    if (msg.b2 !== undefined) {
      resolved.b2 = msg.b2;
    }
    else {
      resolved.b2 = 0
    }

    if (msg.b3 !== undefined) {
      resolved.b3 = msg.b3;
    }
    else {
      resolved.b3 = 0
    }

    return resolved;
    }
};

module.exports = leds;
