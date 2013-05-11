#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNBarButtonItemActionSheetTransitionerTest.h"
#import "ERNBarButtonItemActionSheetTransitioner.h"

@implementation ERNBarButtonItemActionSheetTransitionerTest

-(void)testTransitionToNilActionSheetNilBarButtonItem
{
    //given
    id<ERNActionSheetTransitioner> transitioner =
    [ERNBarButtonItemActionSheetTransitioner createWithBarButtonItem:nil];

    //when, then
    [transitioner transitionToActionSheet:nil];
}

-(void)testTransitionToNilActionSheetBarButtonItem
{
    //given
    id mockBarButtonItem = [OCMockObject mockForClass:[UIBarButtonItem class]];
    id<ERNActionSheetTransitioner> transitioner =
    [ERNBarButtonItemActionSheetTransitioner createWithBarButtonItem:mockBarButtonItem];

    //when
    [transitioner transitionToActionSheet:nil];

    //then
    [mockBarButtonItem verify];
}

-(void)testTransitionToActionSheetNilBarButtonItem
{
    //given
    id mockActionSheet = [OCMockObject mockForClass:[UIActionSheet class]];
    id<ERNActionSheetTransitioner> transitioner =
    [ERNBarButtonItemActionSheetTransitioner createWithBarButtonItem:nil];

    //when
    [transitioner transitionToActionSheet:mockActionSheet];

    //then
    [mockActionSheet verify];
}

-(void)testTransitionToActionSheetBarButtonItem
{
    //given
    id mockBarButtonItem = [OCMockObject mockForClass:[UIBarButtonItem class]];
    id mockActionSheet = [OCMockObject mockForClass:[UIActionSheet class]];
    [[mockActionSheet expect] showFromBarButtonItem:mockBarButtonItem animated:YES];
    id<ERNActionSheetTransitioner> transitioner =
    [ERNBarButtonItemActionSheetTransitioner createWithBarButtonItem:mockBarButtonItem];

    //when
    [transitioner transitionToActionSheet:mockActionSheet];

    //then
    [mockBarButtonItem verify];
    [mockActionSheet verify];
}

@end
