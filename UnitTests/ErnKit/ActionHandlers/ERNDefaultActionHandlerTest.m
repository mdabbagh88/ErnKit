#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNDefaultActionHandlerTest.h"
#import "ERNDefaultActionHandler.h"
#import "ERNAction.h"
#import "NSURL+ERNHelper.h"
#import "ERNResourceFactory.h"
#import "ERNRepositoryStore.h"
#import "ERNActionHandlerTest.h"

@implementation ERNDefaultActionHandlerTest {
}

#pragma mark - ERNActionHandler protocol tests

-(void)testActionHandlerProtocolWithNilActionNilResourceFactoryNilRepositoryFactory
{
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                   resourceFactory:nil
                                                                   repositoryStore:nil];
    [ERNActionHandlerTest testActionHandler:actionHandler];
}

-(void)testActionHandlerProtocolWithActionNilResourceFactoryNilRepositoryFactory
{
    id niceMockAction = [OCMockObject niceMockForProtocol:@protocol(ERNAction)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:niceMockAction
                                                                   resourceFactory:nil
                                                                   repositoryStore:nil];
    [ERNActionHandlerTest testActionHandler:actionHandler];
}

-(void)testActionHandlerProtocolWithActionResourceFactoryNilRepositoryFactory
{
    id niceMockAction = [OCMockObject niceMockForProtocol:@protocol(ERNAction)];
    id niceMockResourceFactory = [OCMockObject niceMockForProtocol:@protocol(ERNResourceFactory)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:niceMockAction
                                                                   resourceFactory:niceMockResourceFactory
                                                                   repositoryStore:nil];
    [ERNActionHandlerTest testActionHandler:actionHandler];
}

-(void)testActionHandlerProtocolWithActionResourceFactoryRepositoryFactory
{
    id niceMockAction = [OCMockObject niceMockForProtocol:@protocol(ERNAction)];
    id niceMockResourceFactory = [OCMockObject niceMockForProtocol:@protocol(ERNResourceFactory)];
    id niceMockRepositoryStore = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryStore)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:niceMockAction
                                                                   resourceFactory:niceMockResourceFactory
                                                                   repositoryStore:niceMockRepositoryStore];
    [ERNActionHandlerTest testActionHandler:actionHandler];
}

-(void)testActionHandlerProtocolWithNilActionResourceFactoryRepositoryFactory
{
    id niceMockResourceFactory = [OCMockObject niceMockForProtocol:@protocol(ERNResourceFactory)];
    id niceMockRepositoryStore = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryStore)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                   resourceFactory:niceMockResourceFactory
                                                                   repositoryStore:niceMockRepositoryStore];
    [ERNActionHandlerTest testActionHandler:actionHandler];
}

-(void)testActionHandlerProtocolWithNilActionNilResourceFactoryRepositoryFactory
{
    id niceMockRepositoryStore = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryStore)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                   resourceFactory:nil
                                                                   repositoryStore:niceMockRepositoryStore];
    [ERNActionHandlerTest testActionHandler:actionHandler];
}

-(void)testActionHandlerProtocolWithActionNilResourceFactoryRepositoryFactory
{
    id niceMockAction = [OCMockObject niceMockForProtocol:@protocol(ERNAction)];
    id niceMockRepositoryStore = [OCMockObject niceMockForProtocol:@protocol(ERNRepositoryStore)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:niceMockAction
                                                                   resourceFactory:nil
                                                                   repositoryStore:niceMockRepositoryStore];
    [ERNActionHandlerTest testActionHandler:actionHandler];
}

#pragma mark - class tests

-(void)testActionWithActionNilResourceFactoryNilRepositoryStore
{
    //given
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction expect] actionForResource:OCMOCK_ANY];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                   resourceFactory:nil
                                                                   repositoryStore:nil];
    
    //when
    [actionHandler actionForObject:mockObject];
    
    //then
    [mockAction verify];
}

-(void)testActionWithActionResourceFactoryNilRepositoryStore
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedURL"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction expect] actionForResource:OCMOCK_ANY];
    id mockResourceFactory = [OCMockObject mockForProtocol:@protocol(ERNResourceFactory)];
    [[[mockResourceFactory expect] andReturn:resource] resourceForObject:mockObject];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                   resourceFactory:mockResourceFactory
                                                                   repositoryStore:nil];
    
    //when
    [actionHandler actionForObject:mockObject];
    
    //then
    [mockAction verify];
    [mockResourceFactory verify];
}

-(void)testActionWithActionResourceFactoryRepositoryStore
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedURL"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction expect] actionForResource:OCMOCK_ANY];
    id mockResourceFactory = [OCMockObject mockForProtocol:@protocol(ERNResourceFactory)];
    [[[mockResourceFactory expect] andReturn:resource] resourceForObject:mockObject];
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    [[mockRepositoryStore expect] storeUrl:expectedUrl
                                   forItem:mockObject];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                   resourceFactory:mockResourceFactory
                                                                   repositoryStore:mockRepositoryStore];
    
    //when
    [actionHandler actionForObject:mockObject];
    
    //then
    [mockResourceFactory verify];
    [mockAction verify];
    [mockRepositoryStore verify];
}

-(void)testActionWithActionNilResourceFactoryRepositoryStore
{
    //given
    NSURL *expectedUrl = [NSURL ERN_createNull];
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction expect] actionForResource:OCMOCK_ANY];
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    [[mockRepositoryStore expect] storeUrl:expectedUrl
                                   forItem:mockObject];
    
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                   resourceFactory:nil
                                                                   repositoryStore:mockRepositoryStore];
    
    //when
    [actionHandler actionForObject:mockObject];
    
    //then
    [mockAction verify];
    [mockRepositoryStore verify];
}

@end
