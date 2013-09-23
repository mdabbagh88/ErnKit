#import <UIKit/UIKit.h>
#import "ERNViewControllerAction.h"
#import "ERNViewControllerFactory.h"
#import "ERNViewControllerTransitioner.h"
#import "ERNNullViewControllerFactory.h"
#import "ERNNullViewControllerTransitioner.h"
#import "ERNErrorHandler.h"

@interface ERNViewControllerAction ()
@property (nonatomic, readonly) id<ERNViewControllerFactory> factory;
@property (nonatomic, readonly) id<ERNViewControllerTransitioner> transitioner;
@end

@implementation ERNViewControllerAction {
    id<ERNViewControllerFactory> _factory;
    id<ERNViewControllerTransitioner> _transitioner;
}

#pragma mark - public - constructors

+(instancetype)createWithTransitioner:(id<ERNViewControllerTransitioner>)transitioner
                         factory:(id<ERNViewControllerFactory>)factory
{
    return [[self alloc] initWithTransitioner:transitioner
                                 factory:factory];
}

#pragma mark - ERNAction

-(void)actionForResource:(ERNResource *)resource
{
    ERNCheckNilNoReturn(resource);
    [[self transitioner] transitionToViewController:
     [[self factory] createViewControllerForResource:resource
                                           dismisser:[self transitioner]]];
}

#pragma mark - private - accessors

ERNLazyLoadGetter(id<ERNViewControllerTransitioner>,
                  transitioner, [ERNNullViewControllerTransitioner create])

ERNLazyLoadGetter(id<ERNViewControllerFactory>,
                  factory, [ERNNullViewControllerFactory create])

#pragma mark - private - initializers

-(id)initWithTransitioner:(id<ERNViewControllerTransitioner>)transitioner
             factory:(id<ERNViewControllerFactory>)factory
{
    self = [super init];
    ERNCheckNil(self);
    _factory = factory;
    _transitioner = transitioner;
    return self;
}

@end
