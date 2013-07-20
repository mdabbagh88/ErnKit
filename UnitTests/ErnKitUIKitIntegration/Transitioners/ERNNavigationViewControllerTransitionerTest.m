#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNavigationViewControllerTransitionerTest.h"
#import "ERNViewControllerTransitionerTest.h"
#import "ERNNavigationViewControllerTransitioner.h"

@implementation ERNNavigationViewControllerTransitionerTest {
}

#pragma mark - ERNViewControllerTransition protocol tests

-(void)testViewControllerTransitionProtocolWithNilNavigationController
{
    [ERNViewControllerTransitionerTest testViewControllerTransitioner:
     [ERNNavigationViewControllerTransitioner createWithNavigationController:nil]];
}

-(void)testViewControllerTransitionProtocolWithNavigationController
{
    id mockNavigationController = [OCMockObject niceMockForClass:[UINavigationController class]];
    [ERNViewControllerTransitionerTest testViewControllerTransitioner:
     [ERNNavigationViewControllerTransitioner createWithNavigationController:
      mockNavigationController]];
}

#pragma mark - class tests

-(void)testTransitionToViewControllerNavigationController
{
    //given
    id mockNavigationController = [OCMockObject mockForClass:[UINavigationController class]];
    id mockViewController = [OCMockObject mockForClass:[UIViewController class]];
    [[mockNavigationController expect] pushViewController:mockViewController animated:YES];
    id<ERNViewControllerTransitioner> transitioner =
    [ERNNavigationViewControllerTransitioner createWithNavigationController:mockNavigationController];

    //when
    [transitioner transitionToViewController:mockViewController];

    //then
    [mockNavigationController verify];
    [mockViewController verify];
}

-(void)testDimissNilViewControllerNavigationController
{
    //given
    id mockNavigationController = [OCMockObject mockForClass:[UINavigationController class]];
    [[mockNavigationController expect] popViewControllerAnimated:YES];
    id<ERNViewControllerTransitioner> transitioner =
    [ERNNavigationViewControllerTransitioner createWithNavigationController:mockNavigationController];

    //when
    [transitioner dismissViewController:nil];

    //then
    [mockNavigationController verify];
}

-(void)testDimissNavigationController
{
    //given
    id mockNavigationController = [OCMockObject mockForClass:[UINavigationController class]];
    id mockViewController = [OCMockObject mockForClass:[UIViewController class]];
    [[mockNavigationController expect] popViewControllerAnimated:YES];
    id<ERNViewControllerTransitioner> transitioner =
    [ERNNavigationViewControllerTransitioner createWithNavigationController:mockNavigationController];

    //when
    [transitioner dismissViewController:mockViewController];

    //then
    [mockNavigationController verify];
    [mockViewController verify];
}

@end
