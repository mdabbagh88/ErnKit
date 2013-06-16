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
    [action actionForResource:nil];
}

-(void)testNilMimesUrlMime
{
    //given
    id<ERNAction> action = [ERNMimeRoutingAction createWithActionsForMimes:nil];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                  mime:@"mime"];

    //when
    [action actionForResource:resource];
}

-(void)testMimesNilUrlNilMime
{
    //given
    id<ERNAction> action = [ERNMimeRoutingAction createWithActionsForMimes:nil];

    //when
    [action actionForResource:nil];
}

-(void)testMimesUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    NSString *expectedMime = @"mime1";
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    [[mockAction1 expect] actionForResource:resource];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    NSDictionary *mimes = @{expectedMime : mockAction1,
                            @"mime2" : mockAction2};
    id<ERNAction> action = [ERNMimeRoutingAction createWithActionsForMimes:mimes];

    //when
    [action actionForResource:resource];

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
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                  mime:@"mime3"];

    //when
    [action actionForResource:resource];

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
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url1"]
                                                  mime:@"mime1"];

    //when
    [action actionForResource:resource];
}

@end
