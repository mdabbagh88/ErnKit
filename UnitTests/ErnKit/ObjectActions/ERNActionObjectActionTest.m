#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNActionObjectActionTest.h"
#import "ERNActionObjectAction.h"
#import "ERNAction.h"
#import "NSURL+ERNHelper.h"
#import "ERNResourceFactory.h"
#import "ERNRepositoryStore.h"
#import "ERNObjectActionTest.h"

@implementation ERNActionObjectActionTest {
}

#pragma mark - ERNObjectAction protocol tests

-(void)testObjectActionProtocolWithNilActionNilResourceFactory
{
    id<ERNObjectAction> objectAction = [ERNActionObjectAction createWithAction:nil
                                                                   resourceFactory:nil];
    [ERNObjectActionTest testObjectAction:objectAction];
}

-(void)testObjectActionProtocolWithActionNilResourceFactory
{
    id niceMockAction = [OCMockObject niceMockForProtocol:@protocol(ERNAction)];
    id<ERNObjectAction> objectAction = [ERNActionObjectAction createWithAction:niceMockAction
                                                               resourceFactory:nil];
    [ERNObjectActionTest testObjectAction:objectAction];
}

-(void)testObjectActionProtocolWithActionResourceFactory
{
    id niceMockAction = [OCMockObject niceMockForProtocol:@protocol(ERNAction)];
    id niceMockResourceFactory = [OCMockObject niceMockForProtocol:@protocol(ERNResourceFactory)];
    id<ERNObjectAction> objectAction = [ERNActionObjectAction createWithAction:niceMockAction
                                                               resourceFactory:niceMockResourceFactory];
    [ERNObjectActionTest testObjectAction:objectAction];
}

#pragma mark - class tests

-(void)testActionWithActionNilResourceFactory
{
    //given
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction expect] actionForResource:OCMOCK_ANY];
    id<ERNObjectAction> objectAction = [ERNActionObjectAction createWithAction:mockAction
                                                               resourceFactory:nil];
    
    //when
    [objectAction actionForObject:mockObject];
    
    //then
    [mockAction verify];
}

-(void)testActionWithActionResourceFactory
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
    id<ERNObjectAction> objectAction = [ERNActionObjectAction createWithAction:mockAction
                                                               resourceFactory:mockResourceFactory];
    
    //when
    [objectAction actionForObject:mockObject];
    
    //then
    [mockAction verify];
    [mockResourceFactory verify];
}

@end
