#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNViewControllerFactoryTest.h"
#import "ERNNullResource.h"

@implementation ERNViewControllerFactoryTest {
}

#pragma mark - ERNViewControllerFactory protocol test

+(void)testViewControllerFactory:(id<ERNViewControllerFactory>)viewControllerFactory
{
    [self testCreateViewControllerForNilResourceNilDismisser:viewControllerFactory];
    [self testCreateViewControllerForNilResourceDismisser:viewControllerFactory];
    [self testCreateViewControllerForResourceNilDismisser:viewControllerFactory];
    [self testCreateViewControllerForResourceDismisser:viewControllerFactory];
}

+(void)testCreateViewControllerForNilResourceNilDismisser:
(id<ERNViewControllerFactory>)viewControllerFactory
{
    UIViewController *viewController =
    [viewControllerFactory createViewControllerForResource:nil
                                                      dismisser:nil];
    assertThat(viewController, notNilValue());
}

+(void)testCreateViewControllerForNilResourceDismisser:
(id<ERNViewControllerFactory>)viewControllerFactory
{
    id<ERNViewControllerDismisser> mockDismisser =
    [OCMockObject mockForProtocol:@protocol(ERNViewControllerDismisser)];
    UIViewController *viewController =
    [viewControllerFactory createViewControllerForResource:nil
                                                      dismisser:mockDismisser];
    assertThat(viewController, notNilValue());
}

+(void)testCreateViewControllerForResourceNilDismisser:
(id<ERNViewControllerFactory>)viewControllerFactory
{
    ERNResource *resource = [ERNNullResource create];
    UIViewController *viewController =
    [viewControllerFactory createViewControllerForResource:resource
                                                      dismisser:nil];
    assertThat(viewController, notNilValue());
}


+(void)testCreateViewControllerForResourceDismisser:
(id<ERNViewControllerFactory>)viewControllerFactory
{
    ERNResource *resource = [ERNNullResource create];
    id<ERNViewControllerDismisser> mockDismisser =
    [OCMockObject mockForProtocol:@protocol(ERNViewControllerDismisser)];
    UIViewController *viewController =
    [viewControllerFactory createViewControllerForResource:resource
                                                      dismisser:mockDismisser];
    assertThat(viewController, notNilValue());
}

@end
