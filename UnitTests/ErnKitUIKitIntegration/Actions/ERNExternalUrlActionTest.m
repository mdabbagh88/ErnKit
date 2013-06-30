#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNExternalUrlActionTest.h"
#import "ERNExternalUrlAction.h"
#import "ERNActionTest.h"

@implementation ERNExternalUrlActionTest {
}

#pragma mark - ERNAction protocol tests

-(void)testActionProtocolWithNilApplication
{
    [ERNActionTest testAction:[ERNExternalUrlAction createWithApplication:nil]];
}

-(void)testActionProtocolWithApplication
{
    id mockApplication = [OCMockObject niceMockForClass:[UIApplication class]];
    [ERNActionTest testAction:[ERNExternalUrlAction createWithApplication:mockApplication]];
}

#pragma mark - class tests

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
