#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNMergingAsyncPaginatedItemsRepositoryTest.h"
#import "ERNMergingAsyncPaginatedItemsRepository.h"
#import "ERNAsyncPaginatedItemsRepositoryTest.h"

@implementation ERNMergingAsyncPaginatedItemsRepositoryTest {
}

#pragma mark - ERNAsyncPaginatedItemsRepository protocol tests

-(void)testAsyncPaginatedItemsRepositoryProtocolNilFirstNilRest
{
    [ERNAsyncPaginatedItemsRepositoryTest testAsyncPaginatedItemsRepository:
     [ERNMergingAsyncPaginatedItemsRepository createWithFirstRepository:nil
                                                         restRepository:nil]];
}

@end
