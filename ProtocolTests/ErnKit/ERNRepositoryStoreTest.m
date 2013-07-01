#import "ERNRepositoryStoreTest.h"
#import "ERNRepositoryStore.h"

@implementation ERNRepositoryStoreTest {
}

#pragma mark - ERNRepositoryStore protocol tests

+(void)testRepositoryStore:(id<ERNRepositoryStore>)repositoryStore
{
    [self testStoreNilUrlForNilItem:repositoryStore];
    [self testStoreUrlForNilItem:repositoryStore];
    [self testStoreNilUrlForItem:repositoryStore];
    [self testStoreUrlForItem:repositoryStore];
}

+(void)testStoreNilUrlForNilItem:(id<ERNRepositoryStore>)repositoryStore
{
    [repositoryStore storeUrl:nil
                      forItem:nil];
}

+(void)testStoreUrlForNilItem:(id<ERNRepositoryStore>)repositoryStore
{
    [repositoryStore storeUrl:[NSURL URLWithString:@"url"]
                      forItem:nil];
}

+(void)testStoreNilUrlForItem:(id<ERNRepositoryStore>)repositoryStore
{
    [repositoryStore storeUrl:nil
                      forItem:[NSObject new]];
}

+(void)testStoreUrlForItem:(id<ERNRepositoryStore>)repositoryStore
{
    [repositoryStore storeUrl:[NSURL URLWithString:@"url"]
                      forItem:[NSObject new]];
}

@end
