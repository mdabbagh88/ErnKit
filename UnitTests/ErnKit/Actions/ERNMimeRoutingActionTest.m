#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNMimeRoutingActionTest.h"
#import "ERNMimeRoutingAction.h"

@implementation ERNMimeRoutingActionTest

-(void)testNilMimesNilResource
{
    //given
    id<ERNAction> action = [ERNMimeRoutingAction createWithActions:nil];

    //when
    [action actionForResource:nil];
}

-(void)testNilMimesResource
{
    //given
    id<ERNAction> action = [ERNMimeRoutingAction createWithActions:nil];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                  mime:@"mime"];
    
    //when
    [action actionForResource:resource];
}

-(void)testMimesNilResource
{
    //given
    id<ERNAction> action = [ERNMimeRoutingAction createWithActions:nil];
    
    //when
    [action actionForResource:nil];
}

-(void)testMimesResource
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
    id<ERNAction> action = [ERNMimeRoutingAction createWithActions:mimes];
    
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
    id<ERNAction> action = [ERNMimeRoutingAction createWithActions:mimes];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                  mime:@"mime3"];
    
    //when
    [action actionForResource:resource];
    
    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testNoneMimesResource
{
    //given
    NSDictionary *mimes = @{@"mime1" : @"",
                            @"mime2" : @[]};
    id<ERNAction> action = [ERNMimeRoutingAction createWithActions:mimes];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url1"]
                                                  mime:@"mime1"];
    
    //when
    [action actionForResource:resource];
}

@end
