#import "ERNNullViewControllerConfigurator.h"
#import <UIKit/UIKit.h>

static ERNNullViewControllerConfigurator *immutableSingleton;

@implementation ERNNullViewControllerConfigurator {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNViewControllerConfigurator

-(UIViewController *)createViewControllerForResource:(ERNResource *)resource
                                           dismisser:(id<ERNViewControllerDismisser>)dismisser
{
    return [UIViewController new];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
