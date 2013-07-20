#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <ErnKit/ErnKitUIKitIntegrationProtocolTest.h>
#import "ERNRefreshableListConfiguratorTest.h"
#import "ERNRefreshableListConfigurator.h"

@implementation ERNRefreshableListConfiguratorTest {
}

#pragma mark - ERNViewControllerConfigurator protocol tests

-(void)testViewControllerConfiguratorProtocolWithNilActionHandlerNilRepositoryFactoryNilTitle
{
    [ERNViewControllerConfiguratorTest testViewControllerConfigurator:
     [ERNRefreshableListConfigurator createWithItemManager:nil
                                         repositoryFactory:nil
                                                     title:nil]];
}

-(void)testViewControllerConfiguratorProtocolWithNilActionHandlerRepositoryFactoryNilTitle
{
    id mockRepositoryFactory = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryFactory)];
    [ERNViewControllerConfiguratorTest testViewControllerConfigurator:
     [ERNRefreshableListConfigurator createWithItemManager:nil
                                         repositoryFactory:mockRepositoryFactory
                                                     title:nil]];
}

-(void)testViewControllerConfiguratorProtocolWithActionHandlerNilRepositoryFactoryNilTitle
{
    id mockItemManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewItemManager)];
    [ERNViewControllerConfiguratorTest testViewControllerConfigurator:
     [ERNRefreshableListConfigurator createWithItemManager:mockItemManager
                                         repositoryFactory:nil
                                                     title:nil]];
}

-(void)testViewControllerConfiguratorProtocolWithActionHandlerRepositoryFactoryNilTitle
{
    id mockItemManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewItemManager)];
    id mockRepositoryFactory = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryFactory)];
    [ERNViewControllerConfiguratorTest testViewControllerConfigurator:
     [ERNRefreshableListConfigurator createWithItemManager:mockItemManager
                                         repositoryFactory:mockRepositoryFactory
                                                     title:nil]];
}

-(void)testViewControllerConfiguratorProtocolWithNilActionHandlerNilRepositoryFactoryTitle
{
    [ERNViewControllerConfiguratorTest testViewControllerConfigurator:
     [ERNRefreshableListConfigurator createWithItemManager:nil
                                         repositoryFactory:nil
                                                     title:@"title"]];
}

-(void)testViewControllerConfiguratorProtocolWithNilActionHandlerRepositoryFactoryTitle
{
    id mockRepositoryFactory = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryFactory)];
    [ERNViewControllerConfiguratorTest testViewControllerConfigurator:
     [ERNRefreshableListConfigurator createWithItemManager:nil
                                         repositoryFactory:mockRepositoryFactory
                                                     title:@"title"]];
}

-(void)testViewControllerConfiguratorProtocolWithActionHandlerNilRepositoryFactoryTitle
{
    id mockItemManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewItemManager)];
    [ERNViewControllerConfiguratorTest testViewControllerConfigurator:
     [ERNRefreshableListConfigurator createWithItemManager:mockItemManager
                                         repositoryFactory:nil
                                                     title:@"title"]];
}

-(void)testViewControllerConfiguratorProtocolWithActionHandlerRepositoryFactoryTitle
{
    id mockItemManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewItemManager)];
    id mockRepositoryFactory = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryFactory)];
    [ERNViewControllerConfiguratorTest testViewControllerConfigurator:
     [ERNRefreshableListConfigurator createWithItemManager:mockItemManager
                                         repositoryFactory:mockRepositoryFactory
                                                     title:@"title"]];
}

@end
