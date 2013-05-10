#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNExternalUrlActionTest.h"
#import "ERNExternalUrlAction.h"

@implementation ERNExternalUrlActionTest

-(void)testActionNilApplicationNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNExternalUrlAction createWithApplication:nil];

    //when, then
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testActionNilApplicationUrlNilMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    id<ERNAction> action = [ERNExternalUrlAction createWithApplication:nil];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:nil];
}

-(void)testActionNilApplicationNilUrlMime
{
    //given
    NSString *expectedMime = @"expectedMime";
    id<ERNAction> action = [ERNExternalUrlAction createWithApplication:nil];

    //when, then
    [action actionForUrl:nil
                    mime:expectedMime];
}

-(void)testActionNilApplicationUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    id<ERNAction> action = [ERNExternalUrlAction createWithApplication:nil];

    //when, then
    [action actionForUrl:expectedUrl
                    mime:expectedMime];
}

-(void)testActionApplicationNilUrlNilMime
{
    //given
    id mockApplication = [OCMockObject mockForClass:[UIApplication class]];
    id<ERNAction> action = [ERNExternalUrlAction createWithApplication:mockApplication];

    //when
    [action actionForUrl:nil
                    mime:nil];

    //then
    [mockApplication verify];
}

-(void)testActionApplicationUrlNilMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    id mockApplication = [OCMockObject mockForClass:[UIApplication class]];
    [[mockApplication expect] openURL:expectedUrl];
    id<ERNAction> action = [ERNExternalUrlAction createWithApplication:mockApplication];

    //when
    [action actionForUrl:expectedUrl
                    mime:nil];

    //then
    [mockApplication verify];
}

-(void)testActionApplicationNilUrlMime
{
    //given
    NSString *expectedMime = @"expectedMime";
    id mockApplication = [OCMockObject mockForClass:[UIApplication class]];
    id<ERNAction> action = [ERNExternalUrlAction createWithApplication:mockApplication];

    //when
    [action actionForUrl:nil
                    mime:expectedMime];

    //then
    [mockApplication verify];
}

-(void)testActionApplicationUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    id mockApplication = [OCMockObject mockForClass:[UIApplication class]];
    [[mockApplication expect] openURL:expectedUrl];
    id<ERNAction> action = [ERNExternalUrlAction createWithApplication:mockApplication];

    //when
    [action actionForUrl:expectedUrl
                    mime:expectedMime];

    //then
    [mockApplication verify];
}

@end
