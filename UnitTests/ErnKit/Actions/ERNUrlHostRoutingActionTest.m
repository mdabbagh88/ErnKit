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
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testNilHostsUrlNilMime
{
    //given
    id<ERNAction> action = [ERNUrlHostRoutingAction createWithActions:nil];

    //when
    [action actionForUrl:[NSURL URLWithString:@"http://host/path"]
                    mime:nil];
}

-(void)testNilHostsNilUrlMime
{
    //given
    id<ERNAction> action = [ERNUrlHostRoutingAction createWithActions:nil];

    //when
    [action actionForUrl:nil
                    mime:@"mime"];
}

-(void)testNilHostsUrlMime
{
    //given
    id<ERNAction> action = [ERNUrlHostRoutingAction createWithActions:nil];

    //when
    [action actionForUrl:[NSURL URLWithString:@"http://host/path"]
                    mime:@"mime"];
}

-(void)testHostsNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNUrlHostRoutingAction createWithActions:nil];

    //when
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testHostsUrlNilMime
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSDictionary *hosts = @{@"host1" : mockAction1,
                            @"host2" : mockAction2};
    id<ERNAction> action = [ERNUrlHostRoutingAction createWithActions:hosts];

    //when
    [action actionForUrl:[NSURL URLWithString:@"http://host1/path"]
                    mime:nil];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testHostsNilUrlMime
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSDictionary *hosts = @{@"host1" : mockAction1,
                            @"host2" : mockAction2};
    id<ERNAction> action = [ERNUrlHostRoutingAction createWithActions:hosts];

    //when
    [action actionForUrl:nil
                    mime:@"mime"];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testHostsUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"http://host1/path"];
    NSString *expectedHost = @"host1";
    NSString *expectedMime = @"mime";
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction1 expect] actionForUrl:expectedUrl
                                  mime:expectedMime];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSDictionary *hosts = @{expectedHost : mockAction1,
                            @"host2" : mockAction2};
    id<ERNAction> action = [ERNUrlHostRoutingAction createWithActions:hosts];

    //when
    [action actionForUrl:expectedUrl
                    mime:expectedMime];

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

    //when
    [action actionForUrl:[NSURL URLWithString:@"http://host3/path"]
                    mime:@"mime"];

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

    //when
    [action actionForUrl:[NSURL URLWithString:@"http://host/path"]
                    mime:@"mime"];

}

@end
