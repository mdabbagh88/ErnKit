#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNNullViewControllerConfiguratorTest.h"
#import "ERNViewControllerConfiguratorTest.h"
#import "ERNNullViewControllerConfigurator.h"

@implementation ERNNullViewControllerConfiguratorTest {
}

#pragma mark - ERNViewControllerConfigurator protocol tests

-(void)testViewControllerConfiguratorProtocol
{
    [ERNViewControllerConfiguratorTest testViewControllerConfigurator:
     [ERNNullViewControllerConfigurator create]];
}

@end
