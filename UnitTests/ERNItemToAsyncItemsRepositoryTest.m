#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNItemToAsyncItemsRepositoryTest.h"
#import "ERNItemToAsyncItemsRepository.h"

@implementation ERNItemToAsyncItemsRepositoryTest

-(void)testConstructor
{
    [ERNItemToAsyncItemsRepository createWithRepository:nil];
}

@end
