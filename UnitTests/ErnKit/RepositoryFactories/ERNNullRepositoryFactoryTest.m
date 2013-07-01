#import "ERNNullRepositoryFactoryTest.h"
#import "ERNNullRepositoryFactory.h"
#import "ERNRepositoryFactoryTest.h"

@implementation ERNNullRepositoryFactoryTest {
}

#pragma mark - ERNRepositoryFactory protocol tests

-(void)testRepositoryFactoryProtocol
{
    [ERNRepositoryFactoryTest testRepositoryFactory:[ERNNullRepositoryFactory create]];
}

@end
