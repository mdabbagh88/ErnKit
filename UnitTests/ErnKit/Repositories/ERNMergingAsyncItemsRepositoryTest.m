#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNMergingAsyncItemsRepositoryTest.h"
#import "ERNMergingAsyncItemsRepository.h"

@interface ERNBaseAsyncRepository ()
-(void)testHelperChangeNotificationCenter:(NSNotificationCenter *)notificationCenter;
@end

@interface ERNMergingAsyncItemsRepository ()
-(void)subRepositoriesRefreshed;
@end

@implementation ERNMergingAsyncItemsRepositoryTest
@end
