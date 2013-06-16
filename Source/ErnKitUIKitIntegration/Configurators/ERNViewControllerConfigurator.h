#import <Foundation/Foundation.h>

@class UIViewController;
@class ERNResource;
@protocol ERNViewControllerDismisser;

@protocol ERNViewControllerConfigurator <NSObject>
-(UIViewController *)createViewControllerForResource:(ERNResource *)resource
                                           dismisser:(id<ERNViewControllerDismisser>)dismisser;
@end
