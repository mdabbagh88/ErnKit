#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNModalViewControllerTransitionerTest.h"
#import "ERNViewControllerTransitionerTest.h"
#import "ERNModalViewControllerTransitioner.h"

@implementation ERNModalViewControllerTransitionerTest {
}

#pragma mark - ERNViewControllerTransition protocol tests

-(void)testViewControllerTransitionProtocolWithNilSourceViewController
{
    [ERNViewControllerTransitionerTest testViewControllerTransitioner:
     [ERNModalViewControllerTransitioner createWithSourceViewController:nil]];
}

-(void)testViewControllerTransitionProtocolWithSourceViewController
{
    id mockSourceViewController = [OCMockObject niceMockForClass:[UIViewController class]];
    [ERNViewControllerTransitionerTest testViewControllerTransitioner:
     [ERNModalViewControllerTransitioner createWithSourceViewController:
      mockSourceViewController]];
}

#pragma mark - class tests

-(void)testTransitionToViewControllerSourceViewController
{
    //given
    id mockSourceViewController = [OCMockObject mockForClass:[UIViewController class]];
    id mockViewController = [OCMockObject mockForClass:[UIViewController class]];
    [[mockSourceViewController expect] presentViewController:mockViewController
                                                    animated:YES
                                                  completion:nil];
    id<ERNViewControllerTransitioner> transitioner =
    [ERNModalViewControllerTransitioner createWithSourceViewController:mockSourceViewController];

    //when
    [transitioner transitionToViewController:mockViewController];

    //then
    [mockSourceViewController verify];
    [mockViewController verify];
}

-(void)testDismissViewControllerNilSourceViewController
{
    //given
    id mockViewController = [OCMockObject mockForClass:[UIViewController class]];
    [[mockViewController expect] dismissViewControllerAnimated:YES
                                                    completion:nil];
    id<ERNViewControllerTransitioner> transitioner =
    [ERNModalViewControllerTransitioner createWithSourceViewController:nil];

    //when
    [transitioner dismissViewController:mockViewController];

    //then
    [mockViewController verify];
}

-(void)testDismissViewControllerSourceViewController
{
    //given
    id mockSourceViewController = [OCMockObject mockForClass:[UIViewController class]];
    id mockViewController = [OCMockObject mockForClass:[UIViewController class]];
    [[mockViewController expect] dismissViewControllerAnimated:YES
                                                    completion:nil];
    id<ERNViewControllerTransitioner> transitioner =
    [ERNModalViewControllerTransitioner createWithSourceViewController:mockSourceViewController];

    //when
    [transitioner dismissViewController:mockViewController];

    //then
    [mockSourceViewController verify];
    [mockViewController verify];
}

@end
