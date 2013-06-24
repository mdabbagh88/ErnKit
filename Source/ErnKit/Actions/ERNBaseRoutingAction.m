#import "ERNBaseRoutingAction.h"
#import "ERNAction.h"
#import "ERNNullAction.h"
#import "ERNErrorHandler.h"

@interface ERNBaseRoutingAction ()
@property (nonatomic, readonly) NSDictionary *actions;
@end

@implementation ERNBaseRoutingAction {
}

#pragma mark - public

-(id<ERNAction>)validActionForRouting:(NSString *)routing
{
    return [self validRouting:routing] ? [self actions][routing] : [ERNNullAction create];
}

-(BOOL)validRouting:(NSString *)routing
{
    return [[self actions][routing] conformsToProtocol:@protocol(ERNAction)];
}

#pragma mark - public - constructors

+(instancetype)createWithActions:(NSDictionary *)actions
{
    return [[self alloc] initWithActions:actions];
}

#pragma mark - public - initializers

-(id)initWithActions:(NSDictionary *)actions
{
    self = [self init];
    ERNCheckNil(self);
    _actions = actions;
    return self;
}

@end
