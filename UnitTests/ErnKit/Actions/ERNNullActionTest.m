#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullActionTest.h"
#import "ERNNullAction.h"

@implementation ERNNullActionTest

-(void)testSingleton
{
    //given, when
    id<ERNAction> action1 = [ERNNullAction create];
    id<ERNAction> action2 = [ERNNullAction create];

    //then
    assertThat(action1, equalTo(action2));
}

-(void)testActionNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNNullAction create];

    //when, then
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testActionUrlNilMime
{
    //given
    id<ERNAction> action = [ERNNullAction create];

    //when, then
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:nil];
}

-(void)testActionNilUrlMime
{
    //given
    id<ERNAction> action = [ERNNullAction create];

    //when, then
    [action actionForUrl:nil
                    mime:@"mime"];
}

-(void)testActionUrlMime
{
    //given
    id<ERNAction> action = [ERNNullAction create];

    //when, then
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:@"mime"];
}

@end
