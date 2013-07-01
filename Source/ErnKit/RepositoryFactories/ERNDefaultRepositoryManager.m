#import "ERNDefaultRepositoryManager.h"
#import "ERNObjectAsyncItemRepository.h"
#import "ERNNullAsyncItemRepository.h"
#import "ERNNullAsyncItemRepository.h"
#import "ERNNullAsyncItemsRepository.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"
#import "ERNObjectAsyncItemRepository.h"
#import "ERNResource.h"
#import "ERNErrorHandler.h"
#import "NSMapTable+ERNHelper.h"

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

-(BOOL)hasRepositoryForResource:(ERNResource *)resource
{
    return [[self repositories] hasObjectForKey:[resource url]];
}

-(BOOL)hasItemRepositoryForResource:(ERNResource *)resource
{
    return [[self repositories] hasObjectForKey:[resource url]];
}

-(BOOL)hasItemsRepositoryForResource:(ERNResource *)resource
{
    return NO;
}

-(BOOL)hasPaginatedItemsRepositoryForResource:(ERNResource *)resource
{
    return NO;
}

-(id<ERNAsyncRepository>)repositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncRepository create]);
    return [self validRepository:[[self repositories] objectForKey:[resource url]]];
}

-(id<ERNAsyncItemRepository>)itemRepositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncItemRepository create]);
    return [self validItemRepository:[[self repositories] objectForKey:[resource url]]];
}

-(id<ERNAsyncItemsRepository>)itemsRepositoryForResource:(ERNResource *)resource
{
    return [ERNNullAsyncItemsRepository create];
}

-(id<ERNAsyncPaginatedItemsRepository>)paginatedItemsRepositoryForResource:(ERNResource *)resource
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
