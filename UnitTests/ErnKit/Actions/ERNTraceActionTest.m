#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNTraceActionTest.h"
#import "ERNTraceAction.h"

@implementation ERNTraceActionTest

-(void)testActionNilActionNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNTraceAction createWithAction:nil];

    //when, then
    [action actionForResource:nil];
}

-(void)testActionNilActionUrlMime
{
    //given
    id<ERNAction> action = [ERNTraceAction createWithAction:nil];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                  mime:@"mime"];

    //when, then
    [action actionForResource:resource];
}

-(void)testActionActionNilUrlNilMime
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id<ERNAction> action = [ERNTraceAction createWithAction:mockAction];

    //when, then
    [action actionForResource:nil];

    //then
    [mockAction verify];
}

-(void)testActionActionUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction expect] actionForResource:resource];
    id<ERNAction> action = [ERNTraceAction createWithAction:mockAction];

    //when, then
    [action actionForResource:resource];

    //then
    [mockAction verify];
}

@end
