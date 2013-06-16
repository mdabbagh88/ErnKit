#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNDefaultActionHandlerTest.h"
#import "ERNDefaultActionHandler.h"
#import "ERNAction.h"
#import "NSURL+ERNHelper.h"
#import "ERNResourceFactory.h"
#import "ERNRepositoryStore.h"

@implementation ERNDefaultActionHandlerTest


-(void)testActionWithActionNilResourceFactoryNilRepositoryStoreNilObject
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                   resourceFactory:nil
                                                                   repositoryStore:nil];
    
    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithActionResourceFactoryNilRepositoryStoreNilObject
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockResourceFactory = [OCMockObject mockForProtocol:@protocol(ERNResourceFactory)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                   resourceFactory:mockResourceFactory
                                                                   repositoryStore:nil];
    
    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithActionResourceFactoryRepositoryStoreNilObject
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockResourceFactory = [OCMockObject mockForProtocol:@protocol(ERNResourceFactory)];
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                   resourceFactory:mockResourceFactory
                                                                   repositoryStore:mockRepositoryStore];
    
    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithNilActionResourceFactoryRepositoryStoreNilObject
{
    //given
    id mockResourceFactory = [OCMockObject mockForProtocol:@protocol(ERNResourceFactory)];
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                   resourceFactory:mockResourceFactory
                                                                   repositoryStore:mockRepositoryStore];
    
    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithNilActionNilResourceFactoryRepositoryStoreNilObject
{
    //given
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                   resourceFactory:nil
                                                                   repositoryStore:mockRepositoryStore];
    
    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithActionNilResourceFactoryRepositoryStoreNilObject
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                   resourceFactory:nil
                                                                   repositoryStore:mockRepositoryStore];
    
    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithNilActionNilResourceFactoryNilRepositoryStore
{
    //given
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                   resourceFactory:nil
                                                                   repositoryStore:nil];
    
    //when, then
    [actionHandler actionForObject:mockObject];
}

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

-(void)testActionWithNilActionResourceFactoryRepositoryStore
{
    //given
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockResourceFactory = [OCMockObject mockForProtocol:@protocol(ERNResourceFactory)];
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                   resourceFactory:mockResourceFactory
                                                                   repositoryStore:mockRepositoryStore];
    
    //when
    [actionHandler actionForObject:mockObject];
}

-(void)testActionWithNilActionNilResourceFactoryRepositoryStore
{
    //given
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                   resourceFactory:nil
                                                                   repositoryStore:mockRepositoryStore];
    
    //when
    [actionHandler actionForObject:mockObject];
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
