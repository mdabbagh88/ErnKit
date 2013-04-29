#import "ERNNavigationViewControllerTransitioner.h"
#import "NSObject+ERNHelper.h"

@interface ERNNavigationViewControllerTransitioner ()
@property (nonatomic, readonly) UINavigationController *navigationController;
@end

@implementation ERNNavigationViewControllerTransitioner

-(void)transitionToViewController:(UIViewController *)destinationViewController
{
    ERNCheckNil(destinationViewController);
    [[self navigationController] pushViewController:destinationViewController
                                           animated:YES];
}

-(id)initWithNavigationController:(UINavigationController *)navigationController
{
    self = [self init];
    ERNCheckNil(self);
    _navigationController = navigationController;
    return self;
}

+(instancetype)transitionerWithNavigationController:(UINavigationController *)navigationController
{
    return [[self alloc] initWithNavigationController:navigationController];
}

@end
