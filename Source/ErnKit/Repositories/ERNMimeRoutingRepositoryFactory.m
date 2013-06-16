#import "ERNMimeRoutingRepositoryFactory.h"
#import "ERNNullAsyncRepository.h"
#import "ERNNullAsyncItemRepository.h"
#import "ERNNullAsyncItemsRepository.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"
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

-(id<ERNAsyncRepository>)repositoryForUrl:(NSURL *)url
                                     mime:(NSString *)mime
{
    ERNCheckNilAndReturn(url, [ERNNullAsyncRepository create]);
    ERNCheckNilAndReturn(mime, [ERNNullAsyncRepository create]);
    return [self validRepository:
            [[self factoryForMime:mime] repositoryForUrl:url
                                                    mime:mime]];
}

-(id<ERNAsyncItemRepository>)itemRepositoryForUrl:(NSURL *)url
                                             mime:(NSString *)mime
{
    ERNCheckNilAndReturn(url, [ERNNullAsyncItemRepository create]);
    ERNCheckNilAndReturn(mime, [ERNNullAsyncItemRepository create]);
    return [self validItemRepository:
            [[self factoryForMime:mime] itemRepositoryForUrl:url
                                                        mime:mime]];
}

-(id<ERNAsyncItemsRepository>)itemsRepositoryForUrl:(NSURL *)url
                                               mime:(NSString *)mime
{
    ERNCheckNilAndReturn(url, [ERNNullAsyncItemsRepository create]);
    ERNCheckNilAndReturn(mime, [ERNNullAsyncItemsRepository create]);
    return [self validItemsRepository:
            [[self factoryForMime:mime] itemsRepositoryForUrl:url
                                                         mime:mime]];
}

-(id<ERNAsyncPaginatedItemsRepository>)paginatedItemsRepositoryForUrl:(NSURL *)url
                                                                 mime:(NSString *)mime
{
    ERNCheckNilAndReturn(url, [ERNNullAsyncPaginatedItemsRepository create]);
    ERNCheckNilAndReturn(mime, [ERNNullAsyncPaginatedItemsRepository create]);
    return [self validPaginatedItemsRepository:
            [[self factoryForMime:mime] paginatedItemsRepositoryForUrl:url
                                                                  mime:mime]];
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

-(id<ERNAsyncPaginatedItemsRepository>)validPaginatedItemsRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
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
