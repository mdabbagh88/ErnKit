#import <UIKit/UIKit.h>
#import "ERNWindowViewControllerTransitioner.h"
#import "ERNErrorHandler.h"

@interface ERNWindowViewControllerTransitioner ()
@property (nonatomic, readonly) UIWindow *window;
@end

@implementation ERNWindowViewControllerTransitioner {
}

#pragma mark - public - constructors

+(instancetype)createWithWindow:(UIWindow *)window
{
    return [[self alloc] initWithWindow:window];
}

#pragma mark - ERNViewControllerDismisser

-(void)dismissViewController:(UIViewController *)viewController
{
    [[self window] setRootViewController:[UIViewController new]];
}

#pragma mark - ERNViewControllerTransitioner

-(void)transitionToViewController:(UIViewController *)viewController
{
    ERNCheckNilNoReturn(viewController);
    [[self window] setRootViewController:viewController];
}

#pragma mark - private - initializers

-(id)initWithWindow:(UIWindow*)window
{
    self = [super init];
    ERNCheckNil(self);
    _window = window;
    return self;
}

@end
