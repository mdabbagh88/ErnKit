#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNUrlRoutingActionTest.h"
#import "ERNUrlRoutingAction.h"

@implementation ERNUrlRoutingActionTest

-(void)testNilHostsNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForHosts:nil];

    //when
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testNilHostsUrlNilMime
{
    //given
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForHosts:nil];

    //when
    [action actionForUrl:[NSURL URLWithString:@"http://host/path"]
                    mime:nil];
}

-(void)testNilHostsNilUrlMime
{
    //given
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForHosts:nil];

    //when
    [action actionForUrl:nil
                    mime:@"mime"];
}

-(void)testNilHostsUrlMime
{
    //given
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForHosts:nil];

    //when
    [action actionForUrl:[NSURL URLWithString:@"http://host/path"]
                    mime:@"mime"];
}

-(void)testHostsNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForHosts:nil];

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
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForHosts:hosts];

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
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForHosts:hosts];

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
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForHosts:hosts];

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
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForHosts:hosts];

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
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForHosts:hosts];

    //when
    [action actionForUrl:[NSURL URLWithString:@"http://host/path"]
                    mime:@"mime"];
    
}

-(void)testNilSchemesNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForSchemes:nil];

    //when
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testNilSchemesUrlNilMime
{
    //given
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForSchemes:nil];

    //when
    [action actionForUrl:[NSURL URLWithString:@"http://host/path"]
                    mime:nil];
}

-(void)testNilSchemesNilUrlMime
{
    //given
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForSchemes:nil];

    //when
    [action actionForUrl:nil
                    mime:@"mime"];
}

-(void)testNilSchemesUrlMime
{
    //given
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForSchemes:nil];

    //when
    [action actionForUrl:[NSURL URLWithString:@"http://host/path"]
                    mime:@"mime"];
}

-(void)testSchemesNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForSchemes:nil];

    //when
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testSchemesUrlNilMime
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSDictionary *schemes = @{@"scheme1" : mockAction1,
                            @"scheme2" : mockAction2};
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForSchemes:schemes];

    //when
    [action actionForUrl:[NSURL URLWithString:@"scheme1://host/path"]
                    mime:nil];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testSchemesNilUrlMime
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSDictionary *schemes = @{@"scheme1" : mockAction1,
                              @"scheme2" : mockAction2};
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForSchemes:schemes];

    //when
    [action actionForUrl:nil
                    mime:@"mime"];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testSchemesUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"scheme1://host/path"];
    NSString *expectedScheme = @"scheme1";
    NSString *expectedMime = @"mime";
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction1 expect] actionForUrl:expectedUrl
                                  mime:expectedMime];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSDictionary *schemes = @{expectedScheme : mockAction1,
                              @"scheme2" : mockAction2};
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForSchemes:schemes];

    //when
    [action actionForUrl:expectedUrl
                    mime:expectedMime];

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
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForSchemes:schemes];

    //when
    [action actionForUrl:[NSURL URLWithString:@"scheme3://host/path"]
                    mime:@"mime"];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testNoneSchemesUrlMime
{
    //given
    NSDictionary *hosts = @{@"scheme1" : @"",
                            @"scheme2" : @[]};
    id<ERNAction> action = [ERNUrlRoutingAction createWithActionsForSchemes:hosts];

    //when
    [action actionForUrl:[NSURL URLWithString:@"scheme://host/path"]
                    mime:@"mime"];
    
}

@end
