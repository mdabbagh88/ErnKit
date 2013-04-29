#import "ERNWindowViewControllerTransitioner.h"
#import "NSObject+ERNHelper.h"

@interface ERNWindowViewControllerTransitioner ()
@property (nonatomic, readonly) UIWindow *window;
@end

@implementation ERNWindowViewControllerTransitioner

-(void)transitionToViewController:(UIViewController *)viewController
{
    ERNCheckNil(viewController);
    [[self window] setRootViewController:viewController];
}

-(id)initWithWindow:(UIWindow*)window
{
    self = [self init];
    ERNCheckNil(self);
    _window = window;
    return self;
}

+(instancetype)transitionerWithWindow:(UIWindow *)window
{
    return [[self alloc] initWithWindow:window];
}

@end
