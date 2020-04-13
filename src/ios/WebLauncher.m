#import "WebLauncher.h"
#import "MainViewController.h"

@interface WebLauncher(){
    NSURL *needOpenUrl;
}

@end

@implementation WebLauncher

+ (id)sharedWebLauncher{
    static WebLauncher *launcher = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        launcher = [[self alloc] init];
    });
    return launcher;
}

-(void)launch:(CDVPlugin *)plugin withTargetUrl:(NSURL *)url{
    needOpenUrl = url;
    MainViewController *vc = [[MainViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;

    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [vc addObserver:self forKeyPath:@"startPage" options:options context:@"launch"];

    [plugin.viewController presentViewController:vc animated:YES completion:^{

    }];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    MainViewController *vc = object;
    [vc removeObserver:self forKeyPath:@"startPage"];
    vc.startPage = [needOpenUrl absoluteString];
//    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
}


@end
