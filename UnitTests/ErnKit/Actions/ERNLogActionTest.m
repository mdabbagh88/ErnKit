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
    [action actionForResource:nil];
}

-(void)testWithNilStringUrlMime
{
    //given
    id<ERNAction> action = [ERNLogAction createWithLogString:nil];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                                       mime:@"mime"];

    //when, then
    [action actionForResource:resource];
}

-(void)testWithStringNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNLogAction createWithLogString:@"logString"];

    //when, then
    [action actionForResource:nil];
}

-(void)testWithStringUrlMime
{
    //given
    id<ERNAction> action = [ERNLogAction createWithLogString:@"logString"];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                                       mime:@"mime"];

    //when, then
    [action actionForResource:resource];
}

@end
