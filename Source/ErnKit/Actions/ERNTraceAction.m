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

+(instancetype)createWithAction:(id<ERNAction>)action
{
    return [[self alloc] initWithAction:action];
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
    [[self action] actionForResource:resource];
}

-(id<ERNAction>)logActionForAction:(id<ERNAction>)action
{
    return [ERNLogAction createWithLogString:NSStringFromClass([action class])];
}

#pragma mark - private - initializers

-(id)initWithAction:(id<ERNAction>)action
{
    self = [self init];
    ERNCheckNil(self);
    _action = [ERNDualAction createWithFirstAction:[self logActionForAction:action]
                                      secondAction:action];
    return self;
}

@end
