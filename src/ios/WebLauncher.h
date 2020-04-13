#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>


@interface WebLauncher : NSObject

+ (id)sharedWebLauncher;

- (void)launch:(CDVPlugin*)plugin withTargetUrl: (NSURL *)url;

@end
