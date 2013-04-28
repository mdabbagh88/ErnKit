#import "ERNActionHandlerImpl.h"
#import "ERNUrlMimeFactory.h"
#import "ERNAction.h"
#import "NSObject+ERNHelper.h"

@interface ERNActionHandlerImpl ()
@property (nonatomic, readonly) id<ERNAction> action;
@property (nonatomic, readonly) id<ERNUrlMimeFactory> urlMimeFactory;
@end

@implementation ERNActionHandlerImpl

-(void)actionForObject:(id<NSObject>)object
{
    [[self action] actionForUrl:[[self urlMimeFactory] urlForObject:object]
                           mime:[[self urlMimeFactory] mimeForObject:object]];
}

-(id)initWithAction:(id<ERNAction>)action
     urlMimeFactory:(id<ERNUrlMimeFactory>)urlMimeFactory
{
    self = [self init];
    ERNCheckNil(self);
    _action = action;
    _urlMimeFactory = urlMimeFactory;
    return self;
}

+(instancetype)actionHandlerWithAction:(id<ERNAction>)action
                        urlMimeFactory:(id<ERNUrlMimeFactory>)urlMimeFactory
{
    return [[self alloc] initWithAction:action
                         urlMimeFactory:urlMimeFactory];
}

@end
