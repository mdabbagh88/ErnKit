#import <UIKit/UIKit.h>
#import "ERNViewControllerAction.h"
#import "ERNViewControllerFactory.h"
#import "ERNViewControllerTransitioner.h"
#import "ERNErrorHandler.h"

@interface ERNViewControllerAction ()
@property (nonatomic, readonly) id<ERNViewControllerFactory> factory;
@property (nonatomic, readonly) id<ERNViewControllerTransitioner> transitioner;
@end

@implementation ERNViewControllerAction {
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
    ERNCheckNilNoReturn([self factory]);
    ERNCheckNilNoReturn([self transitioner]);
    ERNCheckNilNoReturn(resource);
    [[self transitioner] transitionToViewController:
     [[self factory] createViewControllerForResource:resource
                                           dismisser:[self transitioner]]];
}

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
