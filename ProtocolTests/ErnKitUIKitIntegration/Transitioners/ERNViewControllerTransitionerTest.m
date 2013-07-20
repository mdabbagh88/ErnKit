#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNViewControllerTransitionerTest.h"
#import "ERNViewControllerDismisserTest.h"

@implementation ERNViewControllerTransitionerTest {
}

#pragma mark - ERNViewControllerTransitioner protocol tests

+(void)testViewControllerTransitioner:(id<ERNViewControllerTransitioner>)viewControllerTransitioner
{
    [ERNViewControllerDismisserTest testViewControllerDismisser:viewControllerTransitioner];
    [self testTransitionToNilViewController:viewControllerTransitioner];
    [self testTransitionToViewController:viewControllerTransitioner];
}

+(void)testTransitionToNilViewController:(id<ERNViewControllerTransitioner>)viewControllerTransitioner
{
    [viewControllerTransitioner transitionToViewController:nil];
}

+(void)testTransitionToViewController:(id<ERNViewControllerTransitioner>)viewControllerTransitioner
{
    id mockViewController = [OCMockObject niceMockForClass:[UIViewController class]];
    [viewControllerTransitioner transitionToViewController:mockViewController];
}

@end
