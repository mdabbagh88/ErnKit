#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNWindowViewControllerTransitionerTest.h"
#import "ERNWindowViewControllerTransitioner.h"

@implementation ERNWindowViewControllerTransitionerTest

-(void)testTransitionWithNilWindowNilViewController
{
    //given
    id<ERNViewControllerTransitioner> transitioner =
    [ERNWindowViewControllerTransitioner createWithWindow:nil];

    //when, then
    [transitioner transitionToViewController:nil];
}

-(void)testTransitionWithNilWindowViewController
{
    //given
    id mockViewController = [OCMockObject mockForClass:[UIViewController class]];
    id<ERNViewControllerTransitioner> transitioner =
    [ERNWindowViewControllerTransitioner createWithWindow:nil];

    //when
    [transitioner transitionToViewController:mockViewController];

    //then
    [mockViewController verify];
}

-(void)testTransitionWithWindowNilViewController
{
    //given
    id mockWindow = [OCMockObject mockForClass:[UIWindow class]];
    id<ERNViewControllerTransitioner> transitioner =
    [ERNWindowViewControllerTransitioner createWithWindow:mockWindow];

    //when, then
    [transitioner transitionToViewController:nil];
}

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
}

@end