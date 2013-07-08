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

-(void)actionForResource:(ERNResource *)resource
{
    ERNCheckNilNoReturn(resource);
    [[self firstAction] actionForResource:resource];
    [[self secondAction] actionForResource:resource];
}

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
