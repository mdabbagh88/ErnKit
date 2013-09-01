#import "ERNApplication.h"
#import "ERNRepositoryManager.h"
#import "ERNLogAction.h"
#import "ERNMimeRoutingRepositoryFactory.h"
#import "ERNDefaultRepositoryManager.h"
#import "ERNCachedRepositoryFactory.h"
#import "ERNRoutingResourceFactory.h"
#import "ERNMimeRoutingAction.h"
#import "ERNDualAction.h"
#import "ERNDualObjectAction.h"
#import "ERNErrorHandler.h"
#import "ERNStoreResourceObjectAction.h"
#import "ERNActionObjectAction.h"
#import "ERNRoutingTableViewCellFactory.h"
#import "ERNDefaultTableViewItemManager.h"

@interface ERNApplication ()
@property (nonatomic, readonly) NSMutableDictionary *clientRepositoryFactories;
@property (nonatomic, readonly) NSMutableDictionary *resourceFactories;
@property (nonatomic, readonly) NSMutableDictionary *cellFactories;
@property (nonatomic, readonly) NSMutableDictionary *mimeActions;

@end

@implementation ERNApplication {
    id<ERNRepositoryManager> _repositoryManager;
    id<ERNRepositoryFactory> _repositoryFactory;
    id<ERNResourceFactory> _resourceFactory;
    id<ERNTableViewCellFactory> _cellFactory;
    id<ERNTableViewItemManager> _itemManager;
    id<ERNAction> _action;
    id<ERNObjectAction> _objectAction;
    NSMutableDictionary *_clientRepositoryFactories;
    NSMutableDictionary *_resourceFactories;
    NSMutableDictionary *_mimeActions;
    NSMutableDictionary *_cellFactories;
}

#pragma mark - public - constructors

+(instancetype)create
{
    return [self new];
}

#pragma mark - public

-(ERNMutableApplication *)mutableCopy
{
    return [[[self class] alloc] initWithRepositoryFactories:[self clientRepositoryFactories]
                                           resourceFactories:[self resourceFactories]
                                                 mimeActions:[self mimeActions]
                                               cellFactories:[self cellFactories]];
}

-(ERNApplication *)copy
{
    return [self mutableCopy];
}

#pragma mark - private - accessors

-(NSMutableDictionary *)clientRepositoryFactories
{
    return _clientRepositoryFactories = _clientRepositoryFactories ?
    _clientRepositoryFactories :
    [NSMutableDictionary dictionary];
}

-(id<ERNRepositoryManager>)repositoryManager
{
    return _repositoryManager = _repositoryManager ?
    _repositoryManager :
    [ERNDefaultRepositoryManager create];
}

-(id<ERNRepositoryFactory>)repositoryFactory
{
    return _repositoryFactory = _repositoryFactory ?
    _repositoryFactory :
    [ERNCachedRepositoryFactory createWithFirst:
     [ERNMimeRoutingRepositoryFactory createWithRepositoryFactories:
      [self clientRepositoryFactories]]
                                           rest:[self repositoryManager]];
}

-(NSMutableDictionary *)resourceFactories
{
    return _resourceFactories = _resourceFactories ?
    _resourceFactories :
    [NSMutableDictionary dictionary];
}

-(id<ERNResourceFactory>)resourceFactory
{
    return _resourceFactory = _resourceFactory ?
    _resourceFactory :
    [ERNRoutingResourceFactory createWithMappings:[self resourceFactories]];
}

-(id<ERNTableViewCellFactory>)cellFactory
{
    return _cellFactory = _cellFactory ?
    _cellFactory :
    [ERNRoutingTableViewCellFactory createWithMappings:[self cellFactories]];
}

-(NSMutableDictionary *)cellFactories
{
    return _cellFactories = _cellFactories ?
    _cellFactories :
    [NSMutableDictionary dictionary];
}

-(id<ERNTableViewItemManager>)itemManager
{
    return _itemManager = _itemManager ?
    _itemManager :
    [ERNDefaultTableViewItemManager createWithCellFactory:[self cellFactory]
                                             objectAction:[self objectAction]];
}

-(NSMutableDictionary *)mimeActions
{
    return _mimeActions = _mimeActions ?
    _mimeActions :
    [NSMutableDictionary dictionary];
}

-(id<ERNAction>)action
{
    return _action = _action ?
    _action :
    [ERNDualAction createWithFirstAction:
     [ERNLogAction createWithLogString:@"Application"]
                            secondAction:
     [ERNMimeRoutingAction createWithActions:[self mimeActions]]];
}

-(id<ERNObjectAction>)objectAction
{
    return _objectAction = _objectAction ?
    _objectAction :
    [ERNDualObjectAction createWithFirstObjectAction:
     [ERNStoreResourceObjectAction createWithResourceFactory:[self resourceFactory]
                                             repositoryStore:[self repositoryManager]]
                                  secondObjectAction:
     [ERNActionObjectAction createWithAction:[self action]
                             resourceFactory:[self resourceFactory]]];
}

#pragma mark - private - initializers

-(id)initWithRepositoryFactories:(NSDictionary *)repositoryFactories
               resourceFactories:(NSDictionary *)resourceFactories
                     mimeActions:(NSDictionary *)mimeActions
                   cellFactories:(NSDictionary *)cellFactories
{
    self = [super init];
    ERNCheckNil(self);
    _clientRepositoryFactories = [repositoryFactories mutableCopy];
    _resourceFactories = [resourceFactories mutableCopy];
    _mimeActions = [mimeActions mutableCopy];
    _cellFactories = [cellFactories mutableCopy];
    return self;
}

@end

@implementation ERNMutableApplication {
}

-(void)setRepositoryFactory:(id<ERNRepositoryFactory>)repositoryFactory
                    forMime:(NSString *)mime
{
    [[self clientRepositoryFactories] setObject:repositoryFactory
                                         forKey:mime];
}

-(void)setResourceFactory:(id<ERNResourceFactory>)resourceFactory
                 forClass:(Class)resourceClass
{
    [[self resourceFactories] setObject:resourceFactory
                                 forKey:NSStringFromClass(resourceClass)];
}

-(void)setAction:(id<ERNAction>)action
         forMime:(NSString *)mime
{
    [[self mimeActions] setObject:action forKey:mime];
}

-(void)setCellFactory:(id<ERNTableViewCellFactory>)cellFactory
             forClass:(Class)resourceClass
{
    [[self cellFactories] setObject:cellFactory
                             forKey:NSStringFromClass(resourceClass)];
}

@end


