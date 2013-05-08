#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNDefaultActionHandlerTest.h"
#import "ERNDefaultActionHandler.h"
#import "ERNAction.h"
#import "NSURL+ERNHelper.h"
#import "ERNUrlMimeFactory.h"
#import "ERNRepositoryStore.h"

@implementation ERNDefaultActionHandlerTest

-(void)testCreateWithNilActionNilObject
{
    //given
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil];

    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithActionNilObject
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction];

    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithNilActionNilUrlMimeFactoryNilObject
{
    //given
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                    urlMimeFactory:nil];
    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithActionNilUrlMimeFactoryNilObject
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                    urlMimeFactory:nil];
    //when
    [actionHandler actionForObject:nil];

    //then
    [mockAction verify];
}

-(void)testActionWithNilActionUrlMimeFactoryNilObject
{
    //given
    id mockUrlMimeFactory = [OCMockObject mockForProtocol:@protocol(ERNUrlMimeFactory)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                    urlMimeFactory:mockUrlMimeFactory];

    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithActionUrlMimeFactoryNilObject
{
    //given
    id mockUrlMimeFactory = [OCMockObject mockForProtocol:@protocol(ERNUrlMimeFactory)];
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                    urlMimeFactory:mockUrlMimeFactory];

    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithNilActionNilUrlMimeFactoryNilRepositoryStoreNilObject
{
    //given
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                    urlMimeFactory:nil
                                                                   repositoryStore:nil];

    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithActionNilUrlMimeFactoryNilRepositoryStoreNilObject
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                    urlMimeFactory:nil
                                                                   repositoryStore:nil];

    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithActionUrlMimeFactoryNilRepositoryStoreNilObject
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockUrlMimeFactory = [OCMockObject mockForProtocol:@protocol(ERNUrlMimeFactory)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                    urlMimeFactory:mockUrlMimeFactory
                                                                   repositoryStore:nil];

    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithActionUrlMimeFactoryRepositoryStoreNilObject
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockUrlMimeFactory = [OCMockObject mockForProtocol:@protocol(ERNUrlMimeFactory)];
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                    urlMimeFactory:mockUrlMimeFactory
                                                                   repositoryStore:mockRepositoryStore];

    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithNilActionUrlMimeFactoryRepositoryStoreNilObject
{
    //given
    id mockUrlMimeFactory = [OCMockObject mockForProtocol:@protocol(ERNUrlMimeFactory)];
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                    urlMimeFactory:mockUrlMimeFactory
                                                                   repositoryStore:mockRepositoryStore];

    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithNilActionNilUrlMimeFactoryRepositoryStoreNilObject
{
    //given
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                    urlMimeFactory:nil
                                                                   repositoryStore:mockRepositoryStore];

    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testActionWithActionNilUrlMimeFactoryRepositoryStoreNilObject
{
    //given
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                    urlMimeFactory:nil
                                                                   repositoryStore:mockRepositoryStore];

    //when, then
    [actionHandler actionForObject:nil];
}

-(void)testCreateWithNilAction
{
    //given
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil];

    //when
    [actionHandler actionForObject:mockObject];
}

-(void)testActionWithAction
{
    //given
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction expect] actionForUrl:[NSURL createNull]
                                 mime:@""];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction];

    //when
    [actionHandler actionForObject:mockObject];

    //then
    [mockAction verify];
}

-(void)testActionWithNilActionNilUrlMimeFactory
{
    //given
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                    urlMimeFactory:nil];
    //when
    [actionHandler actionForObject:mockObject];
}

-(void)testActionWithActionNilUrlMimeFactory
{
    //given
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction expect] actionForUrl:[NSURL createNull]
                                 mime:@""];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                    urlMimeFactory:nil];
    //when
    [actionHandler actionForObject:mockObject];

    //then
    [mockAction verify];
}

-(void)testActionWithNilActionUrlMimeFactory
{
    //given
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockUrlMimeFactory = [OCMockObject mockForProtocol:@protocol(ERNUrlMimeFactory)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                    urlMimeFactory:mockUrlMimeFactory];

    //when
    [actionHandler actionForObject:mockObject];

    //then
    [mockUrlMimeFactory verify];
}

