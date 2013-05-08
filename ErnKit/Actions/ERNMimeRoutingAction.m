#import "ERNMimeRoutingAction.h"
#import "NSObject+ERNHelper.h"
#import "ERNErrorHandler.h"
#import "ERNNullAction.h"

@interface ERNMimeRoutingAction ()
@property (nonatomic, readonly) NSDictionary *actions;
@end

@implementation ERNMimeRoutingAction {
}

#pragma mark - public - constructors

+(instancetype)createWithActionsForMimes:(NSDictionary *)actions
{
    return [[self alloc] initWithActionsForMimes:actions];
}

#pragma mark - ERNAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    ERNCheckNilNoReturn(mime);
    ERNCheckNilNoReturn(url);
    [[self validActionForMime:mime] actionForUrl:url
                                            mime:mime];
}

#pragma mark - private

-(id<ERNAction>)validActionForMime:(NSString *)mime
{
    return [self validMime:mime] ? [self actions][mime] : [ERNNullAction create];
}

-(BOOL)validMime:(NSString *)mime
{
    return [[self actions][mime] conformsToProtocol:@protocol(ERNAction)];
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
