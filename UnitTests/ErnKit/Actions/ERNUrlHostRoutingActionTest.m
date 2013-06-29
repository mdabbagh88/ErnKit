#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNUrlHostRoutingActionTest.h"
#import "ERNUrlHostRoutingAction.h"
#import "ERNActionTest.h"

@interface ERNUrlHostRoutingActionTest ()
@property (nonatomic) id<ERNAction> actionsAction;
@property (nonatomic) ERNResource *resource;
@property (nonatomic) id mockAction1;
@property (nonatomic) id mockAction2;
@end

@implementation ERNUrlHostRoutingActionTest {
}

#pragma mark - SenTestCase

-(void)setUp
{
    [self setResource:[ERNResource createWithUrl:[NSURL URLWithString:@"scheme://host2/path"]
                                            mime:@"mime"]];

    [self setMockAction1:[OCMockObject mockForProtocol:@protocol(ERNAction)]];
    [self setMockAction2:[OCMockObject mockForProtocol:@protocol(ERNAction)]];

    [self setActionsAction:
     [ERNUrlHostRoutingAction createWithActions:@{@"host1" : [self mockAction1],
                                                  @"host2" : [self mockAction2]}]];
}

-(void)tearDown
{
    [[self mockAction1] verify];
    [[self mockAction2] verify];
}

#pragma mark - ERNAction protocol tests

-(void)testProtocolNilActions
{
    [ERNActionTest testAction:[ERNUrlHostRoutingAction createWithActions:nil]];
}

-(void)testProtocolActions
{
    NSDictionary *actions = @{
                              @"host1" : [OCMockObject niceMockForProtocol:@protocol(ERNAction)],
                              @"host2" : [OCMockObject niceMockForProtocol:@protocol(ERNAction)]
                              };
    [ERNActionTest testAction:[ERNUrlHostRoutingAction createWithActions:actions]];
}

-(void)testProtocolNoActions
{
    NSDictionary *actions = @{
                              @"host1" : @"",
                              @"host2" : @[]
                              };
    [ERNActionTest testAction:[ERNUrlHostRoutingAction createWithActions:actions]];
}

#pragma mark - class tests

-(void)testHostsResource
{
    //given
    [[[self mockAction2] expect] actionForResource:[self resource]];

    //when
    [[self actionsAction] actionForResource:[self resource]];
}

-(void)testHostsUrlNonExistingHost
{
    //given
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"http://host3/path"]
                                                  mime:@"mime"];

    //when
    [[self actionsAction] actionForResource:resource];
}

@end
