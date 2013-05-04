#import "ERNMimeRoutingAction.h"
#import "NSObject+ERNHelper.h"
#import "ERNErrorHandler.h"

@interface ERNMimeRoutingAction ()
@property (nonatomic, readonly) NSDictionary *actions;
@end

@implementation ERNMimeRoutingAction {
}

#pragma mark - public - constructors

+(instancetype)actionWithActionsForMimes:(NSDictionary *)actions
{
    return [[self alloc] initWithActionsForMimes:actions];
}

#pragma mark - ERNAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    ERNCheckNilNoReturn(mime);
    ERNCheckNilNoReturn(url);
    [[[self actions][mime] guaranteeProtocolConformance:@protocol(ERNAction)] actionForUrl:url
                                                                                      mime:mime];
}

#pragma mark - private - initializers

-(id)initWithActionsForMimes:(NSDictionary *)actions
{
    self = [self init];
    ERNCheckNil(self);
    _actions = actions;
    return self;
}

@end
