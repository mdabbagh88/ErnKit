#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNViewControllerDismisserTest.h"

@implementation ERNViewControllerDismisserTest {
}

#pragma mark - ERNViewControllerDismisser protocol tests

+(void)testViewControllerDismisser:(id<ERNViewControllerDismisser>)viewControllerDismisser
{
    [self testDismissViewController:viewControllerDismisser];
    [self testDismissNilViewController:viewControllerDismisser];
}

+(void)testDismissNilViewController:(id<ERNViewControllerDismisser>)viewControllerDismisser
{
    [viewControllerDismisser dismissViewController:nil];
}

+(void)testDismissViewController:(id<ERNViewControllerDismisser>)viewControllerDismisser
{
    id mockViewController = [OCMockObject niceMockForClass:[UIViewController class]];
    [viewControllerDismisser dismissViewController:mockViewController];
}

@end
