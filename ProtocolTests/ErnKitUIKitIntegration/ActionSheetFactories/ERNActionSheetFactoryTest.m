#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNActionSheetFactoryTest.h"
#import "ERNNullResource.h"

@implementation ERNActionSheetFactoryTest {
}

#pragma mark - ERNActionSheetFactory protocol test

+(void)testActionSheetFactory:(id<ERNActionSheetFactory>)ActionSheetFactory
{
    [self testCreateActionSheetForNilResource:ActionSheetFactory];
    [self testCreateActionSheetForResource:ActionSheetFactory];
}

+(void)testCreateActionSheetForNilResource:
(id<ERNActionSheetFactory>)ActionSheetFactory
{
    UIActionSheet *ActionSheet =
    [ActionSheetFactory createActionSheetForResource:nil];
    assertThat(ActionSheet, notNilValue());
}

+(void)testCreateActionSheetForResource:
(id<ERNActionSheetFactory>)ActionSheetFactory
{
    ERNResource *resource = [ERNNullResource create];
    UIActionSheet *ActionSheet =
    [ActionSheetFactory createActionSheetForResource:resource];
    assertThat(ActionSheet, notNilValue());
}

@end
