#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNUrlSchemeRoutingActionTest.h"
#import "ERNUrlSchemeRoutingAction.h"
#import "ERNActionTest.h"

@interface ERNUrlSchemeRoutingActionTest ()
@property (nonatomic) id<ERNAction> actionsAction;
@property (nonatomic) ERNResource *resource;
@property (nonatomic) id mockAction1;
@property (nonatomic) id mockAction2;
@end

@implementation ERNUrlSchemeRoutingActionTest {
}

#pragma mark - SenTestCase

-(void)setUp
{
    [self setResource:[ERNResource createWithUrl:[NSURL URLWithString:@"scheme2://host/path"]
                                            mime:@"mime"]];

    [self setMockAction1:[OCMockObject mockForProtocol:@protocol(ERNAction)]];
    [self setMockAction2:[OCMockObject mockForProtocol:@protocol(ERNAction)]];

    [self setActionsAction:
     [ERNUrlSchemeRoutingAction createWithActions:@{@"scheme1" : [self mockAction1],
                                                    @"scheme2" : [self mockAction2]}]];
}

-(void)tearDown
{
    [[self mockAction1] verify];
    [[self mockAction2] verify];
}

#pragma mark - ERNAction protocol tests

-(void)testProtocolNilActions
{
    [ERNActionTest testAction:[ERNUrlSchemeRoutingAction createWithActions:nil]];
}

-(void)testProtocolActions
{
    NSDictionary *actions = @{
                              @"scheme1" : [OCMockObject niceMockForProtocol:@protocol(ERNAction)],
                              @"scheme2" : [OCMockObject niceMockForProtocol:@protocol(ERNAction)]
                              };
    [ERNActionTest testAction:[ERNUrlSchemeRoutingAction createWithActions:actions]];
}

-(void)testProtocolNoActions
{
    NSDictionary *actions = @{
                              @"scheme1" : @"",
                              @"scheme2" : @[]
                              };
    [ERNActionTest testAction:[ERNUrlSchemeRoutingAction createWithActions:actions]];
}

#pragma mark - class tests

-(void)testSchemesResource
{
    //given
    [[[self mockAction2] expect] actionForResource:[self resource]];

    //when
    [[self actionsAction] actionForResource:[self resource]];
}

-(void)testSchemesUrlNonExistingHost
{
    //given
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"scheme3://host/path"]
                                                  mime:@"mime"];

    //when
    [[self actionsAction] actionForResource:resource];
}

@end
