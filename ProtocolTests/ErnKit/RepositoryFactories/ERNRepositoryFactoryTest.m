#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNRepositoryFactoryTest.h"
#import "ERNRepositoryFactory.h"
#import "ERNResource.h"

@implementation ERNRepositoryFactoryTest {
}

#pragma mark - ERNRepositoryFactory protocol tests

+(void)testRepositoryFactory:(id<ERNRepositoryFactory>)repositoryFactory
{
    [self testHasRepositoryForNilResource:repositoryFactory];
    [self testHasItemRepositoryForNilResource:repositoryFactory];
    [self testHasItemsRepositoryForNilResource:repositoryFactory];
    [self testHasPaginatedItemsRepositoryForNilResource:repositoryFactory];
    [self testRepositoryForNilResource:repositoryFactory];
    [self testItemRepositoryForNilResource:repositoryFactory];
    [self testItemsRepositoryForNilResource:repositoryFactory];
    [self testAsyncPaginatedItemsRepositoryForNilResource:repositoryFactory];
    [self testHasRepositoryForResource:repositoryFactory];
    [self testHasItemRepositoryForResource:repositoryFactory];
    [self testHasItemsRepositoryForResource:repositoryFactory];
    [self testHasPaginatedItemsRepositoryResource:repositoryFactory];
    [self testRepositoryForResource:repositoryFactory];
    [self testItemRepositoryForResource:repositoryFactory];
    [self testItemsRepositoryForResource:repositoryFactory];
    [self testAsyncPaginatedItemsRepositoryForResource:repositoryFactory];
}

+(void)testHasRepositoryForNilResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    BOOL expectedResult = NO;
    assertThatBool([repositoryFactory hasRepositoryForResource:nil], equalToBool(expectedResult));
}

+(void)testHasItemRepositoryForNilResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    BOOL expectedResult = NO;
    assertThatBool([repositoryFactory hasItemRepositoryForResource:nil], equalToBool(expectedResult));
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

+(void)testItemRepositoryForNilResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    id<ERNAsyncItemRepository> repository =
    [repositoryFactory itemRepositoryForResource:nil];
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
    ERNResource *resource = [ERNResource createNull];
    [repositoryFactory hasRepositoryForResource:resource];
}

+(void)testHasItemRepositoryForResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    ERNResource *resource = [ERNResource createNull];
    [repositoryFactory hasItemRepositoryForResource:resource];
}

+(void)testHasItemsRepositoryForResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    ERNResource *resource = [ERNResource createNull];
    [repositoryFactory hasItemsRepositoryForResource:resource];
}

+(void)testHasPaginatedItemsRepositoryResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    ERNResource *resource = [ERNResource createNull];
    [repositoryFactory hasPaginatedItemsRepositoryForResource:resource];
}

+(void)testRepositoryForResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    ERNResource *resource = [ERNResource createNull];
    id<ERNAsyncRepository> repository =
    [repositoryFactory repositoryForResource:resource];
    assertThat(repository, notNilValue());
}

+(void)testItemRepositoryForResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    ERNResource *resource = [ERNResource createNull];
    id<ERNAsyncItemRepository> repository =
    [repositoryFactory itemRepositoryForResource:resource];
    assertThat(repository, notNilValue());
}

+(void)testItemsRepositoryForResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    ERNResource *resource = [ERNResource createNull];
    id<ERNAsyncItemsRepository> repository =
    [repositoryFactory itemsRepositoryForResource:resource];
    assertThat(repository, notNilValue());
}

+(void)testAsyncPaginatedItemsRepositoryForResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    ERNResource *resource = [ERNResource createNull];
    id<ERNAsyncPaginatedItemsRepository> repository =
    [repositoryFactory paginatedItemsRepositoryForResource:resource];
    assertThat(repository, notNilValue());
}

@end
