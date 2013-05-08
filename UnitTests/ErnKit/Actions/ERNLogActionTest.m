#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNLogActionTest.h"
#import "ERNLogAction.h"
#import "NSURL+ERNHelper.h"

// Ocular inspection of output only, extract actual printing?

@implementation ERNLogActionTest

-(void)testWithNilStringNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNLogAction createWithLogString:nil];

    //when, then
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testWithNilStringUrlNilMime
{
    //given
    id<ERNAction> action = [ERNLogAction createWithLogString:nil];

    //when, then
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:nil];
}

-(void)testWithNilStringNilUrlMime
{
    //given
    id<ERNAction> action = [ERNLogAction createWithLogString:nil];

    //when, then
    [action actionForUrl:nil
                    mime:@"mime"];
}

-(void)testWithNilStringUrlMime
{
    //given
    id<ERNAction> action = [ERNLogAction createWithLogString:nil];

    //when, then
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:@"mime"];
}

-(void)testWithStringNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNLogAction createWithLogString:@"logString"];

    //when, then
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testWithStringUrlNilMime
{
    //given
    id<ERNAction> action = [ERNLogAction createWithLogString:@"logString"];

    //when, then
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:nil];
}

-(void)testWithStringNilUrlMime
{
    //given
    id<ERNAction> action = [ERNLogAction createWithLogString:@"logString"];

    //when, then
    [action actionForUrl:nil
                    mime:@"mime"];
}

-(void)testWithStringUrlMime
{
    //given
    id<ERNAction> action = [ERNLogAction createWithLogString:@"logString"];

    //when, then
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:@"mime"];
}

@end
