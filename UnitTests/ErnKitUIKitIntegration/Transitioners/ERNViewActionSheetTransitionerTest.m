#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNViewActionSheetTransitionerTest.h"
#import "ERNActionSheetTransitionerTest.h"
#import "ERNViewActionSheetTransitioner.h"

@implementation ERNViewActionSheetTransitionerTest {
}

#pragma mark - ERNActionSheetTransition protocol tests

-(void)testViewControllerTransitionProtocolWithNilView
{
    [ERNActionSheetTransitionerTest testActionSheetTransitioner:
     [ERNViewActionSheetTransitioner createWithView:nil]];
}

-(void)testViewControllerTransitionProtocolWithView
{
    id mockView = [OCMockObject niceMockForClass:[UINavigationController class]];
    [ERNActionSheetTransitionerTest testActionSheetTransitioner:
     [ERNViewActionSheetTransitioner createWithView:mockView]];
}

#pragma mark - class tests

-(void)testTransitionToActionSheetView
{
    //given
    id mockView = [OCMockObject mockForClass:[UIView class]];
    id mockActionSheet = [OCMockObject mockForClass:[UIActionSheet class]];
    [[mockActionSheet expect] showInView:mockView];
    id<ERNActionSheetTransitioner> transitioner =
    [ERNViewActionSheetTransitioner createWithView:mockView];

    //when
    [transitioner transitionToActionSheet:mockActionSheet];

    //then
    [mockView verify];
    [mockActionSheet verify];
}

@end
