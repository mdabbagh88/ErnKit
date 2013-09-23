#import <UIKit/UIKit.h>
#import "ERNNullViewControllerFactory.h"
#import "ERNErrorHandler.h"

@implementation ERNNullViewControllerFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
}

#pragma mark - ERNViewControllerFactory

-(UIViewController *)createViewControllerForResource:(ERNResource *) __unused resource
                                           dismisser:(id<ERNViewControllerDismisser>)__unused dismisser
{
    return [UIViewController new];
}

@end
