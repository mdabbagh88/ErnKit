#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNTraceActionTest.h"
#import "ERNTraceAction.h"
#include "ERNActionTest.h"

@implementation ERNTraceActionTest {
}

#pragma mark - ERNAction protocol tests

-(void)testActionProtocolResourceAction
{
    [ERNActionTest testAction:[ERNTraceAction createWithAction:nil]];
}

-(void)testActionProtocolNilResourceAction
{
    id<ERNAction> niceMockAction = [OCMockObject niceMockForProtocol:@protocol(ERNAction)];
    [ERNActionTest testAction:[ERNTraceAction createWithAction:niceMockAction]];
}

#pragma mark - class tests

-(void)testActionActionResource
{
    //given
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"] mime:@"mime"];
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction expect] actionForResource:resource];
    id<ERNAction> action = [ERNTraceAction createWithAction:mockAction];
    
    //when
    [action actionForResource:resource];

    //then
    [mockAction verify];
}

@end
