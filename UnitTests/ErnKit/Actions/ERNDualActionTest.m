#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNDualActionTest.h"
#import "ERNDualAction.h"
#import "NSURL+ERNHelper.h"
#import "ERNActionTest.h"

@interface ERNDualActionTest ()
@property (nonatomic) id mockFirstAction;
@property (nonatomic) id mockSecondAction;
@property (nonatomic) id niceMockAction;
@property (nonatomic) ERNResource *resource;
@end

@implementation ERNDualActionTest {
}

#pragma mark - SenTestCase

-(void)setUp
{
    [self setResource:[ERNResource createWithUrl:[NSURL URLWithString:@"url"] mime:@"mime"]];
    [self setNiceMockAction:[OCMockObject niceMockForProtocol:@protocol(ERNAction)]];
    [self setMockFirstAction:[OCMockObject mockForProtocol:@protocol(ERNAction)]];
    [self setMockSecondAction:[OCMockObject mockForProtocol:@protocol(ERNAction)]];
}

-(void)tearDown
{
    [[self mockFirstAction] verify];
    [[self mockSecondAction] verify];
    [[self niceMockAction] verify];
}

#pragma mark - ERNAction protocol tests

-(void)testActionProtocolNilFirstNilSecond
{
    [ERNActionTest testAction:[ERNDualAction createWithFirstAction:nil
                                                      secondAction:nil]];
}

-(void)testActionProtocolNilFirstSecond
{
    [ERNActionTest testAction:[ERNDualAction createWithFirstAction:[self niceMockAction]
                                                      secondAction:nil]];
}

-(void)testActionProtocolFirstNilSecond
{
    [ERNActionTest testAction:[ERNDualAction createWithFirstAction:nil
                                                      secondAction:[self niceMockAction]]];
}

-(void)testActionProtocolFirstSecond
{
    [ERNActionTest testAction:[ERNDualAction createWithFirstAction:[self niceMockAction]
                                                      secondAction:[self niceMockAction]]];
}

#pragma mark - class tests

-(void)testWithFirstNilSecondResource
{
    //given
    [[[self mockFirstAction] expect] actionForResource:[self resource]];
    id<ERNAction> action = [ERNDualAction createWithFirstAction:[self mockFirstAction]
                                                   secondAction:nil];

    //when
    [action actionForResource:[self resource]];
}

-(void)testWithNilFirstSecondResource
{
    //given
    [[[self mockSecondAction] expect] actionForResource:[self resource]];
    id<ERNAction> action = [ERNDualAction createWithFirstAction:nil
                                                   secondAction:[self mockSecondAction]];

    //when
    [action actionForResource:[self resource]];
}

-(void)testWithFirstSecondResource
{
    //given
    [[[self mockFirstAction] expect] actionForResource:[self resource]];
    [[[self mockSecondAction] expect] actionForResource:[self resource]];
    id<ERNAction> action = [ERNDualAction createWithFirstAction:[self mockFirstAction]
                                                   secondAction:[self mockSecondAction]];

    //when
    [action actionForResource:[self resource]];
}

@end
