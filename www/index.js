var exec = require('cordova/exec');

var WebLauncher = {
    errorCallback: function (msg) {
        console.log('WebLauncher Callback Error: ' + msg)
    },

    callNative: function (name, args, successCallback, errorCallback) {
        if (errorCallback) {
            cordova.exec(successCallback, errorCallback, 'WebLauncher', name, args)
        } else {
            cordova.exec(successCallback, this.errorCallback, 'WebLauncher', name, args)
        }
    },
    launch: function (url, successCallback, errorCallback) {
        this.callNative('launch', [url], successCallback, errorCallback)
    },
    close: function (successCallback, errorCallback) {
        this.callNative('close', [], successCallback, errorCallback)
    },
    WebLauncher: WebLauncher
}
module.exports = WebLauncher;