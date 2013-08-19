#import "ERNActionTogglerAction.h"
#import "ERNAction.h"
#import "ERNErrorHandler.h"
#import "ERNNullAction.h"

@interface ERNActionTogglerAction ()
@property (nonatomic, readonly, copy) NSArray *actions;
@property (nonatomic) id<ERNAction> currentAction;
@end

@implementation ERNActionTogglerAction {
    NSUInteger _selectedIndex;
}

#pragma mark - public - constructors

+(instancetype)createWithActions:(NSArray *)actions
{
    return [[self alloc] initWithActions:actions];
}

#pragma mark - ERNToggler

-(void)setSelectedIndex:(NSUInteger)index
{
    _selectedIndex = index;
    [self setCurrentAction:[self validActionForIndex:index]];
}

-(NSUInteger)selectedIndex
{
    return _selectedIndex;
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
    [[self currentAction] actionForResource:resource];
}

#pragma mark - private

-(id<ERNAction>)validActionForIndex:(NSUInteger)index
{
    return [self validIndex:index] ? [self actions][index] : [ERNNullAction create];
}

-(BOOL)validIndex:(NSUInteger)index
{
    return index < [[self actions] count] &&
    [[self actions][index] conformsToProtocol:@protocol(ERNAction)];
}

#pragma mark - private - accessors

-(void)setCurrentAction:(id<ERNAction>)currentAction
{
    _currentAction = currentAction;
    [self notifyObservers];
}

#pragma mark - private - initializers

-(id)initWithActions:(NSArray *)actions
{
    self = [super init];
    ERNCheckNil(self);
    _actions = actions;
    _selectedIndex = 0;
    [self setCurrentAction:[self validActionForIndex:0]];
    return self;
}

@end
