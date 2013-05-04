#import "ERNDefaultActionHandler.h"
#import "ERNUrlMimeFactory.h"
#import "ERNNullUrlMimeFactory.h"
#import "ERNAction.h"
#import "ERNErrorHandler.h"
#import "ERNRepositoryStore.h"

@interface ERNDefaultActionHandler ()
@property (nonatomic, readonly) id<ERNAction> action;
@property (nonatomic, readonly) id<ERNUrlMimeFactory> urlMimeFactory;
@property (nonatomic, readonly) id<ERNRepositoryStore> repositoryStore;
@end

@implementation ERNDefaultActionHandler {
    id<ERNUrlMimeFactory> _urlMimeFactory;
}

#pragma mark - public - constructors

+(instancetype)actionHandlerWithAction:(id<ERNAction>)action
                        urlMimeFactory:(id<ERNUrlMimeFactory>)urlMimeFactory
                       repositoryStore:(id<ERNRepositoryStore>)repositoryStore
{
    return [[self alloc] initWithAction:action
                         urlMimeFactory:urlMimeFactory
                        repositoryStore:repositoryStore];
}

+(instancetype)actionHandlerWithAction:(id<ERNAction>)action
                        urlMimeFactory:(id<ERNUrlMimeFactory>)urlMimeFactory
{
    return [[self alloc] initWithAction:action
                         urlMimeFactory:urlMimeFactory];
}

+(instancetype)actionHandlerWithAction:(id<ERNAction>)action
{
    return [[self alloc] initWithAction:action];
}

#pragma mark - ERNActionHandler

-(void)actionForObject:(id<NSObject>)object
{
    [self actionForObject:object
                      url:[[self urlMimeFactory] urlForObject:object]];
}

#pragma mark - private

-(void)actionForObject:(id<NSObject>)object
                   url:(NSURL *)url
{
    [[self repositoryStore] storeUrl:url
                           forItem:object];
    [[self action] actionForUrl:url
                           mime:[[self urlMimeFactory] mimeForObject:object]];
}

#pragma mark - private - accessors

-(id<ERNUrlMimeFactory>)urlMimeFactory
{
    _urlMimeFactory = _urlMimeFactory ? _urlMimeFactory : [ERNNullUrlMimeFactory factory];
    return _urlMimeFactory;
}

#pragma mark - private - initializers

-(id)initWithAction:(id<ERNAction>)action
     urlMimeFactory:(id<ERNUrlMimeFactory>)urlMimeFactory
    repositoryStore:(id<ERNRepositoryStore>)repositoryStore
{
    self = [self initWithAction:action
            urlMimeFactory:urlMimeFactory];
    ERNCheckNil(self);
    _repositoryStore = repositoryStore;
    return self;
}

-(id)initWithAction:(id<ERNAction>)action
     urlMimeFactory:(id<ERNUrlMimeFactory>)urlMimeFactory
{
    self = [self initWithAction:action];
    ERNCheckNil(self);
    _urlMimeFactory = urlMimeFactory;
    return self;
}

-(id)initWithAction:(id<ERNAction>)action
{
    self = [self init];
    ERNCheckNil(self);
    _action = action;
    return self;
}

@end
