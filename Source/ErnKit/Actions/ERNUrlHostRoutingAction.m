#import "ERNUrlHostRoutingAction.h"
#import "ERNErrorHandler.h"
#import "ERNNullAction.h"

@interface ERNUrlHostRoutingAction ()
@property (nonatomic, readonly) NSDictionary *actions;
@end

@implementation ERNUrlHostRoutingAction {
}

#pragma mark - public - constructors

+(instancetype)createWithActions:(NSDictionary *)actions
{
    return [[self alloc] initWithActions:actions];
}

#pragma mark - ERNAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    ERNCheckNilNoReturn(url);
    ERNCheckNilNoReturn(mime);
    [[self validActionForRouting:[url host]] actionForUrl:url
                                                     mime:mime];
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