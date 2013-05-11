#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNViewActionSheetTransitionerTest.h"
#import "ERNViewActionSheetTransitioner.h"

@implementation ERNViewActionSheetTransitionerTest

-(void)testTransitionToNilActionSheetNilView
{
    //given
    id<ERNActionSheetTransitioner> transitioner =
    [ERNViewActionSheetTransitioner createWithView:nil];

    //when, then
    [transitioner transitionToActionSheet:nil];
}

-(void)testTransitionToNilActionSheetView
{
    //given
    id mockView = [OCMockObject mockForClass:[UIView class]];
    id<ERNActionSheetTransitioner> transitioner =
    [ERNViewActionSheetTransitioner createWithView:mockView];

    //when
    [transitioner transitionToActionSheet:nil];

    //then
    [mockView verify];
}

-(void)testTransitionToActionSheetNilView
{
    //given
    id mockActionSheet = [OCMockObject mockForClass:[UIActionSheet class]];
    id<ERNActionSheetTransitioner> transitioner =
    [ERNViewActionSheetTransitioner createWithView:nil];

    //when
    [transitioner transitionToActionSheet:mockActionSheet];

    //then
    [mockActionSheet verify];
}

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
