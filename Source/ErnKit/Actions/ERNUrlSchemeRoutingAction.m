#import "ERNUrlSchemeRoutingAction.h"
#import "NSObject+ERNHelper.h"
#import "ERNErrorHandler.h"
#import "ERNNullAction.h"

@interface ERNUrlSchemeRoutingAction ()
@property (nonatomic, readonly) NSDictionary *actions;
@end

@implementation ERNUrlSchemeRoutingAction {
}

#pragma mark - public - constructors

+(instancetype)createWithActions:(NSDictionary *)actions
{
    return [[self alloc] initWithActions:actions];
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
    ERNCheckNilNoReturn(resource);
    [[self validActionForRouting:[[resource url] scheme]] actionForResource:resource];
}

#pragma mark - private

-(id<ERNAction>)validActionForRouting:(NSString *)routing
{
    return [self validRouting:routing] ? [self actions][routing] : [ERNNullAction create];
}

-(BOOL)validRouting:(NSString *)routing
{
    return [[self actions][routing] conformsToProtocol:@protocol(ERNAction)];
}

#pragma mark - private - initializers

-(id)initWithActions:(NSDictionary *)actions
{
    self = [self init];
    ERNCheckNil(self);
    _actions = actions;
    return self;
}

@end
