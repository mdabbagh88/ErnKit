#import <UIKit/UIKit.h>
#import "ERNModalViewControllerTransitioner.h"
#import "ERNErrorHandler.h"

@interface ERNModalViewControllerTransitioner ()
@property (nonatomic, readonly) UIViewController *sourceViewController;
@end

@implementation ERNModalViewControllerTransitioner {
}

#pragma mark - public - constructors

+(instancetype)createWithSourceViewController:(UIViewController *)sourceViewController
{
    return [[self alloc] initWithViewController:sourceViewController];
}

#pragma mark - ERNViewControllerDismisser

-(void)dismissViewController:(UIViewController *)viewController
{
    [viewController dismissViewControllerAnimated:YES
                                       completion:nil];
}

#pragma mark - ERNViewControllerTransitioner

-(void)transitionToViewController:(UIViewController *)destinationViewController
{
    ERNCheckNilNoReturn(destinationViewController);
    [[self sourceViewController] presentViewController:destinationViewController
                                              animated:YES
                                            completion:nil];
}

#pragma mark - private - initializers

-(id)initWithViewController:(UIViewController*)sourceViewController
{
    self = [self init];
    ERNCheckNil(self);
    _sourceViewController = sourceViewController;
    return self;
}

@end
