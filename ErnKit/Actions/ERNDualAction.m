#import "ERNDualAction.h"
#import "ERNErrorHandler.h"

@interface ERNDualAction ()
@property (nonatomic, readonly) id<ERNAction> firstAction;
@property (nonatomic, readonly) id<ERNAction> secondAction;
@end

@implementation ERNDualAction {
}

#pragma mark - public - constructors

+(instancetype)createWithFirstAction:(id<ERNAction>)firstAction
                        secondAction:(id<ERNAction>)secondAction
{
    return [[self alloc] initWithFirstAction:firstAction
                                secondAction:secondAction];
}

#pragma mark - ERNAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    [[self firstAction] actionForUrl:url
                                mime:mime];
    [[self secondAction] actionForUrl:url
                                 mime:mime];
}

#pragma mark - private - initializers

-(id)initWithFirstAction:(id<ERNAction>)firstAction
            secondAction:(id<ERNAction>)secondAction
{
    self = [self init];
    ERNCheckNil(self);
    _firstAction = firstAction;
    _secondAction = secondAction;
    return self;
}

@end
