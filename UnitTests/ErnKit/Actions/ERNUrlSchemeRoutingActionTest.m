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
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testNilSchemesUrlNilMime
{
    //given
    id<ERNAction> action = [ERNUrlSchemeRoutingAction createWithActions:nil];

    //when
    [action actionForUrl:[NSURL URLWithString:@"http://host/path"]
                    mime:nil];
}

-(void)testNilSchemesNilUrlMime
{
    //given
    id<ERNAction> action = [ERNUrlSchemeRoutingAction createWithActions:nil];

    //when
    [action actionForUrl:nil
                    mime:@"mime"];
}

-(void)testNilSchemesUrlMime
{
    //given
    id<ERNAction> action = [ERNUrlSchemeRoutingAction createWithActions:nil];

    //when
    [action actionForUrl:[NSURL URLWithString:@"http://host/path"]
                    mime:@"mime"];
}

-(void)testSchemesNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNUrlSchemeRoutingAction createWithActions:nil];

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
    id<ERNAction> action = [ERNUrlSchemeRoutingAction createWithActions:schemes];

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
    id<ERNAction> action = [ERNUrlSchemeRoutingAction createWithActions:schemes];

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
    id<ERNAction> action = [ERNUrlSchemeRoutingAction createWithActions:schemes];

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
    id<ERNAction> action = [ERNUrlSchemeRoutingAction createWithActions:schemes];

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
    id<ERNAction> action = [ERNUrlSchemeRoutingAction createWithActions:hosts];

    //when
    [action actionForUrl:[NSURL URLWithString:@"scheme://host/path"]
                    mime:@"mime"];
    
}

@end
