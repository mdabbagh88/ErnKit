#import <UIKit/UIKit.h>
#import "ERNNavigationViewControllerTransitioner.h"
#import "ERNErrorHandler.h"

@interface ERNNavigationViewControllerTransitioner ()
@property (nonatomic, readonly) UINavigationController *navigationController;
@end

@implementation ERNNavigationViewControllerTransitioner {
}

#pragma mark - public - constructors

+(instancetype)createWithNavigationController:(UINavigationController *)navigationController
{
    return [[self alloc] initWithNavigationController:navigationController];
}

#pragma mark - ERNViewControllerDismisser

-(void)dismissViewController:(UIViewController *)viewController
{
    [[self navigationController] popViewControllerAnimated:YES];
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
    self = [super init];
    ERNCheckNil(self);
    _navigationController = navigationController;
    return self;
}

@end
