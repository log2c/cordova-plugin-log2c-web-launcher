//
//  CustomConfigParser.h
//  TestApp
//
//  Created by ins2 on 2020/4/15.
//
#import <Cordova/CDVConfigParser.h>

@interface CustomConfigParser: CDVConfigParser

@property (nonatomic, strong) NSMutableArray *excludePlugins;

@end
