package com.log2c.cordova.plugin.weblauncher;

import android.text.TextUtils;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.ConfigXmlParser;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import org.xmlpull.v1.XmlPullParser;

import java.util.ArrayList;
import java.util.List;

public class WebLauncherPlugin extends CordovaPlugin {
    private List<String> excludePluginList = new ArrayList<>();

    @Override
    protected void pluginInitialize() {
        super.pluginInitialize();
        new CustomConfigXmlParser().parse(cordova.getActivity().getApplication());
    }

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if ("launch".equals(action)) {
            final String url = args.getString(0);
            if (TextUtils.isEmpty(url)) {
                callbackContext.error("URL error!");
                return false;
            }
            String[] excludes = new String[excludePluginList.size()];
            excludePluginList.toArray(excludes);
            WebLauncherUtil.getInstance().launch(this, url, excludes);
            callbackContext.success();
            return true;
        } else if ("close".equals(action)) {
            cordova.getActivity().finish();
            return true;
        }
        return super.execute(action, args, callbackContext);
    }

    private class CustomConfigXmlParser extends ConfigXmlParser {
        @Override
        public void handleStartTag(XmlPullParser xml) {
            String strNode = xml.getName();
            if (strNode.equals("exclude-plugin")) {
                String name = xml.getAttributeValue(null, "name");
                excludePluginList.add(name);
            }
        }

        @Override
        public void handleEndTag(XmlPullParser xml) {
        }
    }

}