#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNModalViewControllerTransitionerTest.h"
#import "ERNModalViewControllerTransitioner.h"

@implementation ERNModalViewControllerTransitionerTest

-(void)testTransitionToNilViewControllerNilSourceViewController
{
    //given
    id<ERNViewControllerTransitioner> transitioner =
    [ERNModalViewControllerTransitioner createWithSourceViewController:nil];

    //when, then
    [transitioner transitionToViewController:nil];
}

-(void)testTransitionToNilViewControllerSourceViewController
{
    //given
    id mockSourceViewController = [OCMockObject mockForClass:[UIViewController class]];
    id<ERNViewControllerTransitioner> transitioner =
    [ERNModalViewControllerTransitioner createWithSourceViewController:mockSourceViewController];

    //when
    [transitioner transitionToViewController:nil];

    //then
    [mockSourceViewController verify];
}

-(void)testTransitionToViewControllerNilSourceViewController
{
    //given
    id mockViewController = [OCMockObject mockForClass:[UIViewController class]];
    id<ERNViewControllerTransitioner> transitioner =
    [ERNModalViewControllerTransitioner createWithSourceViewController:nil];

    //when
    [transitioner transitionToViewController:mockViewController];

    //then
    [mockViewController verify];
}

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


-(void)testDismissNilViewControllerNilSourceViewController
{
    //given
    id<ERNViewControllerTransitioner> transitioner =
    [ERNModalViewControllerTransitioner createWithSourceViewController:nil];

    //when, then
    [transitioner dismissViewController:nil];
}

-(void)testDismissNilViewControllerSourceViewController
{
    //given
    id mockSourceViewController = [OCMockObject mockForClass:[UIViewController class]];
    id<ERNViewControllerTransitioner> transitioner =
    [ERNModalViewControllerTransitioner createWithSourceViewController:mockSourceViewController];

    //when
    [transitioner dismissViewController:nil];

    //then
    [mockSourceViewController verify];
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
