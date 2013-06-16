#import "ERNDefaultRepositoryManager.h"
#import "ERNObjectAsyncItemRepository.h"
#import "ERNNullAsyncItemRepository.h"
#import "ERNNullAsyncItemRepository.h"
#import "ERNNullAsyncItemsRepository.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"
#import "ERNObjectAsyncItemRepository.h"
#import "ERNErrorHandler.h"

@interface ERNDefaultRepositoryManager ()
@property (nonatomic, readonly) NSMapTable *repositories;
@end

@implementation ERNDefaultRepositoryManager {
    NSMapTable *_repositories;
}

#pragma mark - public - constructors

+(instancetype)create
{
    return [self new];
}

#pragma mark - ERNRepositoryManager

-(void)storeUrl:(NSURL *)url
        forItem:(id<NSObject>)object
{
    ERNCheckNilNoReturn(url);
    ERNCheckNilNoReturn(object);
    [[self repositories] setObject:[ERNObjectAsyncItemRepository createWithItem:object]
                            forKey:url];
}

-(id<ERNAsyncRepository>)repositoryForUrl:(NSURL *)url
                                     mime:(NSString *)mime
{
    ERNCheckNilAndReturn(url, [ERNNullAsyncRepository create]);
    return [self validRepository:[[self repositories] objectForKey:url]];
}

-(id<ERNAsyncItemRepository>)itemRepositoryForUrl:(NSURL *)url
                                             mime:(NSString *)mime
{
    ERNCheckNilAndReturn(url, [ERNNullAsyncItemRepository create]);
    return [self validItemRepository:[[self repositories] objectForKey:url]];
}

-(id<ERNAsyncItemsRepository>)itemsRepositoryForUrl:(NSURL *)url
                                               mime:(NSString *)mime
{
    return [ERNNullAsyncItemsRepository create];
}

-(id<ERNAsyncPaginatedItemsRepository>)paginatedItemsRepositoryForUrl:(NSURL *)url
                                                                 mime:(NSString *)mime
{
    return [ERNNullAsyncPaginatedItemsRepository create];
}

#pragma mark - private

-(NSMapTable *)createRepositories
{
    return [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsStrongMemory
                                 valueOptions:NSPointerFunctionsWeakMemory];
}

-(id<ERNAsyncRepository>)validRepository:(id<ERNAsyncRepository>)repository
{
    return repository ? repository : [ERNNullAsyncRepository create];
}

-(id<ERNAsyncItemRepository>)validItemRepository:(id<ERNAsyncItemRepository>)repository
{
    return repository ? repository : [ERNNullAsyncItemRepository create];
}

#pragma mark - private - accessors

-(NSMapTable *)repositories
{
    return _repositories = _repositories ? _repositories : [self createRepositories];
}

@end
