#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNRepositoryPaginatorTest.h"
#import "ERNRepositoryPaginator.h"

@implementation ERNRepositoryPaginatorTest {
}

#pragma mark - ERNRepository protocol tests

+(void)testRepositoryPaginator:(id<ERNRepositoryPaginator>)repositoryPaginator
{
    [self testTotal:repositoryPaginator];
    [self testItems:repositoryPaginator];
    [self testNextPage:repositoryPaginator];
    [self testPreviousPage:repositoryPaginator];
}

+(void)testTotal:(id<ERNRepositoryPaginator>)repositoryPaginator
{
    assertThat([repositoryPaginator total], notNilValue());
}

+(void)testItems:(id<ERNRepositoryPaginator>)repositoryPaginator
{
    assertThat([repositoryPaginator items], notNilValue());
}

+(void)testNextPage:(id<ERNRepositoryPaginator>)repositoryPaginator
{
    assertThat([repositoryPaginator nextPage], notNilValue());
}

+(void)testPreviousPage:(id<ERNRepositoryPaginator>)repositoryPaginator
{
    assertThat([repositoryPaginator previousPage], notNilValue());
}

@end
