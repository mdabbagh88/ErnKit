#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNWindowViewControllerTransitionerTest.h"
#import "ERNViewControllerTransitionerTest.h"
#import "ERNWindowViewControllerTransitioner.h"

@implementation ERNWindowViewControllerTransitionerTest {
}

#pragma mark - ERNViewControllerTransition protocol tests

-(void)testViewControllerTransitionProtocolWithNilWindow
{
    [ERNViewControllerTransitionerTest testViewControllerTransitioner:
     [ERNWindowViewControllerTransitioner createWithWindow:nil]];
}

-(void)testViewControllerTransitionProtocolWithWindow
{
    id mockWindow = [OCMockObject niceMockForClass:[UIWindow class]];
    [ERNViewControllerTransitionerTest testViewControllerTransitioner:
     [ERNWindowViewControllerTransitioner createWithWindow:mockWindow]];
}

#pragma mark - class tests

-(void)testTransitionWithWindowViewController
{
    //given
    id mockViewController = [OCMockObject mockForClass:[UIViewController class]];
    id mockWindow = [OCMockObject mockForClass:[UIWindow class]];
    [[mockWindow expect] setRootViewController:mockViewController];
    id<ERNViewControllerTransitioner> transitioner =
    [ERNWindowViewControllerTransitioner createWithWindow:mockWindow];

    //when
    [transitioner transitionToViewController:mockViewController];

    //then
    [mockViewController verify];
    [mockWindow verify];
}

-(void)testDismissWithWindowNilViewController
{
    //given
    id mockWindow = [OCMockObject mockForClass:[UIWindow class]];
    [[mockWindow expect] setRootViewController:OCMOCK_ANY];
    id<ERNViewControllerTransitioner> transitioner =
    [ERNWindowViewControllerTransitioner createWithWindow:mockWindow];

    //when
    [transitioner dismissViewController:nil];

    //then
    [mockWindow verify];
}

-(void)testDismissWithWindowViewController
{
    //given
    id mockViewController = [OCMockObject mockForClass:[UIViewController class]];
    id mockWindow = [OCMockObject mockForClass:[UIWindow class]];
    [[mockWindow expect] setRootViewController:OCMOCK_ANY];
    id<ERNViewControllerTransitioner> transitioner =
    [ERNWindowViewControllerTransitioner createWithWindow:mockWindow];

    //when
    [transitioner dismissViewController:mockViewController];

    //then
    [mockViewController verify];
    [mockWindow verify];
}

@end
