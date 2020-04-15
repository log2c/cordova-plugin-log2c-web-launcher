#import <Cordova/CDV.h>
#import "WebLauncherPlugin.h"
#import "WebLauncher.h"

@implementation WebLauncherPlugin

-(void)launch:(CDVInvokedUrlCommand *)command{
    NSString *url = [command.arguments objectAtIndex:0];
    if (url == nil || url.length == 0) {
        [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"URL error!"] callbackId:command.callbackId];
        return;
    }
    WebLauncher *launch = [WebLauncher sharedWebLauncher];
    [launch launch:self withTargetUrl:[NSURL URLWithString:url]];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}

-(void)close:(CDVInvokedUrlCommand *)command{
    [self.viewController dismissViewControllerAnimated:YES completion:nil];
}

@end
