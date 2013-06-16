#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNDualActionTest.h"
#import "ERNDualAction.h"
#import "NSURL+ERNHelper.h"

@implementation ERNDualActionTest

-(void)testWithNilFirstNilSecondNilResource
{
    //given
    id <ERNAction> action = [ERNDualAction createWithFirstAction:nil
                                                    secondAction:nil];
    
    //when, then
    [action actionForResource:nil];
}

-(void)testWithNilFirstNilSecondResource
{
    //given
    id <ERNAction> action = [ERNDualAction createWithFirstAction:nil
                                                    secondAction:nil];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL ERN_createNull]
                                                  mime:@"mime"];
    
    //when, then
    [action actionForResource:resource];
}

-(void)testWithFirstNilSecondNilResource
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:mockAction1
                                                    secondAction:nil];
    
    //when
    [action actionForResource:nil];
    
    //then
    [mockAction1 verify];
}

-(void)testWithFirstNilSecondResource
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction1 expect] actionForResource:resource];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:mockAction1
                                                    secondAction:nil];
    
    //when
    [action actionForResource:resource];
    
    //then
    [mockAction1 verify];
}

-(void)testWithNilFirstSecondNilResource
{
    //given
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:nil
                                                    secondAction:mockAction2];
    
    //when
    [action actionForResource:nil];
    
    //then
    [mockAction2 verify];
}

-(void)testWithNilFirstSecondResource
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction2 expect] actionForResource:resource];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:nil
                                                    secondAction:mockAction2];
    
    //when
    [action actionForResource:resource];
    
    //then
    [mockAction2 verify];
}

-(void)testWithFirstSecondNilResource
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:mockAction1
                                                    secondAction:mockAction2];
    
    //when
    [action actionForResource:nil];
    
    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testWithFirstSecondResource
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *resource = [ERNResource createWithUrl:expectedUrl
                                                  mime:expectedMime];
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction1 expect] actionForResource:resource];
    [[mockAction2 expect] actionForResource:resource];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:mockAction1
                                                    secondAction:mockAction2];
    
    //when
    [action actionForResource:resource];
    
    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

@end
