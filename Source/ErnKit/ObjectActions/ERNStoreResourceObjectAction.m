#import "ERNStoreResourceObjectAction.h"
#import "ERNResourceFactory.h"
#import "ERNNullResourceFactory.h"
#import "ERNObjectAction.h"
#import "ERNErrorHandler.h"
#import "ERNRepositoryStore.h"
#import "ERNResource.h"

@interface ERNStoreResourceObjectAction ()
@property (nonatomic, readonly) id<ERNResourceFactory> resourceFactory;
@property (nonatomic, readonly) id<ERNRepositoryStore> repositoryStore;
@end

@implementation ERNStoreResourceObjectAction {
    id<ERNResourceFactory> _resourceFactory;
}

#pragma mark - public - constructors

+(instancetype)createWithResourceFactory:(id<ERNResourceFactory>)resourceFactory
                         repositoryStore:(id<ERNRepositoryStore>)repositoryStore
{
    return [[self alloc] initWithResourceFactory:resourceFactory
                                 repositoryStore:repositoryStore];
}

#pragma mark - ERNObjectAction

-(void)actionForObject:(id<NSObject>)object
{
    ERNCheckNilNoReturn(object);
    [self storeResource:[self resourceForObject:object]
                 object:object];
}

#pragma mark - private

-(void)storeResource:(ERNResource *)resource
                       object:(id<NSObject>)object
{
    [[self repositoryStore] storeUrl:[resource url]
                             forItem:object];
}

-(ERNResource *)resourceForObject:(id<NSObject>)object
{
    return [[self resourceFactory] resourceForObject:object];
}

#pragma mark - private - accessors

-(id<ERNResourceFactory>)resourceFactory
{
    return _resourceFactory = _resourceFactory ? _resourceFactory : [ERNNullResourceFactory create];
}

#pragma mark - private - initializers

-(id)initWithResourceFactory:(id<ERNResourceFactory>)resourceFactory
             repositoryStore:(id<ERNRepositoryStore>)repositoryStore
{
    self = [super init];
    ERNCheckNil(self);
    _repositoryStore = repositoryStore;
    _resourceFactory = resourceFactory;
    return self;
}

@end
