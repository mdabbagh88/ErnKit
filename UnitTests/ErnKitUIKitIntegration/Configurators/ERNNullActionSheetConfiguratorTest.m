#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNullActionSheetConfiguratorTest.h"
#import "ERNActionSheetConfiguratorTest.h"
#import "ERNNullActionSheetConfigurator.h"

@implementation ERNNullActionSheetConfiguratorTest {
}

#pragma mark - ERNViewControllerConfigurator protocol tests

-(void)testViewControllerConfiguratorProtocol
{
    [ERNActionSheetConfiguratorTest testActionSheetConfigurator:
     [ERNNullActionSheetConfigurator create]];
}

#pragma mark - class tests

-(void)testSingleton
{
    //given, when
    id<ERNActionSheetConfigurator> configurator1 = [ERNNullActionSheetConfigurator create];
    id<ERNActionSheetConfigurator> configurator2 = [ERNNullActionSheetConfigurator create];

    //then
    assertThat(configurator1, notNilValue());
    assertThat(configurator1, equalTo(configurator2));
}

@end
