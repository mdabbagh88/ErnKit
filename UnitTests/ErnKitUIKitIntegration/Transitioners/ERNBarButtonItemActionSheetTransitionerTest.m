#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNBarButtonItemActionSheetTransitionerTest.h"
#import "ERNActionSheetTransitionerTest.h"
#import "ERNBarButtonItemActionSheetTransitioner.h"

@implementation ERNBarButtonItemActionSheetTransitionerTest {
}

#pragma mark - ERNActionSheetTransition protocol tests

-(void)testViewControllerTransitionProtocolWithNilBarButtonItem
{
    [ERNActionSheetTransitionerTest testActionSheetTransitioner:
     [ERNBarButtonItemActionSheetTransitioner createWithBarButtonItem:nil]];
}

-(void)testViewControllerTransitionProtocolWithBarButtonItem
{
    id mockBarButtonItem = [OCMockObject niceMockForClass:[UIBarButtonItem class]];
    [ERNActionSheetTransitionerTest testActionSheetTransitioner:
     [ERNBarButtonItemActionSheetTransitioner createWithBarButtonItem:mockBarButtonItem]];
}

#pragma mark - class tests

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
