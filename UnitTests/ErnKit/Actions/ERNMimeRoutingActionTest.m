#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNMimeRoutingActionTest.h"
#import "ERNMimeRoutingAction.h"
#import "ERNActionTest.h"

@interface ERNMimeRoutingActionTest ()
@property (nonatomic) id<ERNAction> mimesMimeRoutingAction;
@property (nonatomic) id mockAction1;
@property (nonatomic) id mockAction2;
@end

@implementation ERNMimeRoutingActionTest {
}

#pragma mark - SenTestCase

-(void)setUp
{
    [self setMockAction1:[OCMockObject mockForProtocol:@protocol(ERNAction)]];
    [self setMockAction2:[OCMockObject mockForProtocol:@protocol(ERNAction)]];
    [self setMimesMimeRoutingAction:[ERNMimeRoutingAction createWithActions:
                                     @{@"mime1" : [self mockAction1],
                                       @"mime2" : [self mockAction2]
                                       }]];
}

-(void)tearDown
{
    [[self mockAction1] verify];
    [[self mockAction2] verify];
}

#pragma mark - ERNAction protocol tests

-(void)testActionProtocolNilActions
{
    [ERNActionTest testAction:[ERNMimeRoutingAction createWithActions:nil]];
}

-(void)testActionProtocolActions
{
    id niceMockAction = [OCMockObject niceMockForProtocol:@protocol(ERNAction)];
    [ERNActionTest testAction:
     [ERNMimeRoutingAction createWithActions:@{@"mime1" : niceMockAction,
                                               @"mime2" : niceMockAction}]];
}

-(void)testActionProtocolNonActions
{
    [ERNActionTest testAction:
     [ERNMimeRoutingAction createWithActions:@{@"mime1" : @"",
                                               @"mime2" : @[]}]];
}

#pragma mark - class tests

-(void)testMimesResource
{
    //given
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"] mime:@"mime2"];
    [[[self mockAction2] expect] actionForResource:resource];

    //when
    [[self mimesMimeRoutingAction] actionForResource:resource];
}

-(void)testMimesUrlNonExistingMime
{
    //given
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                  mime:@"mime3"];

    //when
    [[self mimesMimeRoutingAction] actionForResource:resource];
}

@end
