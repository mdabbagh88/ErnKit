#import <UIKit/UIKit.h>
#import "ERNNavigationViewControllerTransitioner.h"
#import "ERNErrorHandler.h"

@interface ERNNavigationViewControllerTransitioner ()
@property (nonatomic, readonly) UINavigationController *navigationController;
@end

@implementation ERNNavigationViewControllerTransitioner {
}

#pragma mark - public - constructors

+(instancetype)transitionerWithNavigationController:(UINavigationController *)navigationController
{
    return [[self alloc] initWithNavigationController:navigationController];
}

#pragma mark - ERNViewControllerTransitioner

-(void)transitionToViewController:(UIViewController *)destinationViewController
{
    ERNCheckNilNoReturn(destinationViewController);
    [[self navigationController] pushViewController:destinationViewController
                                           animated:YES];
}

#pragma mark - private - initializers

-(id)initWithNavigationController:(UINavigationController *)navigationController
{
    self = [self init];
    ERNCheckNil(self);
    _navigationController = navigationController;
    return self;
}

@end
