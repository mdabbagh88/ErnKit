#import "ERNUrlRoutingAction.h"
#import "NSObject+ERNHelper.h"
#import "ERNErrorHandler.h"

@interface ERNUrlRoutingAction ()
@property (nonatomic, readonly) NSDictionary *actions;
@property (nonatomic, readonly, copy) NSString *(^urlRouter)(NSURL *);
@end

@implementation ERNUrlRoutingAction {
}

#pragma mark - public - constructors

+(instancetype)createWithActionsForHosts:(NSDictionary *)actions
{
    return [[self alloc] initWithActionsForHosts:actions];
}

+(instancetype)actionWithActionsForSchemes:(NSDictionary *)actions
{
    return [[self alloc] initWithActionsForSchemes:actions];
}

#pragma mark - ERNAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    ERNCheckNilNoReturn(url);
    ERNCheckNilNoReturn(mime);
    [[self getActionForRouting:[self urlRouter](url)] actionForUrl:url
                                                              mime:mime];
}

#pragma mark - private

-(id<ERNAction>)getActionForRouting:(NSString *)routing
{
    return [[self actions][routing] guaranteeProtocolConformance:@protocol(ERNAction)];
}

#pragma mark - private - initializers

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

-(id)initWithActions:(NSDictionary *)actions
{
    self = [self init];
    ERNCheckNil(self);
    _actions = actions;
    return self;
}

@end
