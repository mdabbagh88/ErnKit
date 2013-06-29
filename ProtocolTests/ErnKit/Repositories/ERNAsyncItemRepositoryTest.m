#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "ERNAsyncItemRepositoryTest.h"
#import "ERNAsyncRepositoryTest.h"

@implementation ERNAsyncItemRepositoryTest {
}

#pragma mark - ERNAsyncItemRepository protocol tests

+(void)testAsyncItemRepository:(id<ERNAsyncItemRepository>)asyncItemRepository
{
    [self testItem:asyncItemRepository];
    [ERNAsyncRepositoryTest testAsyncRepository:asyncItemRepository];
}

+(void)testItem:(id<ERNAsyncItemRepository>)asyncItemRepository
{
    id item = [asyncItemRepository item];
    assertThat(item, notNilValue());
}

@end
