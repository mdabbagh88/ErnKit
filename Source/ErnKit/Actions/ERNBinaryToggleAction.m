#import "ERNBinaryToggleAction.h"
#import "ERNErrorHandler.h"
#import "ERNNullAction.h"

@interface ERNBinaryToggleAction ()
@property (nonatomic, readonly) id<ERNAction> action;
@property (nonatomic) id<ERNAction> currentAction;
@end

@implementation ERNBinaryToggleAction {
    BOOL _selected;
    id<ERNAction> _action;
}

#pragma mark - public - constructors

+(instancetype)createWithAction:(id<ERNAction>)action
{
    return [[self alloc] initWithAction:action];
}

#pragma mark - ERNBinaryToggle

-(void)setSelected:(BOOL)selected
{
    _selected = selected;
    [self setCurrentAction:selected ? [self action] : [ERNNullAction create]];
}

-(BOOL)selected
{
    return _selected;
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
    [[self currentAction] actionForResource:resource];
}

#pragma mark - private - accessors

-(void)setCurrentAction:(id<ERNAction>)currentAction
{
    _currentAction = currentAction;
    [self notifyObservers];
}

ERNLazyLoadGetter(id<ERNAction>, action, [ERNNullAction create])

#pragma mark - private - initializers

-(id)initWithAction:(id<ERNAction>)action
{
    self = [super init];
    ERNCheckNil(self);
    _action = action;
    [self setCurrentAction:[self action]];
    return self;
}

@end
