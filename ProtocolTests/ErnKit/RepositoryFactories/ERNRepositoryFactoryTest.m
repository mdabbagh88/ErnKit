#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNRepositoryFactoryTest.h"
#import "ERNRepositoryFactory.h"
#import "ERNNullResource.h"

@implementation ERNRepositoryFactoryTest {
}

#pragma mark - ERNRepositoryFactory protocol tests

+(void)testRepositoryFactory:(id<ERNRepositoryFactory>)repositoryFactory
{
    [self testHasRepositoryForNilResource:repositoryFactory];
    [self testRepositoryForNilResource:repositoryFactory];
    [self testHasRepositoryForResource:repositoryFactory];
    [self testRepositoryForResource:repositoryFactory];
}

+(void)testHasRepositoryForNilResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    BOOL expectedResult = NO;
    assertThatBool([repositoryFactory hasRepositoryForResource:nil], equalToBool(expectedResult));
}

+(void)testRepositoryForNilResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    id<ERNAsyncPaginatedItemsRepository> repository =
    [repositoryFactory repositoryForResource:nil];
    assertThat(repository, notNilValue());
}

+(void)testHasRepositoryForResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    ERNResource *resource = [ERNNullResource create];
    [repositoryFactory hasRepositoryForResource:resource];
}

+(void)testRepositoryForResource:(id<ERNRepositoryFactory>)repositoryFactory
{
    ERNResource *resource = [ERNNullResource create];
    id<ERNAsyncPaginatedItemsRepository> repository =
    [repositoryFactory repositoryForResource:resource];
    assertThat(repository, notNilValue());
}

@end
