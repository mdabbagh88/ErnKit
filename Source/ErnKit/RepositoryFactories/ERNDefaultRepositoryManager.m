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
@property (nonatomic, readonly) NSMapTable *objects;
@end

@implementation ERNDefaultRepositoryManager {
    NSMapTable *_objects;
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
    [[self objects] setObject:object
                       forKey:url];
}

-(BOOL)hasRepositoryForResource:(ERNResource *)resource
{
    return [[self objects] ERN_hasObjectForKey:[resource url]];
}

-(BOOL)hasItemRepositoryForResource:(ERNResource *)resource
{
    return [[self objects] ERN_hasObjectForKey:[resource url]];
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
    return validRepository([ERNObjectAsyncItemRepository createWithItem:
                           [[self objects] objectForKey:[resource url]]]);
}

-(id<ERNAsyncItemRepository>)itemRepositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncItemRepository create]);
    return validItemRepository([ERNObjectAsyncItemRepository createWithItem:
                               [[self objects] objectForKey:[resource url]]]);
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

static NSMapTable *createObjects(void)
{
    return [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsStrongMemory
                                 valueOptions:NSPointerFunctionsWeakMemory];
}

static id<ERNAsyncRepository> validRepository(id<ERNAsyncRepository> repository)
{
    return repository ? repository : [ERNNullAsyncRepository create];
}

static id<ERNAsyncItemRepository> validItemRepository(id<ERNAsyncItemRepository> repository)
{
    return repository ? repository : [ERNNullAsyncItemRepository create];
}

#pragma mark - private - accessors

-(NSMapTable *)objects
{
    return _objects = _objects ? _objects : createObjects();
}

@end
