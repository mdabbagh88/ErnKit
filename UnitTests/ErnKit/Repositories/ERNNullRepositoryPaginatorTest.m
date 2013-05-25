#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullRepositoryPaginatorTest.h"
#import "ERNNullRepositoryPaginator.h"
#import "NSURL+ERNHelper.h"

@implementation ERNNullRepositoryPaginatorTest

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

-(void)testNextPage
{
    //given
    id<ERNRepositoryPaginator> paginator = [ERNNullRepositoryPaginator create];

    //when
    NSURL *url = [paginator nextPage];

    //then
    assertThat(url, equalTo([NSURL ERN_createNull]));
}

-(void)testPreviousPage
{
    //given
    id<ERNRepositoryPaginator> paginator = [ERNNullRepositoryPaginator create];

    //when
    NSURL *url = [paginator previousPage];

    //then
    assertThat(url, equalTo([NSURL ERN_createNull]));
}

-(void)testItems
{
    //given
    id<ERNRepositoryPaginator> paginator = [ERNNullRepositoryPaginator create];

    //when
    NSArray *items = [paginator items];

    //then
    assertThat(items, notNilValue());
    assertThatUnsignedInteger([items count], equalToUnsignedInteger(0));
    
}

@end
