#import <UIKit/UIKit.h>
#import "ERNViewControllerAction.h"
#import "ERNViewControllerConfigurator.h"
#import "ERNViewControllerTransitioner.h"
#import "ERNErrorHandler.h"

@interface ERNViewControllerAction ()
@property (nonatomic, readonly) id<ERNViewControllerConfigurator> configurator;
@property (nonatomic, readonly) id<ERNViewControllerTransitioner> transitioner;
@end

@implementation ERNViewControllerAction {
}

#pragma mark - public - constructors

+(instancetype)createWithTransitioner:(id<ERNViewControllerTransitioner>)transitioner
                         configurator:(id<ERNViewControllerConfigurator>)configurator
{
    return [[self alloc] initWithTransitioner:transitioner
                                 configurator:configurator];
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
    ERNCheckNilNoReturn([self configurator]);
    ERNCheckNilNoReturn([self transitioner]);
    ERNCheckNilNoReturn(resource);
    [[self transitioner] transitionToViewController:
     [[self configurator] createViewControllerForResource:resource
                                           dismisser:[self transitioner]]];
}

#pragma mark - private - initializers

-(id)initWithTransitioner:(id<ERNViewControllerTransitioner>)transitioner
             configurator:(id<ERNViewControllerConfigurator>)configurator
{
    self = [super init];
    ERNCheckNil(self);
    _configurator = configurator;
    _transitioner = transitioner;
    return self;
}

@end
