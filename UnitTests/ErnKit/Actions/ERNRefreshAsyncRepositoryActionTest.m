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
    [action actionForResource:nil];
}

-(void)testActionUrlMimeNilRepository
{
    //given
    id<ERNAction> action = [ERNRefreshAsyncRepositoryAction createWithRepository:nil];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                  mime:@"mime"];

    //when, then
    [action actionForResource:resource];
}

-(void)testActionNilUrlNilMimeRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncRepository)];
    [[mockRepository expect] refresh];
    id<ERNAction> action = [ERNRefreshAsyncRepositoryAction createWithRepository:mockRepository];

    //when
    [action actionForResource:nil];

    //then
    [mockRepository verify];
}

-(void)testActionUrlMimeRepository
{
    //given
    id mockRepository = [OCMockObject mockForProtocol:@protocol(ERNAsyncRepository)];
    [[mockRepository expect] refresh];
    id<ERNAction> action = [ERNRefreshAsyncRepositoryAction createWithRepository:mockRepository];
    ERNResource *resource = [ERNResource createWithUrl:[NSURL URLWithString:@"url"]
                                                  mime:@"mime"];

    //when
    [action actionForResource:resource];

    //then
    [mockRepository verify];
}

@end
