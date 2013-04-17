#import "ERNModalViewControllerTransitioner.h"

@interface ERNModalViewControllerTransitioner ()
@property (nonatomic, readonly) UIViewController *sourceViewController;
@end

@implementation ERNModalViewControllerTransitioner

-(void)transitionToViewController:(UIViewController *)destinationViewController
{
    [[self sourceViewController] presentViewController:destinationViewController
                                              animated:YES
                                            completion:nil];
}

-(id)initWithViewController:(UIViewController*)sourceViewController
{
    self = [super init];
    _sourceViewController = sourceViewController;
    return self;
}

+(instancetype)transitionerWithSourceViewController:(UIViewController *)sourceViewController
{
    return [[self alloc] initWithViewController:sourceViewController];
}

@end
