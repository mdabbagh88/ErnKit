#import "ERNDefaultRepositoryStore.h"
#import "ERNObjectAsyncItemRepository.h"
#import "ERNNullAsyncItemRepository.h"
#import "ERNErrorHandler.h"

@interface ERNDefaultRepositoryStore ()
@property (nonatomic, readonly) NSMapTable *repositories;
@end

@implementation ERNDefaultRepositoryStore {
    NSMapTable *_repositories;
}

#pragma mark - ERNRepositoryStore

-(void)storeUrl:(NSURL *)url
        forItem:(id<NSObject>)object
{
    [[self repositories] setObject:object
                            forKey:url];
}

#pragma mark - ERNRepositoryFactory

-(id<ERNAsyncItemRepository>)repositoryForUrl:(NSURL *)url
{
    ERNCheckNilAndReturn(url, [ERNNullAsyncItemRepository create]);
    return [self validRepository:[[self repositories] objectForKey:url]];
}

#pragma mark - private

-(NSMapTable *)createRepositories
{
    return [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsStrongMemory
                                 valueOptions:NSPointerFunctionsWeakMemory];
}

-(id<ERNAsyncItemRepository>)validRepository:(id<ERNAsyncItemRepository>)repository
{
    return repository ? repository : [ERNNullAsyncItemRepository create];
}

#pragma mark - private - accessors

-(NSMapTable *)repositories
{
    return _repositories = _repositories ? _repositories : [self createRepositories];
}

@end
