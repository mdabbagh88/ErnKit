#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <ErnKit/ErnKitUIKitIntegrationProtocolTest.h>
#import "ERNRefreshableListFactoryTest.h"
#import "ERNRefreshableListFactory.h"

@implementation ERNRefreshableListFactoryTest {
}

#pragma mark - ERNViewControllerFactory protocol tests

-(void)testViewControllerFactoryProtocolWithNilActionHandlerNilRepositoryFactoryNilTitle
{
    [ERNViewControllerFactoryTest testViewControllerFactory:
     [ERNRefreshableListFactory createWithItemManager:nil
                                         repositoryFactory:nil
                                                     title:nil]];
}

-(void)testViewControllerFactoryProtocolWithNilActionHandlerRepositoryFactoryNilTitle
{
    id mockRepositoryFactory = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryFactory)];
    [ERNViewControllerFactoryTest testViewControllerFactory:
     [ERNRefreshableListFactory createWithItemManager:nil
                                         repositoryFactory:mockRepositoryFactory
                                                     title:nil]];
}

-(void)testViewControllerFactoryProtocolWithActionHandlerNilRepositoryFactoryNilTitle
{
    id mockItemManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewItemManager)];
    [ERNViewControllerFactoryTest testViewControllerFactory:
     [ERNRefreshableListFactory createWithItemManager:mockItemManager
                                         repositoryFactory:nil
                                                     title:nil]];
}

-(void)testViewControllerFactoryProtocolWithActionHandlerRepositoryFactoryNilTitle
{
    id mockItemManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewItemManager)];
    id mockRepositoryFactory = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryFactory)];
    [ERNViewControllerFactoryTest testViewControllerFactory:
     [ERNRefreshableListFactory createWithItemManager:mockItemManager
                                         repositoryFactory:mockRepositoryFactory
                                                     title:nil]];
}

-(void)testViewControllerFactoryProtocolWithNilActionHandlerNilRepositoryFactoryTitle
{
    [ERNViewControllerFactoryTest testViewControllerFactory:
     [ERNRefreshableListFactory createWithItemManager:nil
                                         repositoryFactory:nil
                                                     title:@"title"]];
}

-(void)testViewControllerFactoryProtocolWithNilActionHandlerRepositoryFactoryTitle
{
    id mockRepositoryFactory = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryFactory)];
    [ERNViewControllerFactoryTest testViewControllerFactory:
     [ERNRefreshableListFactory createWithItemManager:nil
                                         repositoryFactory:mockRepositoryFactory
                                                     title:@"title"]];
}

-(void)testViewControllerFactoryProtocolWithActionHandlerNilRepositoryFactoryTitle
{
    id mockItemManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewItemManager)];
    [ERNViewControllerFactoryTest testViewControllerFactory:
     [ERNRefreshableListFactory createWithItemManager:mockItemManager
                                         repositoryFactory:nil
                                                     title:@"title"]];
}

-(void)testViewControllerFactoryProtocolWithActionHandlerRepositoryFactoryTitle
{
    id mockItemManager = [OCMockObject mockForProtocol:@protocol(ERNTableViewItemManager)];
    id mockRepositoryFactory = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryFactory)];
    [ERNViewControllerFactoryTest testViewControllerFactory:
     [ERNRefreshableListFactory createWithItemManager:mockItemManager
                                         repositoryFactory:mockRepositoryFactory
                                                     title:@"title"]];
}

@end
