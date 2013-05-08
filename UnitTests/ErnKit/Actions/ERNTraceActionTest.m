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
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testActionNilActionUrlNilMime
{
    //given
    id<ERNAction> action = [ERNTraceAction createWithAction:nil];

    //when, then
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:nil];
}

-(void)testActionNilActionNilUrlMime
{
    //given
    id<ERNAction> action = [ERNTraceAction createWithAction:nil];

    //when, then
    [action actionForUrl:nil
                    mime:@"mime"];
}

-(void)testActionNilActionUrlMime
{
    //given
    id<ERNAction> action = [ERNTraceAction createWithAction:nil];

    //when, then
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:@"mime"];
}

-(void)testActionActionNilUrlNilMime
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id<ERNAction> action = [ERNTraceAction createWithAction:mockAction];

    //when, then
    [action actionForUrl:nil
                    mime:nil];

    //then
    [mockAction verify];
}

-(void)testActionActionUrlNilMime
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id<ERNAction> action = [ERNTraceAction createWithAction:mockAction];

    //when, then
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:nil];

    //then
    [mockAction verify];
}

-(void)testActionActionNilUrlMime
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id<ERNAction> action = [ERNTraceAction createWithAction:mockAction];

    //when, then
    [action actionForUrl:nil
                    mime:@"mime"];

    //then
    [mockAction verify];
}

-(void)testActionActionUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime";
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction expect] actionForUrl:expectedUrl
                                 mime:expectedMime];
    id<ERNAction> action = [ERNTraceAction createWithAction:mockAction];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:expectedMime];

    //then
    [mockAction verify];
}

@end
