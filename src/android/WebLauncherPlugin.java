package com.log2c.cordova.plugin.weblauncher;

import android.text.TextUtils;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

public class WebLauncherPlugin extends CordovaPlugin {
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if ("launch".equals(action)) {
            final String url = args.getString(0);
            if (TextUtils.isEmpty(url)) {
                callbackContext.error("URL error!");
                return false;
            }
            WebLauncherUtil.getInstance().launch(this, url);
            callbackContext.success();
            return true;
        }
        return super.execute(action, args, callbackContext);
    }
}