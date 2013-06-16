#import "ERNDefaultActionHandler.h"
#import "ERNResourceFactory.h"
#import "ERNNullUrlMimeFactory.h"
#import "ERNAction.h"
#import "ERNErrorHandler.h"
#import "ERNRepositoryStore.h"

@interface ERNDefaultActionHandler ()
@property (nonatomic, readonly) id<ERNAction> action;
@property (nonatomic, readonly) id<ERNResourceFactory> urlMimeFactory;
@property (nonatomic, readonly) id<ERNRepositoryStore> repositoryStore;
@end

@implementation ERNDefaultActionHandler {
    id<ERNResourceFactory> _urlMimeFactory;
}

#pragma mark - public - constructors

+(instancetype)createWithAction:(id<ERNAction>)action
                 urlMimeFactory:(id<ERNResourceFactory>)urlMimeFactory
                repositoryStore:(id<ERNRepositoryStore>)repositoryStore
{
    return [[self alloc] initWithAction:action
                         urlMimeFactory:urlMimeFactory
                        repositoryStore:repositoryStore];
}

+(instancetype)createWithAction:(id<ERNAction>)action
{
    return [[self alloc] initWithAction:action
                         urlMimeFactory:nil
                        repositoryStore:nil];
}

#pragma mark - ERNActionHandler

-(void)actionForObject:(id<NSObject>)object
{
    ERNCheckNilNoReturn(object);
    ERNCheckNilNoReturn([self action]);
    [self actionForObject:object
                      url:[[self urlMimeFactory] urlForObject:object]];
}

#pragma mark - private

-(void)actionForObject:(id<NSObject>)object
                   url:(NSURL *)url
{
    ERNCheckNilNoReturn(url);
    [[self repositoryStore] storeUrl:url
                           forItem:object];
    [[self action] actionForResource:
     [ERNResource createWithUrl:url
                           mime:[[self urlMimeFactory] mimeForObject:object]]];
}

#pragma mark - private - accessors

-(id<ERNResourceFactory>)urlMimeFactory
{
    return _urlMimeFactory = _urlMimeFactory ? _urlMimeFactory : [ERNNullUrlMimeFactory create];
}

#pragma mark - private - initializers

-(id)initWithAction:(id<ERNAction>)action
     urlMimeFactory:(id<ERNResourceFactory>)urlMimeFactory
    repositoryStore:(id<ERNRepositoryStore>)repositoryStore
{
    self = [self init];
    ERNCheckNil(self);
    _action = action;
    _repositoryStore = repositoryStore;
    _urlMimeFactory = urlMimeFactory;
    return self;
}

@end
