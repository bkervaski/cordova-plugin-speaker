let exec = require('cordova/exec')
let Speaker = {
  on: function (callback, error) {
    exec(callback, error, 'Speaker', 'on', [])
  },
  off: function(callback, error) {
    exec(callback, error, 'Speaker', 'off', [])
  },
  route: function(callback, error) {
    exec(callback, error, 'Speaker', 'route', [])
  },
};
module.exports = Speaker;
