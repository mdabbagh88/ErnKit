#import "ERNNullItemRepositoryFactoryTest.h"
#import "ERNNullItemRepositoryFactory.h"
#import "ERNItemRepositoryFactoryTest.h"

@implementation ERNNullItemRepositoryFactoryTest {
}

#pragma mark - ERNItemRepositoryFactory protocol tests

-(void)testItemRepositoryFactoryProtocol
{
    [ERNItemRepositoryFactoryTest testItemRepositoryFactory:[ERNNullItemRepositoryFactory create]];
}

@end
