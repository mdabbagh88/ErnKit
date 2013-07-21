#import "ERNMimeRoutingRepositoryFactory.h"
#import "ERNNullAsyncRepository.h"
#import "ERNNullAsyncItemRepository.h"
#import "ERNNullAsyncItemsRepository.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"
#import "ERNResource.h"
#import "ERNErrorHandler.h"
#import "ERNNullRepositoryFactory.h"

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

-(BOOL)hasRepositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, NO);
    return [[self factoryForMime:[resource mime]] hasRepositoryForResource:resource];
}

-(id<ERNAsyncPaginatedItemsRepository>)repositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncPaginatedItemsRepository create]);
    return [self validRepository:
            [[self factoryForMime:[resource mime]] repositoryForResource:resource]];
}

#pragma mark - private

-(id<ERNRepositoryFactory>)factoryForMime:(NSString *)mime
{
    return validFactory([[self repositoryFactories] objectForKey:mime]);
}

static id<ERNRepositoryFactory> validFactory(id<ERNRepositoryFactory> repositoryFactory)
{
    return isValidFactory(repositoryFactory) ?
    repositoryFactory : [ERNNullRepositoryFactory create];
}

static BOOL isValidFactory(id<ERNRepositoryFactory> repositoryFactory)
{
    return repositoryFactory &&
    [repositoryFactory conformsToProtocol:@protocol(ERNRepositoryFactory)];
}

-(id<ERNAsyncPaginatedItemsRepository>)validRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
{
    return repository ? repository : [ERNNullAsyncPaginatedItemsRepository create];
}

#pragma mark - private - initializers

-(id)initWithRepositoryFactories:(NSDictionary *)repositoryFactories
{
    self = [super init];
    ERNCheckNil(self);
    _repositoryFactories = repositoryFactories;
    return self;
}

@end
