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

@end
