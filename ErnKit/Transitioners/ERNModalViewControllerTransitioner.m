#import "ERNModalViewControllerTransitioner.h"
#import "NSObject+ERNHelper.h"

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
    self = [self init];
    ERNCheckNil(self);
    _sourceViewController = sourceViewController;
    return self;
}

+(instancetype)transitionerWithSourceViewController:(UIViewController *)sourceViewController
{
    return [[self alloc] initWithViewController:sourceViewController];
}

@end
