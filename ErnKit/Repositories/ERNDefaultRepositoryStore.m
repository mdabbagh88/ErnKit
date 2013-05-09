#import "ERNDefaultRepositoryStore.h"
#import "ERNObjectAsyncItemRepository.h"
#import "ERNNullAsyncItemRepository.h"
#import "ERNObjectAsyncItemRepository.h"
#import "ERNErrorHandler.h"

@interface ERNDefaultRepositoryStore ()
@property (nonatomic, readonly) NSMapTable *repositories;
@end

@implementation ERNDefaultRepositoryStore {
    NSMapTable *_repositories;
}

#pragma mark - public - constructors

+(instancetype)create
{
    return [self new];
}

#pragma mark - ERNRepositoryStore

-(void)storeUrl:(NSURL *)url
        forItem:(id<NSObject>)object
{
    ERNCheckNilNoReturn(url);
    ERNCheckNilNoReturn(object);
    [[self repositories] setObject:[ERNObjectAsyncItemRepository createWithItem:object]
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
