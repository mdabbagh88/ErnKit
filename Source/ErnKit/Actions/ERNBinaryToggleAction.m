#import "ERNBinaryToggleAction.h"
#import "ERNErrorHandler.h"
#import "ERNNullAction.h"

@interface ERNBinaryToggleAction ()
@property (nonatomic, readonly) id<ERNAction> action;
@property (nonatomic, readwrite) id<ERNAction> currentAction;
@end

@implementation ERNBinaryToggleAction {
    BOOL _selected;
    NSNotificationCenter *_notificationCenter;
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

-(void)addObserver:(id)observer
          selector:(SEL)selector
{
    ERNCheckNilNoReturn(observer);
    ERNCheckNilNoReturn(selector);
    [[self notificationCenter] addObserver:observer
                                  selector:selector
                                      name:[self notificationName]
                                    object:self];
}

-(void)removeObserver:(id)observer
{
    ERNCheckNilNoReturn(observer);
    [[self notificationCenter] removeObserver:observer
                                         name:[self notificationName]
                                       object:self];
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
    [[self currentAction] actionForResource:resource];
}

#pragma mark - private

-(NSString *)notificationName
{
    return NSStringFromClass([self class]);
}

-(void)notifyObservers
{
    [[self notificationCenter] postNotificationName:[self notificationName]
                                             object:self];
}

#pragma mark - private - accessors

-(NSNotificationCenter *)notificationCenter
{
    return _notificationCenter = _notificationCenter ?
    _notificationCenter :
    [NSNotificationCenter new];
}

-(void)setCurrentAction:(id<ERNAction>)currentAction
{
    _currentAction = currentAction;
    [self notifyObservers];
}

#pragma mark - private - initializers

-(id)initWithAction:(id<ERNAction>)action
{
    self = [self init];
    ERNCheckNil(self);
    _action = action;
    [self setCurrentAction:action];
    return self;
}

@end
