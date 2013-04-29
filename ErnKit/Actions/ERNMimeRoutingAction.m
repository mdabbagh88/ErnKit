#import "ERNMimeRoutingAction.h"
#import "NSObject+ERNHelper.h"

@interface ERNMimeRoutingAction ()
@property (nonatomic, readonly) NSDictionary *actions;
@end

@implementation ERNMimeRoutingAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    ERNCheckNil(mime);
    ERNCheckNil(url);
    [[[self actions][mime] guaranteeProtocolConformance:@protocol(ERNAction)] actionForUrl:url
                                                                                      mime:mime];
}

-(id)initWithActionsForMimes:(NSDictionary *)actions
{
    self = [self init];
    ERNCheckNil(self);
    _actions = actions;
    return self;
}

+(instancetype)actionWithActionsForMimes:(NSDictionary *)actions
{
    return [[self alloc] initWithActionsForMimes:actions];
}

@end
