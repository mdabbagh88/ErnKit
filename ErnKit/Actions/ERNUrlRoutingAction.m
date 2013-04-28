#import "ERNUrlRoutingAction.h"
#import "NSObject+ERNHelper.h"

@interface ERNUrlRoutingAction ()
@property (nonatomic, readonly) NSDictionary *actions;
@property (nonatomic, readonly, copy) NSString *(^urlRouter)(NSURL *);
@end

@implementation ERNUrlRoutingAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    [[[self actions][[self urlRouter](url)] guaranteeProtocolConformance:@protocol(ERNAction)] actionForUrl:url
                                                                                                       mime:mime];
}

-(BOOL)validAction:(id<ERNAction>)action
{
    return [action conformsToProtocol:@protocol(ERNAction)];
}

-(id)initWithActions:(NSDictionary *)actions
{
    self = [self init];
    ERNCheckNil(self);
    _actions = actions;
    return self;
}

-(id)initWithActionsForHosts:(NSDictionary *)actions
{
    self = [self initWithActions:actions];
    ERNCheckNil(self);
    _urlRouter = ^(NSURL *url){
        return [url host];
    };
    return self;
}

-(id)initWithActionsForSchemes:(NSDictionary *)actions
{
    self = [self initWithActions:actions];
    ERNCheckNil(self);
    _urlRouter = ^(NSURL *url){
        return [url scheme];
    };
    return self;
}

+(instancetype)actionWithActionsForHosts:(NSDictionary *)actions
{
    return [[self alloc] initWithActionsForHosts:actions];
}

+(instancetype)actionWithActionsForSchemes:(NSDictionary *)actions
{
    return [[self alloc] initWithActionsForSchemes:actions];
}

@end
