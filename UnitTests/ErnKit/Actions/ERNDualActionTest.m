#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNDualActionTest.h"
#import "ERNDualAction.h"
#import "NSURL+ERNHelper.h"

@implementation ERNDualActionTest

-(void)testWithNilFirstNilSecondNilUrlNilMime
{
    //given
    id <ERNAction> action = [ERNDualAction createWithFirstAction:nil
                                                    secondAction:nil];

    //when, then
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testWithNilFirstNilSecondUrlNilMime
{
    //given
    id <ERNAction> action = [ERNDualAction createWithFirstAction:nil
                                                    secondAction:nil];

    //when, then
    [action actionForUrl:[NSURL createNull]
                    mime:nil];
}

-(void)testWithNilFirstNilSecondNilUrlMime
{
    //given
    id <ERNAction> action = [ERNDualAction createWithFirstAction:nil
                                                    secondAction:nil];

    //when, then
    [action actionForUrl:nil
                    mime:@"mime"];
}

-(void)testWithNilFirstNilSecondUrlMime
{
    //given
    id <ERNAction> action = [ERNDualAction createWithFirstAction:nil
                                                    secondAction:nil];

    //when, then
    [action actionForUrl:[NSURL createNull]
                    mime:@"mime"];
}

-(void)testWithFirstNilSecondNilUrlNilMime
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:mockAction1
                                                    secondAction:nil];

    //when
    [action actionForUrl:nil
                    mime:nil];

    //then
    [mockAction1 verify];
}

-(void)testWithFirstNilSecondUrlNilMime
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:mockAction1
                                                    secondAction:nil];

    //when
    [action actionForUrl:[NSURL createNull]
                    mime:nil];

    //then
    [mockAction1 verify];
}

-(void)testWithFirstNilSecondNilUrlMime
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:mockAction1
                                                    secondAction:nil];

    //when
    [action actionForUrl:nil
                    mime:@"mime"];

    //then
    [mockAction1 verify];
}

-(void)testWithFirstNilSecondUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction1 expect] actionForUrl:expectedUrl
                                  mime:expectedMime];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:mockAction1
                                                    secondAction:nil];

    //when
    [action actionForUrl:expectedUrl
                    mime:expectedMime];

    //then
    [mockAction1 verify];
}

-(void)testWithNilFirstSecondNilUrlNilMime
{
    //given
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:nil
                                                    secondAction:mockAction2];

    //when
    [action actionForUrl:nil
                    mime:nil];

    //then
    [mockAction2 verify];
}

-(void)testWithNilFirstSecondUrlNilMime
{
    //given
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:nil
                                                    secondAction:mockAction2];

    //when
    [action actionForUrl:[NSURL createNull]
                    mime:nil];

    //then
    [mockAction2 verify];
}

-(void)testWithNilFirstSecondNilUrlMime
{
    //given
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:nil
                                                    secondAction:mockAction2];

    //when
    [action actionForUrl:nil
                    mime:@"mime"];

    //then
    [mockAction2 verify];
}

-(void)testWithNilFirstSecondUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction2 expect] actionForUrl:expectedUrl
                                  mime:expectedMime];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:nil
                                                    secondAction:mockAction2];

    //when
    [action actionForUrl:expectedUrl
                    mime:expectedMime];

    //then
    [mockAction2 verify];
}

-(void)testWithFirstSecondNilUrlNilMime
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:mockAction1
                                                    secondAction:mockAction2];

    //when
    [action actionForUrl:nil
                    mime:nil];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testWithFirstSecondUrlNilMime
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:mockAction1
                                                    secondAction:mockAction2];

    //when
    [action actionForUrl:[NSURL createNull]
                    mime:nil];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testWithFirstSecondNilUrlMime
{
    //given
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:mockAction1
                                                    secondAction:mockAction2];

    //when
    [action actionForUrl:nil
                    mime:@"mime"];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

-(void)testWithFirstSecondUrlMime
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedUrl"];
    NSString *expectedMime = @"expectedMime";
    id mockAction1 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockAction2 = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction1 expect] actionForUrl:expectedUrl
                                  mime:expectedMime];
    [[mockAction2 expect] actionForUrl:expectedUrl
                                  mime:expectedMime];
    id <ERNAction> action = [ERNDualAction createWithFirstAction:mockAction1
                                                    secondAction:mockAction2];

    //when
    [action actionForUrl:expectedUrl
                    mime:expectedMime];

    //then
    [mockAction1 verify];
    [mockAction2 verify];
}

@end
