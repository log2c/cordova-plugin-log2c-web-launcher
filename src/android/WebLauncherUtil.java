package com.log2c.cordova.plugin.weblauncher;

import android.app.Activity;
import android.content.Intent;

import org.apache.cordova.CordovaPlugin;

public class WebLauncherUtil {
    private static WebLauncherUtil mLauncherUtil = null;

    private WebLauncherUtil() {
    }

    public static WebLauncherUtil getInstance() {
        if (mLauncherUtil == null) {
            mLauncherUtil = new WebLauncherUtil();
        }
        return mLauncherUtil;
    }

    public void launch(CordovaPlugin cordovaPlugin, final String url, String[] excludePlugin) {
        launch(null, cordovaPlugin, url, excludePlugin);
    }

    public void launch(String packageName, CordovaPlugin cordovaPlugin, final String url, String[] excludePlugin) {
        Activity activity = cordovaPlugin.cordova.getActivity();
        Intent intent = new Intent(activity, WebLauncherActivity.class);
        intent.putExtra(WebLauncherActivity.INTENT_EXCLUDE_PLUGINS, excludePlugin);
        intent.putExtra(WebLauncherActivity.INTENT_FLAG, url);
        intent.putExtra(WebLauncherActivity.INTENT_PACKAGE_NAME, packageName);
        activity.startActivity(intent);
    }
}