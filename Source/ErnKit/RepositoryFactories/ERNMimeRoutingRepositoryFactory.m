#import "ERNMimeRoutingRepositoryFactory.h"
#import "ERNNullAsyncRepository.h"
#import "ERNNullAsyncItemRepository.h"
#import "ERNNullAsyncItemsRepository.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"
#import "ERNResource.h"
#import "ERNErrorHandler.h"

@interface ERNMimeRoutingRepositoryFactory ()
@property (nonatomic, readonly) NSDictionary *repositoryFactories;
@end

@implementation ERNMimeRoutingRepositoryFactory {
}

#pragma mark - public - constructors

+(instancetype)createWithRepositoryFactories:(NSDictionary *)repositoryFactories
{
    return [[self alloc] initWithRepositoryFactories:repositoryFactories];
}

#pragma mark - ERNRepositoryFactory

-(id<ERNAsyncRepository>)repositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncRepository create]);
    return [self validRepository:
            [[self factoryForMime:[resource mime]] repositoryForResource:resource]];
}

-(id<ERNAsyncItemRepository>)itemRepositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncItemRepository create]);
    return [self validItemRepository:
            [[self factoryForMime:[resource mime]] itemRepositoryForResource:resource]];
}

-(id<ERNAsyncItemsRepository>)itemsRepositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncItemsRepository create]);
    return [self validItemsRepository:
            [[self factoryForMime:[resource mime]] itemsRepositoryForResource:resource]];
}

-(id<ERNAsyncPaginatedItemsRepository>)paginatedItemsRepositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncPaginatedItemsRepository create]);
    return [self validPaginatedItemsRepository:
            [[self factoryForMime:[resource mime]] paginatedItemsRepositoryForResource:resource]];
}

-(id<ERNRepositoryFactory>)factoryForMime:(NSString *)mime
{
    return [[self repositoryFactories] objectForKey:mime];
}

#pragma mark - private


-(id<ERNAsyncRepository>)validRepository:(id<ERNAsyncRepository>)repository
{
    return repository ? repository : [ERNNullAsyncRepository create];
}

-(id<ERNAsyncItemRepository>)validItemRepository:(id<ERNAsyncItemRepository>)repository
{
    return repository ? repository : [ERNNullAsyncItemRepository create];
}

-(id<ERNAsyncItemsRepository>)validItemsRepository:(id<ERNAsyncItemsRepository>)repository
{
    return repository  ? repository : [ERNNullAsyncItemsRepository create];
}

-(id<ERNAsyncPaginatedItemsRepository>)
validPaginatedItemsRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
{
    return repository ? repository : [ERNNullAsyncPaginatedItemsRepository create];
}

#pragma mark - private - initializers

-(id)initWithRepositoryFactories:(NSDictionary *)repositoryFactories
{
    self = [self init];
    ERNCheckNil(self);
    _repositoryFactories = repositoryFactories;
    return self;
}

@end
