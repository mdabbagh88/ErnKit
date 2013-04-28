#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNRestKitAsyncItemsRepositoryTest.h"
#import "ERNRestKitAsyncItemsRepository.h"

@implementation ERNRestKitAsyncItemsRepositoryTest

-(void)testConstructor
{
    [ERNRestKitAsyncItemsRepository asyncItemsRepositoryWithUrl:nil
                                                        keyPath:nil
                                                        mapping:nil
                                                    statusCodes:nil];
}

@end
