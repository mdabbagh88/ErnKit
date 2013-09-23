#import "ERNNullRepositoryFactory.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"
#import "ERNErrorHandler.h"

@implementation ERNNullRepositoryFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
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

@end