-(void)testActionWithActionUrlMimeFactory
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedURL"];
    NSString *expectedMime = @"expectedMime";
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction expect] actionForUrl:expectedUrl
                                 mime:expectedMime];
    id mockUrlMimeFactory = [OCMockObject mockForProtocol:@protocol(ERNUrlMimeFactory)];
    [[[mockUrlMimeFactory expect] andReturn:expectedUrl] urlForObject:mockObject];
    [[[mockUrlMimeFactory expect] andReturn:expectedMime] mimeForObject:mockObject];
     id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                    urlMimeFactory:mockUrlMimeFactory];

    //when
    [actionHandler actionForObject:mockObject];

    //then
    [mockUrlMimeFactory verify];
    [mockAction verify];
}

-(void)testActionWithNilActionNilUrlMimeFactoryNilRepositoryStore
{
    //given
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                    urlMimeFactory:nil
                                                                   repositoryStore:nil];

    //when, then
    [actionHandler actionForObject:mockObject];
}

-(void)testActionWithActionNilUrlMimeFactoryNilRepositoryStore
{
    //given
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction expect] actionForUrl:[NSURL createNull]
                                 mime:@""];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                    urlMimeFactory:nil
                                                                   repositoryStore:nil];

    //when
    [actionHandler actionForObject:mockObject];

    //then
    [mockAction verify];
}

-(void)testActionWithActionUrlMimeFactoryNilRepositoryStore
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedURL"];
    NSString *expectedMime = @"expectedMime";
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction expect] actionForUrl:expectedUrl
                                 mime:expectedMime];
    id mockUrlMimeFactory = [OCMockObject mockForProtocol:@protocol(ERNUrlMimeFactory)];
    [[[mockUrlMimeFactory expect] andReturn:expectedUrl] urlForObject:mockObject];
    [[[mockUrlMimeFactory expect] andReturn:expectedMime] mimeForObject:mockObject];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                    urlMimeFactory:mockUrlMimeFactory
                                                                   repositoryStore:nil];

    //when
    [actionHandler actionForObject:mockObject];

    //then
    [mockAction verify];
    [mockUrlMimeFactory verify];
}

-(void)testActionWithActionUrlMimeFactoryRepositoryStore
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedURL"];
    NSString *expectedMime = @"expectedMime";
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction expect] actionForUrl:expectedUrl
                                 mime:expectedMime];
    id mockUrlMimeFactory = [OCMockObject mockForProtocol:@protocol(ERNUrlMimeFactory)];
    [[[mockUrlMimeFactory expect] andReturn:expectedUrl] urlForObject:mockObject];
    [[[mockUrlMimeFactory expect] andReturn:expectedMime] mimeForObject:mockObject];
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    [[mockRepositoryStore expect] storeUrl:expectedUrl
                                   forItem:mockObject];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                    urlMimeFactory:mockUrlMimeFactory
                                                                   repositoryStore:mockRepositoryStore];

    //when
    [actionHandler actionForObject:mockObject];

    //then
    [mockUrlMimeFactory verify];
    [mockAction verify];
    [mockRepositoryStore verify];
}

-(void)testActionWithNilActionUrlMimeFactoryRepositoryStore
{
    //given
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockUrlMimeFactory = [OCMockObject mockForProtocol:@protocol(ERNUrlMimeFactory)];
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                    urlMimeFactory:mockUrlMimeFactory
                                                                   repositoryStore:mockRepositoryStore];

    //when
    [actionHandler actionForObject:mockObject];
}

-(void)testActionWithNilActionNilUrlMimeFactoryRepositoryStore
{
    //given
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:nil
                                                                    urlMimeFactory:nil
                                                                   repositoryStore:mockRepositoryStore];

    //when
    [actionHandler actionForObject:mockObject];
}

-(void)testActionWithActionNilUrlMimeFactoryRepositoryStore
{
    //given
    NSURL *expectedUrl = [NSURL createNull];
    NSString *expectedMime = @"";
    id mockObject = [OCMockObject mockForProtocol:@protocol(NSObject)];
    id mockAction = [OCMockObject mockForProtocol:@protocol(ERNAction)];
    [[mockAction expect] actionForUrl:expectedUrl
                                 mime:expectedMime];
    id mockRepositoryStore = [OCMockObject mockForProtocol:@protocol(ERNRepositoryStore)];
    [[mockRepositoryStore expect] storeUrl:expectedUrl
                                   forItem:mockObject];

    id<ERNActionHandler> actionHandler = [ERNDefaultActionHandler createWithAction:mockAction
                                                                    urlMimeFactory:nil
                                                                   repositoryStore:mockRepositoryStore];

    //when
    [actionHandler actionForObject:mockObject];

    //then
    [mockAction verify];
    [mockRepositoryStore verify];
}

@end
