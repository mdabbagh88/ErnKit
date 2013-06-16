#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNUrlSchemeRoutingActionTest.h"
#import "ERNUrlSchemeRoutingAction.h"

@implementation ERNUrlSchemeRoutingActionTest

-(void)testNilSchemesNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNUrlSchemeRoutingAction createWithActions:nil];

    //when
    [action actionForResource:nil];
}

-(void)testNilSchemesUrlMime
{
    //given
    id<ERNAction> action = [ERNUrlSchemeRoutingAction createWithActions:nil];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"http://host/path"]
                                                  mime:@"mime"];

    //when
    [action actionForResource:resource];
}

-(void)testSchemesNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNUrlSchemeRoutingAction createWithActions:nil];

    //when
    [action actionForResource:nil];
}

-(void)testSchemesUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"scheme1://host/path"];
    NSString *expectedScheme = @"scheme1";
    NSString *expectedMime = @"mime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction1 expect] actionForResource:resource];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSDictionary *schemes = @{expectedScheme : mockAction1,
                              @"scheme2" : mockAction2};
    id<ERNAction> action = [ERNUrlSchemeRoutingAction createWithActions:schemes];

    //when
    [action actionForResource:resource];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testSchemesUrlNonExistingHost
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSDictionary *schemes = @{@"scheme1" : mockAction1,
                              @"scheme2" : mockAction2};
    id<ERNAction> action = [ERNUrlSchemeRoutingAction createWithActions:schemes];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"scheme3://host/path"]
                                                  mime:@"mime"];

    //when
    [action actionForResource:resource];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testNoneSchemesUrlMime
{
    //given
    NSDictionary *hosts = @{@"scheme1" : @"",
                            @"scheme2" : @[]};
    id<ERNAction> action = [ERNUrlSchemeRoutingAction createWithActions:hosts];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"scheme://host/path"]
                                                  mime:@"mime"];

    //when
    [action actionForResource:resource];
    
}

@end
