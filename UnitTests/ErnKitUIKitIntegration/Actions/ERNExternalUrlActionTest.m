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
    [action actionForResource:nil];
}

-(void)testActionNilApplicationUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id<ERNAction> action = [ERNExternalUrlAction createWithApplication:nil];

    //when, then
    [action actionForResource:resource];
}

-(void)testActionApplicationNilUrlNilMime
{
    //given
    id mockApplication = [OCMockObject mockForClass:[UIApplication class]];
    id<ERNAction> action = [ERNExternalUrlAction createWithApplication:mockApplication];

    //when
    [action actionForResource:nil];

    //then
    [mockApplication verify];
}

-(void)testActionApplicationUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id mockApplication = [OCMockObject mockForClass:[UIApplication class]];
    [[mockApplication expect] openURL:expectedUrl];
    id<ERNAction> action = [ERNExternalUrlAction createWithApplication:mockApplication];

    //when
    [action actionForResource:resource];

    //then
    [mockApplication verify];
}

@end
