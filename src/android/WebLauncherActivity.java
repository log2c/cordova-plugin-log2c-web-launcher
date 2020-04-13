package com.log2c.cordova.plugin.weblauncher;

import android.os.Bundle;

import org.apache.cordova.CordovaActivity;

public class WebLauncherActivity extends CordovaActivity {
    public static final String INTENT_FLAG = "launcher_url";

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        launchUrl = getIntent().getStringExtra(INTENT_FLAG);
        loadUrl(launchUrl);
    }
}
