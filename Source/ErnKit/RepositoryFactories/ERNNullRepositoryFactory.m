#import "ERNNullRepositoryFactory.h"
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

-(id<ERNAsyncRepository>)repositoryForResource:(ERNResource *)__unused resource
{
    return [ERNNullAsyncPaginatedItemsRepository create];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
