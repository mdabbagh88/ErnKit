#import <Foundation/Foundation.h>

@class UIViewController;
@protocol ERNViewControllerDismisser;

@protocol ERNViewControllerConfigurator <NSObject>
-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
                                      dismisser:(id<ERNViewControllerDismisser>)dismisser;
@end
