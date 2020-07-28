# cordova-plugin-speaker
A multi-threaded non-blocking iOS 11+ plugin for toggling the device speaker and retrieving the current audio route.

Audio route will be: _speaker_, _receiver_ or the actual name of the connected device such as _"Bill's Airpods Pro"_.

    Speaker.on(callbackHandler, errorHandler)
    Speaker.off(callbackHandler, errorHandler)
    Speaker.route(function(route) {
        console.log(route)
    }, function(e) {
        console.log(e)
    })
    
