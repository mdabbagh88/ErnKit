#import "ERNCachedRepositoryFactory.h"
#import "ERNNullAsyncRepository.h"
#import "ERNNullAsyncItemRepository.h"
#import "ERNNullAsyncItemsRepository.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"
#import "ERNErrorHandler.h"
#import "ERNNullRepositoryFactory.h"

@interface ERNCachedRepositoryFactory ()
@property (nonatomic, readonly) id<ERNRepositoryFactory> firstRepositoryFactory;
@property (nonatomic, readonly) id<ERNRepositoryFactory> restRepositoryFactory;
@end

@implementation ERNCachedRepositoryFactory {
    id<ERNRepositoryFactory> _firstRepositoryFactory;
    id<ERNRepositoryFactory> _restRepositoryFactory;
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
    ERNCheckNilAndReturn(resource, NO);
    return [[self firstRepositoryFactory] hasRepositoryForResource:resource] ||
    [[self restRepositoryFactory] hasRepositoryForResource:resource];
}

-(id<ERNAsyncPaginatedItemsRepository>)repositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncPaginatedItemsRepository create]);
    return [[self firstRepositoryFactory] hasRepositoryForResource:resource] ?
    [[self firstRepositoryFactory] repositoryForResource:resource] :
    [[self restRepositoryFactory] repositoryForResource:resource];
}

#pragma mark - private - accessors

ERNLazyLoadGetter(id<ERNRepositoryFactory>,
                  firstRepositoryFactory, [ERNNullRepositoryFactory create])

ERNLazyLoadGetter(id<ERNRepositoryFactory>,
                  restRepositoryFactory, [ERNNullRepositoryFactory create])

#pragma mark - private - initializers

-(id)initWithFirst:(id<ERNRepositoryFactory>)firstRepositoryFactory
              rest:(id<ERNRepositoryFactory>)restRepositoryFactory
{
    self = [super init];
    ERNCheckNil(self);
    _firstRepositoryFactory = firstRepositoryFactory;
    _restRepositoryFactory = restRepositoryFactory;
    return self;
}

@end
