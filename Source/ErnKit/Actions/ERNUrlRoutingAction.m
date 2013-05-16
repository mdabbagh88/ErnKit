#import "ERNUrlRoutingAction.h"
#import "NSObject+ERNHelper.h"
#import "ERNErrorHandler.h"
#import "ERNNullAction.h"

typedef NSString *(^ERNURLRouter)(NSURL *);

@interface ERNUrlRoutingAction ()
@property (nonatomic, readonly) NSDictionary *actions;
@property (nonatomic, readonly, copy) ERNURLRouter urlRouter;
@end

@implementation ERNUrlRoutingAction {
}

#pragma mark - public - constructors

+(instancetype)createWithActionsForHosts:(NSDictionary *)actions
{
    return [[self alloc] initWithActions:actions
                               urlRouter:^(NSURL *url){
                                   return [url host];
                               }];
}

+(instancetype)createWithActionsForSchemes:(NSDictionary *)actions
{
    return [[self alloc] initWithActions:actions
                               urlRouter:^(NSURL *url){
                                   return [url scheme];
                               }];
}

#pragma mark - ERNAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    ERNCheckNilNoReturn(url);
    ERNCheckNilNoReturn(mime);
    [[self validActionForRouting:[self urlRouter](url)] actionForUrl:url
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
           urlRouter:(ERNURLRouter)urlRouter
{
    self = [self init];
    ERNCheckNil(self);
    _actions = actions;
    _urlRouter = urlRouter;
    return self;
}

@end
