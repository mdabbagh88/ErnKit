#import "ERNMimeRoutingAction.h"

@interface ERNMimeRoutingAction ()
@property (nonatomic, readonly) NSDictionary *actions;
@end

@implementation ERNMimeRoutingAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    id<NSObject> object = [self actions][mime];
    if ([object conformsToProtocol:@protocol(ERNAction)]) {
        id<ERNAction> action = (id<ERNAction>)object;
        [action actionForUrl:url
                        mime:mime];
    }
}

-(id)initWithActionsForMimes:(NSDictionary *)actions
{
    self = [super init];
    _actions = actions;
    return self;
}

+(instancetype)actionWithActionsForMimes:(NSDictionary *)actions
{
    return [[self alloc] initWithActionsForMimes:actions];
}

@end
