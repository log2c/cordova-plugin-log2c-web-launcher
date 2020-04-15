//
//  CustomConfigParser.m
//  TestApp
//
//  Created by ins2 on 2020/4/15.
//

#import "CustomConfigParser.h"

@interface CustomConfigParser ()

//@property (nonatomic, strong) NSMutableArray *excludePlugins;

@end

@implementation CustomConfigParser

-(instancetype)init{
    self = [super init];
    if (self) {
        _excludePlugins = [NSMutableArray array];
    }
    return self;
}

-(void)dealloc{
    _excludePlugins = nil;
}

- (void)parser:(NSXMLParser*)parser didStartElement:(NSString*)elementName namespaceURI:(NSString*)namespaceURI qualifiedName:(NSString*)qualifiedName attributes:(NSDictionary*)attributeDict{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qualifiedName attributes:attributeDict];
    
    if ([elementName isEqualToString:@"exclude-plugin"]) {
        NSString *name = attributeDict[@"name"];
        [self.excludePlugins addObject:[name lowercaseString]];
    }
}

@end
