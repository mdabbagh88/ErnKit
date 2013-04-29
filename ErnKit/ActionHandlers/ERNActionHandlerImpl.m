#import "ERNActionHandlerImpl.h"
#import "ERNUrlMimeFactory.h"
#import "ERNNullUrlMimeFactory.h"
#import "ERNAction.h"
#import "NSObject+ERNHelper.h"

@interface ERNActionHandlerImpl ()
@property (nonatomic, readonly) id<ERNAction> action;
@property (nonatomic, readonly) id<ERNUrlMimeFactory> urlMimeFactory;
@end

@implementation ERNActionHandlerImpl

@synthesize urlMimeFactory = _urlMimeFactory;

-(id<ERNUrlMimeFactory>)urlMimeFactory
{
    _urlMimeFactory = _urlMimeFactory ? _urlMimeFactory : [ERNNullUrlMimeFactory factory];
    return _urlMimeFactory;
}

-(void)actionForObject:(id<NSObject>)object
{
    [[self action] actionForUrl:[[self urlMimeFactory] urlForObject:object]
                           mime:[[self urlMimeFactory] mimeForObject:object]];
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

@end
