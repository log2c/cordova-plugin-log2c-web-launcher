package com.log2c.cordova.plugin.weblauncher;

import android.app.Activity;
import android.content.Intent;

import org.apache.cordova.CordovaPlugin;

public class WebLauncherUtil {
    private static WebLauncherUtil mLauncherUtil = null;
    private String needOpenUrl = "";

    private WebLauncherUtil() {
    }

    public static WebLauncherUtil getInstance() {
        if (mLauncherUtil == null) {
            mLauncherUtil = new WebLauncherUtil();
        }
        return mLauncherUtil;
    }

    public void launch(CordovaPlugin cordovaPlugin, final String url) {
        needOpenUrl = url;
        Activity activity = cordovaPlugin.cordova.getActivity();
        Intent intent = new Intent(activity, WebLauncherActivity.class);
        intent.putExtra(WebLauncherActivity.INTENT_FLAG, url);
        activity.startActivity(intent);
    }
}