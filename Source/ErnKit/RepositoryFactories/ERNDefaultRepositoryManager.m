#import "ERNDefaultRepositoryManager.h"
#import "ERNObjectAsyncItemRepository.h"
#import "ERNNullAsyncItemRepository.h"
#import "ERNNullAsyncItemRepository.h"
#import "ERNNullAsyncItemsRepository.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"
#import "ERNItemToPaginatedItemsRepository.h"
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

-(id<ERNAsyncPaginatedItemsRepository>)repositoryForResource:(ERNResource *)resource
{
    ERNCheckNilAndReturn(resource, [ERNNullAsyncPaginatedItemsRepository create]);
    return [ERNItemToPaginatedItemsRepository createWithRepository:
            [ERNObjectAsyncItemRepository createWithItem:
             [[self objects] objectForKey:[resource url]]]];
}

#pragma mark - private

static NSMapTable *createObjects(void)
{
    return [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsStrongMemory
                                 valueOptions:NSPointerFunctionsWeakMemory];
}

#pragma mark - private - accessors

-(NSMapTable *)objects
{
    return _objects = _objects ? _objects : createObjects();
}

@end
