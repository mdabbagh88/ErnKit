#import "ERNActionTogglerAction.h"
#import "ERNAction.h"
#import "ERNErrorHandler.h"
#import "NSObject+ERNHelper.h"
#import "ERNNullAction.h"

@interface ERNActionTogglerAction ()
@property (nonatomic, readonly, copy) NSArray *actions;
@property (nonatomic) id<ERNAction> currentAction;
@end

@implementation ERNActionTogglerAction

#pragma mark - public - constructors

+(instancetype)createWithActions:(NSArray *)actions
{
    return [[self alloc] initWithActions:actions];
}

#pragma mark - ERNToggler

-(void)toggleToIndex:(NSUInteger)index
{
    [self setCurrentAction:[self validActionForIndex:index]];
}

#pragma mark - ERNAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    [[self currentAction] actionForUrl:url
                                  mime:mime];
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

#pragma mark - private - initializers

-(id)initWithActions:(NSArray *)actions
{
    self = [self init];
    ERNCheckNil(self);
    _actions = actions;
    [self setCurrentAction:[self validActionForIndex:0]];
    return self;
}

@end