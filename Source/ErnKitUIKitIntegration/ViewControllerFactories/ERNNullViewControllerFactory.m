#import "ERNNullViewControllerFactory.h"
#import <UIKit/UIKit.h>

static ERNNullViewControllerFactory *immutableSingleton;

@implementation ERNNullViewControllerFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNViewControllerFactory

-(UIViewController *)createViewControllerForResource:(ERNResource *) __unused resource
                                           dismisser:(id<ERNViewControllerDismisser>)__unused dismisser
{
    return [UIViewController new];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
