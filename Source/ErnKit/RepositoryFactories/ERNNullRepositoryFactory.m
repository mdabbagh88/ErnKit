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

-(BOOL)hasRepositoryForResource:(ERNResource *)resource
{
    return NO;
}

-(BOOL)hasItemRepositoryForResource:(ERNResource *)resource
{
    return NO;
}

-(BOOL)hasItemsRepositoryForResource:(ERNResource *)resource
{
    return NO;
}

-(BOOL)hasPaginatedItemsRepositoryForResource:(ERNResource *)resource
{
    return NO;
}

-(id<ERNAsyncRepository>)repositoryForResource:(ERNResource *)resource
{
    return [ERNNullAsyncRepository create];
}

-(id<ERNAsyncItemRepository>)itemRepositoryForResource:(ERNResource *)resource
{
    return [ERNNullAsyncItemRepository create];
}

-(id<ERNAsyncItemsRepository>)itemsRepositoryForResource:(ERNResource *)resource
{
    return [ERNNullAsyncItemsRepository create];
}

-(id<ERNAsyncPaginatedItemsRepository>)paginatedItemsRepositoryForResource:(ERNResource *)resource
{
    return [ERNNullAsyncPaginatedItemsRepository create];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
