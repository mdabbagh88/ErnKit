#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNViewControllerConfiguratorTest.h"
#import "ERNResource.h"

@implementation ERNViewControllerConfiguratorTest {
}

#pragma mark - ERNViewControllerConfigurator protocol test

+(void)testViewControllerConfigurator:(id<ERNViewControllerConfigurator>)viewControllerConfigurator
{
    [self testCreateViewControllerForNilResourceNilDismisser:viewControllerConfigurator];
    [self testCreateViewControllerForNilResourceDismisser:viewControllerConfigurator];
    [self testCreateViewControllerForResourceNilDismisser:viewControllerConfigurator];
    [self testCreateViewControllerForResourceDismisser:viewControllerConfigurator];
}

+(void)testCreateViewControllerForNilResourceNilDismisser:
(id<ERNViewControllerConfigurator>)viewControllerConfigurator
{
    UIViewController *viewController =
    [viewControllerConfigurator createViewControllerForResource:nil
                                                      dismisser:nil];
    assertThat(viewController, notNilValue());
}

+(void)testCreateViewControllerForNilResourceDismisser:
(id<ERNViewControllerConfigurator>)viewControllerConfigurator
{
    id<ERNViewControllerDismisser> mockDismisser =
    [OCMockObject mockForProtocol:@protocol(ERNViewControllerDismisser)];
    UIViewController *viewController =
    [viewControllerConfigurator createViewControllerForResource:nil
                                                      dismisser:mockDismisser];
    assertThat(viewController, notNilValue());
}

+(void)testCreateViewControllerForResourceNilDismisser:
(id<ERNViewControllerConfigurator>)viewControllerConfigurator
{
    ERNResource *resource = [ERNResource createNull];
    UIViewController *viewController =
    [viewControllerConfigurator createViewControllerForResource:resource
                                                      dismisser:nil];
    assertThat(viewController, notNilValue());
}


+(void)testCreateViewControllerForResourceDismisser:
(id<ERNViewControllerConfigurator>)viewControllerConfigurator
{
    ERNResource *resource = [ERNResource createNull];
    id<ERNViewControllerDismisser> mockDismisser =
    [OCMockObject mockForProtocol:@protocol(ERNViewControllerDismisser)];
    UIViewController *viewController =
    [viewControllerConfigurator createViewControllerForResource:resource
                                                      dismisser:mockDismisser];
    assertThat(viewController, notNilValue());
}

@end
