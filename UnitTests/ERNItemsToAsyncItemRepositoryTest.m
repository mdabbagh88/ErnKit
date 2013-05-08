#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNItemsToAsyncItemRepositoryTest.h"
#import "ERNItemsToAsyncItemRepository.h"

@implementation ERNItemsToAsyncItemRepositoryTest

-(void)testConstructor
{
    [ERNItemsToAsyncItemRepository createWithRepository:nil];
}

@end
