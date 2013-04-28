#import <UIKit/UIKit.h>

@protocol ERNViewControllerConfigurator <NSObject>
-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                          mime:(NSString *)mime;
@end
