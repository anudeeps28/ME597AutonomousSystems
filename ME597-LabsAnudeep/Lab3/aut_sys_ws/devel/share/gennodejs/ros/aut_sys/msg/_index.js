
"use strict";

let leds = require('./leds.js');
let servos = require('./servos.js');
let lines = require('./lines.js');
let distance = require('./distance.js');
let motors = require('./motors.js');

module.exports = {
  leds: leds,
  servos: servos,
  lines: lines,
  distance: distance,
  motors: motors,
};
