#import "ERNSchemeRoutingAction.h"

@interface ERNSchemeRoutingAction ()
@property (nonatomic, readonly) NSDictionary *actions;
@end

@implementation ERNSchemeRoutingAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    id<ERNAction> action = [self actions][[url scheme]];
    [action actionForUrl:url
                    mime:mime];
}

-(id)initWithActionsForSchemes:(NSDictionary *)actions
{
    self = [super init];
    _actions = actions;
    return self;
}

+(instancetype)actionWithActionsForSchemes:(NSDictionary *)actions
{
    return [[self alloc] initWithActionsForSchemes:actions];
}

@end
