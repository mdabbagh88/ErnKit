#import "ERNActionSheetAction.h"
#import "ERNActionSheetTransitioner.h"
#import "ERNActionSheetFactory.h"
#import "ERNErrorHandler.h"

@interface ERNActionSheetAction ()
@property (nonatomic, readonly) id<ERNActionSheetFactory> factory;
@property (nonatomic, readonly) id<ERNActionSheetTransitioner> transitioner;
@end

@implementation ERNActionSheetAction {
}

#pragma mark - public - constructors

+(instancetype)createWithTransitioner:(id<ERNActionSheetTransitioner>)transitioner
                         factory:(id<ERNActionSheetFactory>)factory
{
    return [[self alloc] initWithTransitioner:transitioner
                                 factory:factory];
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
    ERNCheckNilNoReturn([self factory]);
    ERNCheckNilNoReturn([self transitioner]);
    ERNCheckNilNoReturn(resource);
    [[self transitioner] transitionToActionSheet:
     [[self factory] createActionSheetForResource:resource]];
}

#pragma mark - private - initializers

-(id)initWithTransitioner:(id<ERNActionSheetTransitioner>)transitioner
             factory:(id<ERNActionSheetFactory>)factory
{
    self = [super init];
    ERNCheckNil(self);
    _factory = factory;
    _transitioner = transitioner;
    return self;
}

@end

