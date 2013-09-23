#import "ERNDualAction.h"
#import "ERNErrorHandler.h"
#import "ERNNullAction.h"

@interface ERNDualAction ()
@property (nonatomic, readonly) id<ERNAction> firstAction;
@property (nonatomic, readonly) id<ERNAction> secondAction;
@end

@implementation ERNDualAction {
    id<ERNAction> _firstAction;
    id<ERNAction> _secondAction;
}

#pragma mark - public - constructors

+(instancetype)createWithFirstAction:(id<ERNAction>)firstAction
                        secondAction:(id<ERNAction>)secondAction
{
    return [[self alloc] initWithFirstAction:firstAction
                                secondAction:secondAction];
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
    ERNCheckNilNoReturn(resource);
    [[self firstAction] actionForResource:resource];
    [[self secondAction] actionForResource:resource];
}

#pragma  mark - private - accessors

ERNLazyLoadGetter(id<ERNAction>, firstAction, [ERNNullAction create])

ERNLazyLoadGetter(id<ERNAction>, secondAction, [ERNNullAction create])

#pragma mark - private - initializers

-(id)initWithFirstAction:(id<ERNAction>)firstAction
            secondAction:(id<ERNAction>)secondAction
{
    self = [super init];
    ERNCheckNil(self);
    _firstAction = firstAction;
    _secondAction = secondAction;
    return self;
}

@end
