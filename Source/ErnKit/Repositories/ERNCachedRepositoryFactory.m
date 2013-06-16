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

-(id<ERNAsyncRepository>)repositoryForUrl:(NSURL *)url
                                     mime:(NSString *)mime
{
    ERNCheckNilAndReturn(url, [ERNNullAsyncRepository create]);
    ERNCheckNilAndReturn(mime, [ERNNullAsyncRepository create]);
    id<ERNAsyncRepository> repository =
    [[self firstRepositoryFactory] repositoryForUrl:url
                                               mime:mime];
    if (repository && ![repository isKindOfClass:[ERNNullAsyncRepository class]]) {
        return repository;
    }
    repository = [[self restRepositoryFactory] repositoryForUrl:url
                                                           mime:mime];
    return repository ? repository : [ERNNullAsyncRepository create];
}

-(id<ERNAsyncItemRepository>)itemRepositoryForUrl:(NSURL *)url
                                             mime:(NSString *)mime
{
    ERNCheckNilAndReturn(url, [ERNNullAsyncItemRepository create]);
    ERNCheckNilAndReturn(mime, [ERNNullAsyncItemRepository create]);
    id<ERNAsyncItemRepository> repository =
    [[self firstRepositoryFactory] itemRepositoryForUrl:url
                                                   mime:mime];
    if (repository && ![repository isKindOfClass:[ERNNullAsyncItemRepository class]]) {
        return repository;
    }
    repository = [[self restRepositoryFactory] itemRepositoryForUrl:url
                                                               mime:mime];
    return repository ? repository : [ERNNullAsyncItemRepository create];

}

-(id<ERNAsyncItemsRepository>)itemsRepositoryForUrl:(NSURL *)url
                                               mime:(NSString *)mime
{
    ERNCheckNilAndReturn(url, [ERNNullAsyncItemsRepository create]);
    ERNCheckNilAndReturn(mime, [ERNNullAsyncItemsRepository create]);
    id<ERNAsyncItemsRepository> repository =
    [[self firstRepositoryFactory] itemsRepositoryForUrl:url
                                                    mime:mime];
    if (repository && ![repository isKindOfClass:[ERNNullAsyncItemsRepository class]]) {
        return repository;
    }
    repository = [[self restRepositoryFactory] itemsRepositoryForUrl:url
                                                                mime:mime];
    return repository ? repository : [ERNNullAsyncItemsRepository create];

}

-(id<ERNAsyncPaginatedItemsRepository>)paginatedItemsRepositoryForUrl:(NSURL *)url
                                                                 mime:(NSString *)mime
{
    ERNCheckNilAndReturn(url, [ERNNullAsyncPaginatedItemsRepository create]);
    ERNCheckNilAndReturn(mime, [ERNNullAsyncPaginatedItemsRepository create]);
    id<ERNAsyncPaginatedItemsRepository> repository =
    [[self firstRepositoryFactory] paginatedItemsRepositoryForUrl:url
                                                            mime:mime];
    if (repository && ![repository isKindOfClass:[ERNNullAsyncPaginatedItemsRepository class]]) {
        return repository;
    }
    repository = [[self restRepositoryFactory] paginatedItemsRepositoryForUrl:url
                                                                         mime:mime];
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
