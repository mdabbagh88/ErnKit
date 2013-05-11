#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNavigationViewControllerTransitionerTest.h"
#import "ERNNavigationViewControllerTransitioner.h"

@implementation ERNNavigationViewControllerTransitionerTest

-(void)testTransitionToNilViewControllerNilNavigationController
{
    //given
    id<ERNViewControllerTransitioner> transitioner =
    [ERNNavigationViewControllerTransitioner createWithNavigationController:nil];

    //when, then
    [transitioner transitionToViewController:nil];
}

-(void)testTransitionToNilViewControllerNavigationController
{
    //given
    id mockNavigationController = [OCMockObject mockForClass:[UINavigationController class]];
    id<ERNViewControllerTransitioner> transitioner =
    [ERNNavigationViewControllerTransitioner createWithNavigationController:mockNavigationController];

    //when
    [transitioner transitionToViewController:nil];

    //then
    [mockNavigationController verify];
}

-(void)testTransitionToViewControllerNilNavigationController
{
    //given
    id mockViewController = [OCMockObject mockForClass:[UIViewController class]];
    id<ERNViewControllerTransitioner> transitioner =
    [ERNNavigationViewControllerTransitioner createWithNavigationController:nil];

    //when
    [transitioner transitionToViewController:mockViewController];

    //then
    [mockViewController verify];
}

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

@end