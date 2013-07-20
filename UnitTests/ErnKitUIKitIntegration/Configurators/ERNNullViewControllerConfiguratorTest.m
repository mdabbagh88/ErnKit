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

#pragma mark - class tests

-(void)testSingleton
{
    //given, when
    id<ERNViewControllerConfigurator> configurator1 = [ERNNullViewControllerConfigurator create];
    id<ERNViewControllerConfigurator> configurator2 = [ERNNullViewControllerConfigurator create];

    //then
    assertThat(configurator1, notNilValue());
    assertThat(configurator1, equalTo(configurator2));
}

@end
