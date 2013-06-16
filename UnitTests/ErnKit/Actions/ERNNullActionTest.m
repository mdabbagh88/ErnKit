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
    assertThat(action1, notNilValue());
    assertThat(action1, equalTo(action2));
}

-(void)testActionNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNNullAction create];

    //when, then
    [action actionForResource:nil];
}

-(void)testActionUrlMime
{
    //given
    id<ERNAction> action = [ERNNullAction create];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                  mime:@"mime"];

    //when, then
    [action actionForResource:resource];
}

@end
