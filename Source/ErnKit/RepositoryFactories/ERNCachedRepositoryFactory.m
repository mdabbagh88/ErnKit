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

-(BOOL)hasRepositoryForResource:(ERNResource *)resource
{
    return [[self firstRepositoryFactory] hasRepositoryForResource:resource] ||
    [[self restRepositoryFactory] hasRepositoryForResource:resource];
}

-(BOOL)hasItemRepositoryForResource:(ERNResource *)resource
{
    return [[self firstRepositoryFactory] hasItemRepositoryForResource:resource] ||
    [[self restRepositoryFactory] hasItemRepositoryForResource:resource];
}

-(BOOL)hasItemsRepositoryForResource:(ERNResource *)resource
{
    return [[self firstRepositoryFactory] hasItemsRepositoryForResource:resource] ||
    [[self restRepositoryFactory] hasItemsRepositoryForResource:resource];
}

-(BOOL)hasPaginatedItemsRepositoryForResource:(ERNResource *)resource
{
    return [[self firstRepositoryFactory] hasPaginatedItemsRepositoryForResource:resource] ||
    [[self restRepositoryFactory] hasPaginatedItemsRepositoryForResource:resource];
}

-(id<ERNAsyncRepository>)repositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncRepository create]);
    return [[self firstRepositoryFactory] hasRepositoryForResource:resource] ?
    [[self firstRepositoryFactory] repositoryForResource:resource] :
    [[self restRepositoryFactory] repositoryForResource:resource];
}

-(id<ERNAsyncItemRepository>)itemRepositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncItemRepository create]);
    return [[self firstRepositoryFactory] hasItemRepositoryForResource:resource] ?
    [[self firstRepositoryFactory] itemRepositoryForResource:resource] :
    [[self restRepositoryFactory] itemRepositoryForResource:resource];
}

-(id<ERNAsyncItemsRepository>)itemsRepositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncItemsRepository create]);
    return [[self firstRepositoryFactory] hasItemsRepositoryForResource:resource] ?
    [[self firstRepositoryFactory] itemsRepositoryForResource:resource] :
    [[self restRepositoryFactory] itemsRepositoryForResource:resource];
}

-(id<ERNAsyncPaginatedItemsRepository>)paginatedItemsRepositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncPaginatedItemsRepository create]);
    return [[self firstRepositoryFactory] hasPaginatedItemsRepositoryForResource:resource] ?
    [[self firstRepositoryFactory] paginatedItemsRepositoryForResource:resource] :
    [[self restRepositoryFactory] paginatedItemsRepositoryForResource:resource];
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
