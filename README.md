# cordova-plugin-log2c-web-launcher

类InAppBrowser, 在新的 Activity(Android)、ViewController(iOS)中打开Web页面,实现远程网页调用Cordova.

## Install

确保已安装
```
cordova plugin add cordova-plugin-ionic-webview@latest
```

然后安装本插件

```
cordova plugin add cordova-plugin-log2c-web-launcher
```

## Usage

在远端Web页面中加入:

```html
<!-- android -->
<script src="http://localhost/cordova.js"></script>
<!--iOS -->
<script type="text/javascript" src="ionic://localhost/cordova.js"></script>
```

## API

```javascript
WebLauncher.launch(url, successCallback, errorCallback);
```

