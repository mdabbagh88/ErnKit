#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullRepositoryPaginatorTest.h"
#import "ERNNullRepositoryPaginator.h"
#import "ERNRepositoryPaginatorTest.h"
#import "NSURL+ERNHelper.h"

@implementation ERNNullRepositoryPaginatorTest {
}

#pragma mark - ERNRepositoryPaginator protocol tests

-(void)testRepositoryPaginatorProtocol
{
    [ERNRepositoryPaginatorTest testRepositoryPaginator:[ERNNullRepositoryPaginator create]];
}

#pragma mark - class tests

-(void)testSingleton
{
    //given, when
    id<ERNRepositoryPaginator> paginator1 = [ERNNullRepositoryPaginator create];
    id<ERNRepositoryPaginator> paginator2 = [ERNNullRepositoryPaginator create];

    //then
    assertThat(paginator1, notNilValue());
    assertThat(paginator1, equalTo(paginator2));
}

-(void)testCount
{
    //given
    id<ERNRepositoryPaginator> paginator = [ERNNullRepositoryPaginator create];

    //when
    NSUInteger total = [[paginator total] unsignedIntegerValue];

    //then
    assertThatUnsignedInteger(total, equalToUnsignedInteger(0));
}

-(void)testItems
{
    //given
    id<ERNRepositoryPaginator> paginator = [ERNNullRepositoryPaginator create];

    //when
    NSArray *items = [paginator items];

    //then
    assertThat(items, isEmpty());
    
}

@end
