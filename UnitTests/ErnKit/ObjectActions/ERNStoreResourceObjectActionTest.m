#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNStoreResourceObjectActionTest.h"
#import "ERNStoreResourceObjectAction.h"
#import "ERNObjectActionTest.h"
#import "ERNRepositoryStore.h"
#import "ERNResource.h"
#import "ERNResourceFactory.h"

@implementation ERNStoreResourceObjectActionTest {
}

#pragma mark - ERNObjectAction protocol tests

-(void)testObjectActionProtocolNilResourceFactoryNilRepositoryStore
{
    [ERNObjectActionTest testObjectAction:
     [ERNStoreResourceObjectAction createWithResourceFactory:nil
                                             repositoryStore:nil]];
}

-(void)testObjectActionProtocolResourceFactoryNilRepositoryStore
{
    id mockResourceFactory = [OCMockObject niceMockForProtocol:@protocol(ERNResourceFactory)];
    [ERNObjectActionTest testObjectAction:
     [ERNStoreResourceObjectAction createWithResourceFactory:mockResourceFactory
                                             repositoryStore:nil]];
}

-(void)testObjectActionProtocolNilResourceFactoryRepositoryStore
{
    id mockRepositoryStore = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryStore)];
    [ERNObjectActionTest testObjectAction:
     [ERNStoreResourceObjectAction createWithResourceFactory:nil
                                             repositoryStore:mockRepositoryStore]];
}

-(void)testObjectActionProtocolResourceFactoryRepositoryStore
{
    id mockRepositoryStore = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryStore)];
    id mockResourceFactory = [OCMockObject niceMockForProtocol:@protocol(ERNResourceFactory)];
    [ERNObjectActionTest testObjectAction:
     [ERNStoreResourceObjectAction createWithResourceFactory:mockResourceFactory
                                             repositoryStore:mockRepositoryStore]];
}

#pragma mark - class tests

-(void)testActionWithResourceFactoryRepositoryStore
{
    id mockObject = [NSObject new];
    NSURL *url = [NSURL URLWithString:@"testurl"];
    ERNResource *resource = [ERNResource createWithUrl:url
                                                  mime:@""];

    id mockResourceFactory = [OCMockObject niceMockForProtocol:@protocol(ERNResourceFactory)];
    [[[mockResourceFactory stub] andReturn:resource] resourceForObject:mockObject];
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    [[mockRepositoryStore expect] storeUrl:url
                                   forItem:mockObject];
    id<ERNObjectAction> objectAction =
    [ERNStoreResourceObjectAction createWithResourceFactory:mockResourceFactory
                                            repositoryStore:mockRepositoryStore];

    [objectAction actionForObject:mockObject];

    [mockRepositoryStore verify];
    [mockResourceFactory verify];
}

@end
