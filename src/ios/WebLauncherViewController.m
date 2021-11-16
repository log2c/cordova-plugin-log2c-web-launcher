//
//  WebLauncherViewController.m
//  TestApp
//
//  Created by ins2 on 2020/4/15.
//

#import <Foundation/Foundation.h>
#import <Cordova/CDVConfigParser.h>
#import "WebLauncherViewController.h"
#import "CustomConfigParser.h"

@interface WebLauncherViewController (){

    BOOL isInit;

}
@end

@implementation WebLauncherViewController

- (instancetype)init{
    id instance = [super init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onWebViewPageDidLoad1:)
                                                 name:CDVPageDidLoadNotification object:nil];
    return instance;
}
- (void)onWebViewPageDidLoad1:(NSNotification*)notification
{
    self.webView.hidden = NO;
    [self showLaunchScreen:NO];
}
- (void)viewDidLoad{
    [super viewDidLoad];
}
- (void)createLaunchView
{
    CGRect webViewBounds = self.view.bounds;
    webViewBounds.origin = self.view.bounds.origin;

    UIView* view = [[UIView alloc] initWithFrame:webViewBounds];
    [view setAlpha:0];

    [self setValue:view forKey:@"launchView"];
    [self.view addSubview:view];
}

- (void)parseSettingsWithParser:(NSObject <NSXMLParserDelegate>*)delegate{
    if (!isInit) {
        CustomConfigParser* customDelegate = [[CustomConfigParser alloc] init];
        [super parseSettingsWithParser:customDelegate]; // 获取到 exclude-plugin
        self.excludePlugins = customDelegate.excludePlugins;
        isInit = YES;
    }


    [super parseSettingsWithParser:delegate];

    if (self.excludePlugins != nil && [delegate isKindOfClass:[CDVConfigParser class]]) {
        CDVConfigParser *parser = (id < NSXMLParserDelegate >)delegate;
        for (NSString *plugin in self.excludePlugins) {
            [parser.pluginsDict removeObjectForKey:plugin];
            [parser.startupPluginNames removeObject:plugin];
        }
    }
}


@end
