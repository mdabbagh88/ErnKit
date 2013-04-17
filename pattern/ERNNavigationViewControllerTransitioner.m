#import "ERNNavigationViewControllerTransitioner.h"

@interface ERNNavigationViewControllerTransitioner ()
@property (nonatomic, readonly) UINavigationController *navigationController;
@end

@implementation ERNNavigationViewControllerTransitioner

-(void)transitionToViewController:(UIViewController *)destinationViewController
{
    [[self navigationController] pushViewController:destinationViewController
                                           animated:YES];
}

-(id)initWithNavigationController:(UINavigationController *)navigationController
{
    self = [super init];
    _navigationController = navigationController;
    return self;
}

+(instancetype)transitionerWithNavigationController:(UINavigationController *)navigationController
{
    return [[self alloc] initWithNavigationController:navigationController];
}

@end
