package com.log2c.cordova.plugin.weblauncher;

import android.os.Bundle;
import android.text.TextUtils;

import com.blankj.utilcode.util.ReflectUtils;

import org.apache.cordova.CordovaActivity;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginEntry;

import java.util.Iterator;

public class WebLauncherActivity extends CordovaActivity {
    public static final String INTENT_FLAG = "launcher_url";
    public static final String INTENT_EXCLUDE_PLUGINS = "intent_exclude_plugins";
    private String[] excludePluginArgs;

    private String packageName;
    public static final String INTENT_PACKAGE_NAME = "package_name";


    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        launchUrl = getIntent().getStringExtra(INTENT_FLAG);
        excludePluginArgs = getIntent().getStringArrayExtra(INTENT_EXCLUDE_PLUGINS);
        packageName = getIntent().getStringExtra(INTENT_PACKAGE_NAME);
        loadUrl(launchUrl);
    }

    @Override
    protected void init() {
        removePlugin();
        super.init();
        CordovaWebView app = ReflectUtils.reflect(appView.getPluginManager()).field("app").get();
        if (!TextUtils.isEmpty(packageName)) {
            app.getPreferences().set("applicationId", packageName);
        }
    }

    private void removePlugin() {
        if (excludePluginArgs == null || excludePluginArgs.length == 0) {
            return;
        }
        Iterator<PluginEntry> iterator = pluginEntries.iterator();
        while (iterator.hasNext()) {
            PluginEntry entry = iterator.next();
            for (String excludeServiceName : excludePluginArgs) {
                if (entry.service.equals(excludeServiceName)) {
                    iterator.remove();
                    continue;
                }
            }
        }
    }


}
