#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNDualObjectActionTest.h"
#import "ERNDualObjectAction.h"
#import "ERNObjectActionTest.h"

@implementation ERNDualObjectActionTest {
}

#pragma mark - ERNObjectAction protocol tests

-(void)testObjectActionProtocolNilFirstObjectActionNilSecondObjectAction
{
    [ERNObjectActionTest testObjectAction:
     [ERNDualObjectAction createWithFirstObjectAction:nil
                                   secondObjectAction:nil]];
}

-(void)testObjectActionProtocolFirstObjectActionNilSecondObjectAction
{
    id mockFirstObjectAction = [OCMockObject niceMockForProtocol:@protocol(ERNObjectAction)];
    [ERNObjectActionTest testObjectAction:
     [ERNDualObjectAction createWithFirstObjectAction:mockFirstObjectAction
                                   secondObjectAction:nil]];
}

-(void)testObjectActionProtocolNilFirstObjectActionSecondObjectAction
{
    id mockSecondObjectAction = [OCMockObject niceMockForProtocol:@protocol(ERNObjectAction)];
    [ERNObjectActionTest testObjectAction:
     [ERNDualObjectAction createWithFirstObjectAction:nil
                                   secondObjectAction:mockSecondObjectAction]];
}

-(void)testObjectActionProtocolFirstObjectActionSecondObjectAction
{
    id mockFirstObjectAction = [OCMockObject niceMockForProtocol:@protocol(ERNObjectAction)];
    id mockSecondObjectAction = [OCMockObject niceMockForProtocol:@protocol(ERNObjectAction)];
    [ERNObjectActionTest testObjectAction:
     [ERNDualObjectAction createWithFirstObjectAction:mockFirstObjectAction
                                   secondObjectAction:mockSecondObjectAction]];
}

#pragma mark - class tests

-(void)testDualActionFirstObjectActionNilSecondObjectActionNilObject
{
    id mockFirstObjectAction = [OCMockObject mockForProtocol:@protocol(ERNObjectAction)];

    id<ERNObjectAction> objectAction =
    [ERNDualObjectAction createWithFirstObjectAction:mockFirstObjectAction
                                  secondObjectAction:nil];

    [objectAction actionForObject:nil];
}

-(void)testDualActionNilFirstObjectActionSecondObjectActionNilObject
{
    id mockSecondObjectAction = [OCMockObject mockForProtocol:@protocol(ERNObjectAction)];

    id<ERNObjectAction> objectAction =
    [ERNDualObjectAction createWithFirstObjectAction:nil
                                  secondObjectAction:mockSecondObjectAction];

    [objectAction actionForObject:nil];
}

-(void)testDualActionFirstObjectActionSecondObjectActionNilObject
{
    id mockFirstObjectAction = [OCMockObject mockForProtocol:@protocol(ERNObjectAction)];
    id mockSecondObjectAction = [OCMockObject mockForProtocol:@protocol(ERNObjectAction)];

    id<ERNObjectAction> objectAction =
    [ERNDualObjectAction createWithFirstObjectAction:mockFirstObjectAction
                                  secondObjectAction:mockSecondObjectAction];

    [objectAction actionForObject:nil];
}

-(void)testDualActionFirstObjectActionNilSecondObjectActionObject
{
    id mockObject = [NSObject new];
    id mockFirstObjectAction = [OCMockObject mockForProtocol:@protocol(ERNObjectAction)];
    [[mockFirstObjectAction expect] actionForObject:mockObject];

    id<ERNObjectAction> objectAction =
    [ERNDualObjectAction createWithFirstObjectAction:mockFirstObjectAction
                                  secondObjectAction:nil];

    [objectAction actionForObject:mockObject];
    [mockFirstObjectAction verify];
}

-(void)testDualActionNilFirstObjectActionSecondObjectActionObject
{
    id mockObject = [NSObject new];
    id mockSecondObjectAction = [OCMockObject mockForProtocol:@protocol(ERNObjectAction)];
    [[mockSecondObjectAction expect] actionForObject:mockObject];

    id<ERNObjectAction> objectAction =
    [ERNDualObjectAction createWithFirstObjectAction:nil
                                  secondObjectAction:mockSecondObjectAction];

    [objectAction actionForObject:mockObject];
    [mockSecondObjectAction verify];
}

-(void)testDualActionFirstObjectActionSecondObjectActionObject
{
    id mockObject = [NSObject new];
    id mockFirstObjectAction = [OCMockObject mockForProtocol:@protocol(ERNObjectAction)];
    id mockSecondObjectAction = [OCMockObject mockForProtocol:@protocol(ERNObjectAction)];
    [[mockFirstObjectAction expect] actionForObject:mockObject];
    [[mockSecondObjectAction expect] actionForObject:mockObject];

    id<ERNObjectAction> objectAction =
    [ERNDualObjectAction createWithFirstObjectAction:mockFirstObjectAction
                                  secondObjectAction:mockSecondObjectAction];

    [objectAction actionForObject:mockObject];
    [mockFirstObjectAction verify];
    [mockSecondObjectAction verify];
}

@end
