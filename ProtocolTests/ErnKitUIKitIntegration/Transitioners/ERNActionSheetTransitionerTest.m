#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNActionSheetTransitionerTest.h"

@implementation ERNActionSheetTransitionerTest {
}

#pragma mark - ERNActionSheetTransitioner protocol tests

+(void)testActionSheetTransitioner:(id<ERNActionSheetTransitioner>)actionSheetTransitioner
{
    [self testTransitionToNilActionSheet:actionSheetTransitioner];
    [self testTransitionToActionSheet:actionSheetTransitioner];
}

+(void)testTransitionToNilActionSheet:(id<ERNActionSheetTransitioner>)actionSheetTransitioner
{
    [actionSheetTransitioner transitionToActionSheet:nil];
}

+(void)testTransitionToActionSheet:(id<ERNActionSheetTransitioner>)actionSheetTransitioner
{
    id mockActionSheet = [OCMockObject niceMockForClass:[UIActionSheet class]];
    [actionSheetTransitioner transitionToActionSheet:mockActionSheet];
}

@end
