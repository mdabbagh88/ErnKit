#import "ERNRepositoryManagerTest.h"
#import "ERNRepositoryFactoryTest.h"
#import "ERNRepositoryStoreTest.h"
#import "ERNRepositoryManager.h"

@implementation ERNRepositoryManagerTest {
}

#pragma mark - ERNRepositoryManager protocol tests

+(void)testRepositoryManager:(id<ERNRepositoryManager>)repositoryManager
{
    [ERNRepositoryFactoryTest testRepositoryFactory:repositoryManager];
    [ERNRepositoryStoreTest testRepositoryStore:repositoryManager];
}

@end
