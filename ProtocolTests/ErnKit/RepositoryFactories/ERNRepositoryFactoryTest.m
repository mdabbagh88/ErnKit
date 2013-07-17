#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNRepositoryFactoryTest.h"
#import "ERNRepositoryFactory.h"
#import "ERNNullResource.h"
#import "ERNItemRepositoryFactoryTest.h"

@implementation ERNRepositoryFactoryTest {
}

#pragma mark - ERNRepositoryFactory protocol tests

+(void)testRepositoryFactory:(id<ERNRepositoryFactory>)repositoryFactory
{
    [ERNItemRepositoryFactoryTest testItemRepositoryFactory:repositoryFactory];
    [self testHasRepositoryForNilResource:repositoryFactory];
    [self testHasItemsRepositoryForNilResource:repositoryFactory];
    [self testHasPaginatedItemsRepositoryForNilResource:repositoryFactory];
    [self testRepositoryForNilResource:repositoryFactory];
    [self testItemsRepositoryForNilResource:repositoryFactory];
    [self testAsyncPaginatedItemsRepositoryForNilResource:repositoryFactory];
    [self testHasRepositoryForResource:repositoryFactory];
    [self testHasItemsRepositoryForResource:repositoryFactory];
    [self testHasPaginatedItemsRepositoryResource:repositoryFactory];
    [self testRepositoryForResource:repositoryFactory];
    [self testItemsRepositoryForResource:repositoryFactory];
    [self testAsyncPaginatedItemsRepositoryForResource:repositoryFactory];
}

+(void)testHasRepositoryForNilResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    BOOL expectedResult = NO;
    assertThatBool([repositoryFactory hasRepositoryForResource:nil], equalToBool(expectedResult));
}

+(void)testHasItemsRepositoryForNilResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    BOOL expectedResult = NO;
    assertThatBool([repositoryFactory hasItemsRepositoryForResource:nil], equalToBool(expectedResult));
}

+(void)testHasPaginatedItemsRepositoryForNilResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    BOOL expectedResult = NO;
    assertThatBool([repositoryFactory hasPaginatedItemsRepositoryForResource:nil], equalToBool(expectedResult));
}

+(void)testRepositoryForNilResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    id<ERNAsyncRepository> repository =
    [repositoryFactory repositoryForResource:nil];
    assertThat(repository, notNilValue());
}

+(void)testItemsRepositoryForNilResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    id<ERNAsyncItemsRepository> repository =
    [repositoryFactory itemsRepositoryForResource:nil];
    assertThat(repository, notNilValue());
}

+(void)testAsyncPaginatedItemsRepositoryForNilResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    id<ERNAsyncPaginatedItemsRepository> repository =
    [repositoryFactory paginatedItemsRepositoryForResource:nil];
    assertThat(repository, notNilValue());
}

+(void)testHasRepositoryForResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    ERNResource *resource = [ERNNullResource create];
    [repositoryFactory hasRepositoryForResource:resource];
}

+(void)testHasItemsRepositoryForResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    ERNResource *resource = [ERNNullResource create];
    [repositoryFactory hasItemsRepositoryForResource:resource];
}

+(void)testHasPaginatedItemsRepositoryResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    ERNResource *resource = [ERNNullResource create];
    [repositoryFactory hasPaginatedItemsRepositoryForResource:resource];
}

+(void)testRepositoryForResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    ERNResource *resource = [ERNNullResource create];
    id<ERNAsyncRepository> repository =
    [repositoryFactory repositoryForResource:resource];
    assertThat(repository, notNilValue());
}

+(void)testItemsRepositoryForResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    ERNResource *resource = [ERNNullResource create];
    id<ERNAsyncItemsRepository> repository =
    [repositoryFactory itemsRepositoryForResource:resource];
    assertThat(repository, notNilValue());
}

+(void)testAsyncPaginatedItemsRepositoryForResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    ERNResource *resource = [ERNNullResource create];
    id<ERNAsyncPaginatedItemsRepository> repository =
    [repositoryFactory paginatedItemsRepositoryForResource:resource];
    assertThat(repository, notNilValue());
}

@end
