#import "ERNWindowViewControllerTransitioner.h"

@interface ERNWindowViewControllerTransitioner ()
@property (nonatomic, readonly) UIWindow *window;
@end

@implementation ERNWindowViewControllerTransitioner

-(void)transitionToViewController:(UIViewController *)viewController
{
    [[self window] setRootViewController:viewController];
}

-(id)initWithWindow:(UIWindow*)window
{
    self = [super init];
    _window = window;
    return self;
}

+(instancetype)transitionerWithWindow:(UIWindow *)window
{
    return [[self alloc] initWithWindow:window];
}

@end