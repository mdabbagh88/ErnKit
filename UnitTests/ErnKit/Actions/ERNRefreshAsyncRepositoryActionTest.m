#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNRefreshAsyncRepositoryActionTest.h"
#import "ERNRefreshAsyncRepositoryAction.h"
#import "ERNAsyncRepository.h"
#import "ERNActionTest.h"

@interface ERNRefreshAsyncRepositoryActionTest ()
@property (nonatomic) id<ERNAction> repositoryAction;
@property (nonatomic) id mockRepository;
@end

@implementation ERNRefreshAsyncRepositoryActionTest {
}

#pragma mark - SenTestCase

-(void)setUp
{
    [self setMockRepository:[OCMockObject mockForProtocol:@protocol(ERNAsyncRepository)]];
    [self setRepositoryAction:
     [ERNRefreshAsyncRepositoryAction createWithRepository:[self mockRepository]]];
}

-(void)tearDown
{
    [[self mockRepository] verify];
}

#pragma mark - ERNAction protocol tests

-(void)testActionProtocolNilRepository
{
    [ERNActionTest testAction:[ERNRefreshAsyncRepositoryAction createWithRepository:nil]];
}

-(void)testActionProtocolRepository
{
    [ERNActionTest testAction:
     [ERNRefreshAsyncRepositoryAction createWithRepository:
      [OCMockObject niceMockForProtocol:@protocol(ERNAsyncRepository)]]];
}

#pragma mark - class tests

-(void)testActionNilResourceRepository
{
    //given
    [[[self mockRepository] expect] refresh];
    
    //when
    [[self repositoryAction] actionForResource:nil];
}

-(void)testActionResourceRepository
{
    //given
    [[[self mockRepository] expect] refresh];

    //when
    [[self repositoryAction] actionForResource:
     [ERNResource createWithUrl:[NSURL URLWithString:@"url"] mime:@"mime"]];
}

@end
