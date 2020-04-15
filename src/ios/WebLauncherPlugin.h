#import <Cordova/CDV.h>

@interface WebLauncherPlugin : CDVPlugin

- (void)launch:(CDVInvokedUrlCommand*)command;

- (void)close: (CDVInvokedUrlCommand*)command;

@end
