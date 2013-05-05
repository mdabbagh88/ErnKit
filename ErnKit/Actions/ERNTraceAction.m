#import "ERNTraceAction.h"
#import "ERNErrorHandler.h"
#import "ERNDualAction.h"
#import "ERNLogAction.h"

@interface ERNTraceAction ()
@property (nonatomic, readonly) id<ERNAction>action;
@end

@implementation ERNTraceAction {
}

#pragma mark - public - constructors

+(instancetype)actionWithAction:(id<ERNAction>)action
{
    return [[self alloc] initWithAction:action];
}

#pragma mark - ERNAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    [[self action] actionForUrl:url
                           mime:mime];
}

-(id<ERNAction>)logActionForAction:(id<ERNAction>)action
{
    return [ERNLogAction actionWithLogString:NSStringFromClass([action class])];
}

#pragma mark - private - initializers

-(id)initWithAction:(id<ERNAction>)action
{
    self = [self init];
    ERNCheckNil(self);
    _action = [ERNDualAction actionWithFirstAction:[self logActionForAction:action]
                                      secondAction:action];
    return self;
}

@end
