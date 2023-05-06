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

class lines {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.leftLine = null;
      this.midLine = null;
      this.rightLine = null;
    }
    else {
      if (initObj.hasOwnProperty('leftLine')) {
        this.leftLine = initObj.leftLine
      }
      else {
        this.leftLine = false;
      }
      if (initObj.hasOwnProperty('midLine')) {
        this.midLine = initObj.midLine
      }
      else {
        this.midLine = false;
      }
      if (initObj.hasOwnProperty('rightLine')) {
        this.rightLine = initObj.rightLine
      }
      else {
        this.rightLine = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type lines
    // Serialize message field [leftLine]
    bufferOffset = _serializer.bool(obj.leftLine, buffer, bufferOffset);
    // Serialize message field [midLine]
    bufferOffset = _serializer.bool(obj.midLine, buffer, bufferOffset);
    // Serialize message field [rightLine]
    bufferOffset = _serializer.bool(obj.rightLine, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type lines
    let len;
    let data = new lines(null);
    // Deserialize message field [leftLine]
    data.leftLine = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [midLine]
    data.midLine = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [rightLine]
    data.rightLine = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 3;
  }

  static datatype() {
    // Returns string type for a message object
    return 'aut_sys/lines';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7071dad4f368d2425bf5a95ab6e8d6ce';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool leftLine
    bool midLine
    bool rightLine
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new lines(null);
    if (msg.leftLine !== undefined) {
      resolved.leftLine = msg.leftLine;
    }
    else {
      resolved.leftLine = false
    }

    if (msg.midLine !== undefined) {
      resolved.midLine = msg.midLine;
    }
    else {
      resolved.midLine = false
    }

    if (msg.rightLine !== undefined) {
      resolved.rightLine = msg.rightLine;
    }
    else {
      resolved.rightLine = false
    }

    return resolved;
    }
};

module.exports = lines;
