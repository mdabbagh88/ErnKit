#import "ERNDemoApplicationDelegate.h"
#import "ERNViewControllerConfigurator.h"
#import "ERNViewControllerTransitioner.h"
#import "ERNWindowViewControllerTransitioner.h"
#import "ERNDemoApplicationConfigurator.h"
#import "ERNAction.h"
#import "ERNViewControllerAction.h"

@implementation ERNDemoApplicationDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
    id<ERNViewControllerTransitioner> transitioner = [ERNWindowViewControllerTransitioner transitionerWithWindow:[self window]];
    id<ERNViewControllerConfigurator> configurator = [ERNDemoApplicationConfigurator configurator];
    id<ERNAction> action = [ERNViewControllerAction actionWithTransitioner:transitioner
                                                    configurator:configurator];
    [action actionForUrl:nil
                    mime:nil];
    [[self window] makeKeyAndVisible];
    return YES;
}

@end
