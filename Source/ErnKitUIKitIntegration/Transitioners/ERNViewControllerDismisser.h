#import <Foundation/Foundation.h>

@class UIViewController;

@protocol ERNViewControllerDismisser <NSObject>
-(void)dismissViewController:(UIViewController *)viewController;
@end
