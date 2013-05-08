#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNArrayAsyncItemsRepositoryTest.h"
#import "ERNArrayAsyncItemsRepository.h"

@implementation ERNArrayAsyncItemsRepositoryTest

-(void)testConstructor
{
    [ERNArrayAsyncItemsRepository createWithArray:nil];
}

@end
