#import "ERNDefaultActionHandler.h"
#import "ERNResourceFactory.h"
#import "ERNNullResourceFactory.h"
#import "ERNAction.h"
#import "ERNErrorHandler.h"
#import "ERNRepositoryStore.h"

@interface ERNDefaultActionHandler ()
@property (nonatomic, readonly) id<ERNAction> action;
@property (nonatomic, readonly) id<ERNResourceFactory> resourceFactory;
@property (nonatomic, readonly) id<ERNRepositoryStore> repositoryStore;
@end

@implementation ERNDefaultActionHandler {
    id<ERNResourceFactory> _resourceFactory;
}

#pragma mark - public - constructors

+(instancetype)createWithAction:(id<ERNAction>)action
                resourceFactory:(id<ERNResourceFactory>)resourceFactory
                repositoryStore:(id<ERNRepositoryStore>)repositoryStore
{
    return [[self alloc] initWithAction:action
                        resourceFactory:resourceFactory
                        repositoryStore:repositoryStore];
}

+(instancetype)createWithAction:(id<ERNAction>)action
{
    return [[self alloc] initWithAction:action
                        resourceFactory:nil
                        repositoryStore:nil];
}

#pragma mark - ERNActionHandler

-(void)actionForObject:(id<NSObject>)object
{
    ERNCheckNilNoReturn(object);
    ERNCheckNilNoReturn([self action]);
    [[self action] actionForResource:
     [self storeResource:[self resourceForObject:object]
                  object:object]];
}

#pragma mark - private

-(ERNResource *)storeResource:(ERNResource *)resource
                       object:(id<NSObject>)object
{
    [[self repositoryStore] storeUrl:[resource url]
                             forItem:object];
    return resource;
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

-(id)initWithAction:(id<ERNAction>)action
    resourceFactory:(id<ERNResourceFactory>)resourceFactory
    repositoryStore:(id<ERNRepositoryStore>)repositoryStore
{
    self = [self init];
    ERNCheckNil(self);
    _action = action;
    _repositoryStore = repositoryStore;
    _resourceFactory = resourceFactory;
    return self;
}

@end
