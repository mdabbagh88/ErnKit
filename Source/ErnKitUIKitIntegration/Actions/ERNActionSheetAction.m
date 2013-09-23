#import "ERNActionSheetAction.h"
#import "ERNActionSheetTransitioner.h"
#import "ERNNullActionSheetFactory.h"
#import "ERNNullActionSheetTransitioner.h"
#import "ERNActionSheetFactory.h"
#import "ERNErrorHandler.h"

@interface ERNActionSheetAction ()
@property (nonatomic, readonly) id<ERNActionSheetFactory> factory;
@property (nonatomic, readonly) id<ERNActionSheetTransitioner> transitioner;
@end

@implementation ERNActionSheetAction {
    id<ERNActionSheetFactory> _factory;
    id<ERNActionSheetTransitioner> _transitioner;
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
    ERNCheckNilNoReturn(resource);
    [[self transitioner] transitionToActionSheet:
     [[self factory] createActionSheetForResource:resource]];
}

#pragma mark - private - accessors

ERNLazyLoadGetter(id<ERNActionSheetTransitioner>,
                  transitioner, [ERNNullActionSheetTransitioner create])

ERNLazyLoadGetter(id<ERNActionSheetFactory>,
                  factory, [ERNNullActionSheetFactory create])

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

