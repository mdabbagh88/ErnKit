#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNMimeRoutingActionTest.h"
#import "ERNMimeRoutingAction.h"

@implementation ERNMimeRoutingActionTest

-(void)testNilMimesNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNMimeRoutingAction createWithActionsForMimes:nil];

    //when
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testNilMimesUrlNilMime
{
    //given
    id<ERNAction> action = [ERNMimeRoutingAction createWithActionsForMimes:nil];

    //when
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:nil];
}

-(void)testNilMimesNilUrlMime
{
    //given
    id<ERNAction> action = [ERNMimeRoutingAction createWithActionsForMimes:nil];

    //when
    [action actionForUrl:nil
                    mime:@"mime"];
}

-(void)testNilMimesUrlMime
{
    //given
    id<ERNAction> action = [ERNMimeRoutingAction createWithActionsForMimes:nil];

    //when
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:@"mime"];
}

-(void)testMimesNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNMimeRoutingAction createWithActionsForMimes:nil];

    //when
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testMimesUrlNilMime
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSDictionary *mimes = @{@"mime1" : mockAction1,
                            @"mime2" : mockAction2};
    id<ERNAction> action = [ERNMimeRoutingAction createWithActionsForMimes:mimes];

    //when
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:nil];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testMimesNilUrlMime
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSDictionary *mimes = @{@"mime1" : mockAction1,
                            @"mime2" : mockAction2};
    id<ERNAction> action = [ERNMimeRoutingAction createWithActionsForMimes:mimes];

    //when
    [action actionForUrl:nil
                    mime:@"mime1"];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testMimesUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime1";
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction1 expect] actionForUrl:expectedUrl
                                  mime:expectedMime];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSDictionary *mimes = @{expectedMime : mockAction1,
                            @"mime2" : mockAction2};
    id<ERNAction> action = [ERNMimeRoutingAction createWithActionsForMimes:mimes];

    //when
    [action actionForUrl:expectedUrl
                    mime:expectedMime];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testMimesUrlNonExistingMime
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSDictionary *mimes = @{@"mime1" : mockAction1,
                            @"mime2" : mockAction2};
    id<ERNAction> action = [ERNMimeRoutingAction createWithActionsForMimes:mimes];

    //when
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:@"mime3"];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testNoneMimesUrlMime
{
    //given
    NSDictionary *mimes = @{@"mime1" : @"",
                            @"mime2" : @[]};
    id<ERNAction> action = [ERNMimeRoutingAction createWithActionsForMimes:mimes];

    //when
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:@"mime1"];

}

@end
