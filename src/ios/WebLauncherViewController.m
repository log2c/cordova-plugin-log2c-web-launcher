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

-(void)viewDidLoad{
    [super viewDidLoad];
}

- (void)parseSettingsWithParser:(NSObject <NSXMLParserDelegate>*)delegate{
    //    if ([delegate isKindOfClass:[CDVConfigParser class]]) {
    //        CustomConfigParser* customDelegate = [[CustomConfigParser alloc] init];
    //        [super parseSettingsWithParser:customDelegate];
    //        CDVConfigParser *parser = (id < NSXMLParserDelegate >)delegate;
    //        [parser.pluginsDict removeAllObjects];
    //        [parser.startupPluginNames removeAllObjects];
    //        [parser.settings removeAllObjects];
    //
    //        [parser.pluginsDict addEntriesFromDictionary:customDelegate.pluginsDict];
    //        [parser.startupPluginNames addObjectsFromArray:customDelegate.startupPluginNames];
    //        [parser.settings addEntriesFromDictionary:customDelegate.settings];
    //    } else {
    //
    //    }
    
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
