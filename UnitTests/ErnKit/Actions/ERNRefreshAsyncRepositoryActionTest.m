#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNRefreshAsyncRepositoryActionTest.h"
#import "ERNRefreshAsyncRepositoryAction.h"
#import "ERNAsyncRepository.h"

@implementation ERNRefreshAsyncRepositoryActionTest

-(void)testActionNilUrlNilMimeNilRepository
{
    //given
    id<ERNAction> action = [ERNRefreshAsyncRepositoryAction createWithRepository:nil];

    //when, then
    [action actionForUrl:nil
                    mime:nil];
}

-(void)testActionUrlNilMimeNilRepository
{
    //given
    id<ERNAction> action = [ERNRefreshAsyncRepositoryAction createWithRepository:nil];

    //when, then
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:nil];
}

-(void)testActionNilUrlMimeNilRepository
{
    //given
    id<ERNAction> action = [ERNRefreshAsyncRepositoryAction createWithRepository:nil];

    //when, then
    [action actionForUrl:nil
                    mime:@"mime"];
}

-(void)testActionUrlMimeNilRepository
{
    //given
    id<ERNAction> action = [ERNRefreshAsyncRepositoryAction createWithRepository:nil];

    //when, then
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:@"mime"];
}

-(void)testActionNilUrlNilMimeRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncRepository)];
    [[mockRepository expect] refresh];
    id<ERNAction> action = [ERNRefreshAsyncRepositoryAction createWithRepository:mockRepository];

    //when
    [action actionForUrl:nil
                    mime:nil];

    //then
    [mockRepository verify];
}

-(void)testActionUrlNilMimeRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncRepository)];
    [[mockRepository expect] refresh];
    id<ERNAction> action = [ERNRefreshAsyncRepositoryAction createWithRepository:mockRepository];

    //when
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:nil];

    //then
    [mockRepository verify];
}

-(void)testActionNilUrlMimeRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncRepository)];
    [[mockRepository expect] refresh];
    id<ERNAction> action = [ERNRefreshAsyncRepositoryAction createWithRepository:mockRepository];

    //when
    [action actionForUrl:nil
                    mime:@"mime"];

    //then
    [mockRepository verify];
}

-(void)testActionUrlMimeRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncRepository)];
    [[mockRepository expect] refresh];
    id<ERNAction> action = [ERNRefreshAsyncRepositoryAction createWithRepository:mockRepository];

    //when
    [action actionForUrl:[NSURL URLWithString:@"url"]
                    mime:@"mime"];

    //then
    [mockRepository verify];
}

@end
