#import "ERNNullRepositoryFactory.h"
#import "ERNNullAsyncRepository.h"
#import "ERNNullAsyncItemRepository.h"
#import "ERNNullAsyncItemsRepository.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"

static ERNNullRepositoryFactory *immutableSingleton;

@implementation ERNNullRepositoryFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNRepositoryFactory

-(BOOL)hasRepositoryForResource:(ERNResource *)__unused resource
{
    return NO;
}

-(BOOL)hasItemRepositoryForResource:(ERNResource *)__unused resource
{
    return NO;
}

-(BOOL)hasItemsRepositoryForResource:(ERNResource *)__unused resource
{
    return NO;
}

-(BOOL)hasPaginatedItemsRepositoryForResource:(ERNResource *)__unused resource
{
    return NO;
}

-(id<ERNAsyncRepository>)repositoryForResource:(ERNResource *)__unused resource
{
    return [ERNNullAsyncRepository create];
}

-(id<ERNAsyncItemRepository>)itemRepositoryForResource:(ERNResource *)__unused resource
{
    return [ERNNullAsyncItemRepository create];
}

-(id<ERNAsyncItemsRepository>)itemsRepositoryForResource:(ERNResource *)__unused resource
{
    return [ERNNullAsyncItemsRepository create];
}

-(id<ERNAsyncPaginatedItemsRepository>)paginatedItemsRepositoryForResource:(ERNResource *)__unused resource
{
    return [ERNNullAsyncPaginatedItemsRepository create];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
