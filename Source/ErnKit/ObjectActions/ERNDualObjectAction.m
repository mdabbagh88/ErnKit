#import "ERNDualObjectAction.h"
#import "ERNErrorHandler.h"

@interface ERNDualObjectAction ()
@property (nonatomic, readonly) id<ERNObjectAction> firstObjectAction;
@property (nonatomic, readonly) id<ERNObjectAction> secondObjectAction;
@end

@implementation ERNDualObjectAction {
}

#pragma mark - public - constructors

+(instancetype)createWithFirstObjectAction:(id<ERNObjectAction>)firstObjectAction
                        secondObjectAction:(id<ERNObjectAction>)secondObjectAction
{
    return [[self alloc] initWithFirstObjectAction:firstObjectAction
                                secondObjectAction:secondObjectAction];
}

#pragma mark - ERNObjectAction

-(void)actionForObject:(id<NSObject>)object
{
    ERNCheckNilNoReturn(object);
    [[self firstObjectAction] actionForObject:object];
    [[self secondObjectAction] actionForObject:object];
}

#pragma mark - private - initializers

-(id)initWithFirstObjectAction:(id<ERNObjectAction>)firstObjectAction
            secondObjectAction:(id<ERNObjectAction>)secondObjectAction
{
    self = [super init];
    ERNCheckNil(self);
    _firstObjectAction = firstObjectAction;
    _secondObjectAction = secondObjectAction;
    return self;
}

@end
