#import <UIKit/UIKit.h>
#import "ERNViewControllerAction.h"
#import "ERNViewControllerConfigurator.h"
#import "ERNViewControllerTransitioner.h"
#import "NSObject+ERNHelper.h"

@interface ERNViewControllerAction ()
@property (nonatomic, readonly) id<ERNViewControllerConfigurator> configurator;
@property (nonatomic, readonly) id<ERNViewControllerTransitioner> transitioner;
@end

@implementation ERNViewControllerAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    [[self transitioner] transitionToViewController:[[self configurator] createViewControllerForUrl:url
                                                                                               mime:mime]];
}

-(id)initWithTransitioner:(id<ERNViewControllerTransitioner>)transitioner
             configurator:(id<ERNViewControllerConfigurator>)configurator
{
    self = [self init];
    ERNCheckNil(self);
    _configurator = configurator;
    _transitioner = transitioner;
    return self;
}

+(instancetype)actionWithTransitioner:(id<ERNViewControllerTransitioner>)transitioner
                         configurator:(id<ERNViewControllerConfigurator>)configurator
{
    return [[self alloc] initWithTransitioner:transitioner
                                 configurator:configurator];
}

@end
