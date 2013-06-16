#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNExternalUrlActionTest.h"
#import "ERNExternalUrlAction.h"

@implementation ERNExternalUrlActionTest

-(void)testActionNilApplicationNilResource
{
    //given
    id<ERNAction> action = [ERNExternalUrlAction createWithApplication:nil];

    //when, then
    [action actionForResource:nil];
}

-(void)testActionNilApplicationResource
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

-(void)testActionApplicationNilResource
{
    //given
    id mockApplication = [OCMockObject mockForClass:[UIApplication class]];
    id<ERNAction> action = [ERNExternalUrlAction createWithApplication:mockApplication];

    //when
    [action actionForResource:nil];

    //then
    [mockApplication verify];
}

-(void)testActionApplicationResource
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
