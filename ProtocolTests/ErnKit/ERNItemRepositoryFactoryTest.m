#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNItemRepositoryFactoryTest.h"
#import "ERNItemRepositoryFactory.h"
#import "ERNResource.h"

@implementation ERNItemRepositoryFactoryTest {
}

#pragma mark - ERNItemRepositoryFactory protocol tests

+(void)testItemRepositoryFactory:(id<ERNItemRepositoryFactory>)itemRepositoryFactory
{
    [self testHasItemRepositoryForNilResource:itemRepositoryFactory];
    [self testItemRepositoryForNilResource:itemRepositoryFactory];
    [self testHasItemRepositoryForResource:itemRepositoryFactory];
    [self testItemRepositoryForResource:itemRepositoryFactory];
}

+(void)testHasItemRepositoryForNilResource:(id<ERNItemRepositoryFactory>)itemRepositoryFactory
{
    BOOL expectedResult = NO;
    assertThatBool([itemRepositoryFactory hasItemRepositoryForResource:nil], equalToBool(expectedResult));
}

+(void)testItemRepositoryForNilResource:(id<ERNItemRepositoryFactory>)itemRepositoryFactory
{
    id<ERNAsyncItemRepository> repository =
    [itemRepositoryFactory itemRepositoryForResource:nil];
    assertThat(repository, notNilValue());
}

+(void)testHasItemRepositoryForResource:(id<ERNItemRepositoryFactory>)itemRepositoryFactory
{
    ERNResource *resource = [ERNResource createNull];
    [itemRepositoryFactory hasItemRepositoryForResource:resource];
}

+(void)testItemRepositoryForResource:(id<ERNItemRepositoryFactory>)itemRepositoryFactory
{
    ERNResource *resource = [ERNResource createNull];
    id<ERNAsyncItemRepository> repository =
    [itemRepositoryFactory itemRepositoryForResource:resource];
    assertThat(repository, notNilValue());
}

@end
