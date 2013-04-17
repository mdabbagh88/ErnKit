#import "ERNViewControllerAction.h"
#import "ERNViewControllerConfigurator.h"
#import "ERNViewControllerTransitioner.h"

@interface ERNViewControllerAction ()
@property (nonatomic, readonly) id<ERNViewControllerConfigurator> configurator;
@property (nonatomic, readonly) id<ERNViewControllerTransitioner> transitioner;
@end

@implementation ERNViewControllerAction

-(void)actionForUrl:(NSURL *)url
               mime:(NSString *)mime
{
    UIViewController *viewController = [[self configurator] createViewControllerForUrl:url
                                                                                  mime:mime];
    [[self transitioner] transitionToViewController:viewController];
}

-(id)initWithTransitioner:(id<ERNViewControllerTransitioner>)transitioner
             configurator:(id<ERNViewControllerConfigurator>)configurator
{
    self = [super init];
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
