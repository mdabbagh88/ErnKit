#import "ERNCachedRepositoryFactory.h"

#import "ERNNullAsyncRepository.h"
#import "ERNNullAsyncItemRepository.h"
#import "ERNNullAsyncItemsRepository.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"
#import "ERNErrorHandler.h"

@interface ERNCachedRepositoryFactory ()
@property (nonatomic, readonly) id<ERNRepositoryFactory>firstRepositoryFactory;
@property (nonatomic, readonly) id<ERNRepositoryFactory>restRepositoryFactory;
@end

@implementation ERNCachedRepositoryFactory {
}

#pragma mark - public - constructors

+(instancetype)createWithFirst:(id<ERNRepositoryFactory>)firstRepositoryFactory
                          rest:(id<ERNRepositoryFactory>)restRepositoryFactory
{
    return [[self alloc] initWithFirst:firstRepositoryFactory
                                  rest:restRepositoryFactory];
}

#pragma mark - ERNRepositoryFactory

-(id<ERNAsyncRepository>)repositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncRepository create]);
    id<ERNAsyncRepository> repository =
    [[self firstRepositoryFactory] repositoryForResource:resource];
    if (repository && ![repository isKindOfClass:[ERNNullAsyncRepository class]]) {
        return repository;
    }
    repository = [[self restRepositoryFactory] repositoryForResource:resource];
    return repository ? repository : [ERNNullAsyncRepository create];
}

-(id<ERNAsyncItemRepository>)itemRepositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncItemRepository create]);
    id<ERNAsyncItemRepository> repository =
    [[self firstRepositoryFactory] itemRepositoryForResource:resource];
    if (repository && ![repository isKindOfClass:[ERNNullAsyncItemRepository class]]) {
        return repository;
    }
    repository = [[self restRepositoryFactory] itemRepositoryForResource:resource];
    return repository ? repository : [ERNNullAsyncItemRepository create];

}

-(id<ERNAsyncItemsRepository>)itemsRepositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncItemsRepository create]);
    id<ERNAsyncItemsRepository> repository =
    [[self firstRepositoryFactory] itemsRepositoryForResource:resource];
    if (repository && ![repository isKindOfClass:[ERNNullAsyncItemsRepository class]]) {
        return repository;
    }
    repository = [[self restRepositoryFactory] itemsRepositoryForResource:resource];
    return repository ? repository : [ERNNullAsyncItemsRepository create];

}

-(id<ERNAsyncPaginatedItemsRepository>)paginatedItemsRepositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncPaginatedItemsRepository create]);
    id<ERNAsyncPaginatedItemsRepository> repository =
    [[self firstRepositoryFactory] paginatedItemsRepositoryForResource:resource];
    if (repository && ![repository isKindOfClass:[ERNNullAsyncPaginatedItemsRepository class]]) {
        return repository;
    }
    repository = [[self restRepositoryFactory] paginatedItemsRepositoryForResource:resource];
    return repository ? repository : [ERNNullAsyncPaginatedItemsRepository create];

}

#pragma mark - private - initializers

-(id)initWithFirst:(id<ERNRepositoryFactory>)firstRepositoryFactory
              rest:(id<ERNRepositoryFactory>)restRepositoryFactory
{
    self = [self init];
    ERNCheckNil(self);
    _firstRepositoryFactory = firstRepositoryFactory;
    _restRepositoryFactory = restRepositoryFactory;
    return self;
}

@end
