#import <Foundation/Foundation.h>

@class UIViewController;

@protocol ERNViewControllerConfigurator <NSObject>
-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                          mime:(NSString *)mime;
@end
