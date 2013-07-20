#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNActionSheetConfiguratorTest.h"
#import "ERNNullResource.h"

@implementation ERNActionSheetConfiguratorTest {
}

#pragma mark - ERNActionSheetConfigurator protocol test

+(void)testActionSheetConfigurator:(id<ERNActionSheetConfigurator>)ActionSheetConfigurator
{
    [self testCreateActionSheetForNilResource:ActionSheetConfigurator];
    [self testCreateActionSheetForResource:ActionSheetConfigurator];
}

+(void)testCreateActionSheetForNilResource:
(id<ERNActionSheetConfigurator>)ActionSheetConfigurator
{
    UIActionSheet *ActionSheet =
    [ActionSheetConfigurator createActionSheetForResource:nil];
    assertThat(ActionSheet, notNilValue());
}

+(void)testCreateActionSheetForResource:
(id<ERNActionSheetConfigurator>)ActionSheetConfigurator
{
    ERNResource *resource = [ERNNullResource create];
    UIActionSheet *ActionSheet =
    [ActionSheetConfigurator createActionSheetForResource:resource];
    assertThat(ActionSheet, notNilValue());
}

@end
