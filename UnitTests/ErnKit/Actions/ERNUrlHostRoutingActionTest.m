#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNUrlHostRoutingActionTest.h"
#import "ERNUrlHostRoutingAction.h"

@implementation ERNUrlHostRoutingActionTest

-(void)testNilHostsNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNUrlHostRoutingAction createWithActions:nil];

    //when
    [action actionForResource:nil];
}

-(void)testNilHostsUrlMime
{
    //given
    id<ERNAction> action = [ERNUrlHostRoutingAction createWithActions:nil];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"http://host/path"]
                                                  mime:@"mime"];

    //when
    [action actionForResource:resource];
}

-(void)testHostsNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNUrlHostRoutingAction createWithActions:nil];

    //when
    [action actionForResource:nil];
}

-(void)testHostsUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"http://host1/path"];
    NSString *expectedHost = @"host1";
    NSString *expectedMime = @"mime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction1 expect] actionForResource:resource];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSDictionary *hosts = @{expectedHost : mockAction1,
                            @"host2" : mockAction2};
    id<ERNAction> action = [ERNUrlHostRoutingAction createWithActions:hosts];

    //when
    [action actionForResource:resource];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testHostsUrlNonExistingHost
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSDictionary *hosts = @{@"host1" : mockAction1,
                            @"host2" : mockAction2};
    id<ERNAction> action = [ERNUrlHostRoutingAction createWithActions:hosts];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"http://host3/path"]
                                                  mime:@"mime"];

    //when
    [action actionForResource:resource];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testNoneHostsUrlMime
{
    //given
    NSDictionary *hosts = @{@"host1" : @"",
                            @"host2" : @[]};
    id<ERNAction> action = [ERNUrlHostRoutingAction createWithActions:hosts];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"http://host/path"]
                                                  mime:@"mime"];

    //when
    [action actionForResource:resource];
}

@end
