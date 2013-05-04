#import "ERNDemoApplicationDelegate.h"
#import "ERNWindowViewControllerTransitioner.h"
#import "ERNDemoApplicationConfigurator.h"
#import "ERNViewControllerAction.h"
#import "NSURL+ERNHelper.h"

@implementation ERNDemoApplicationDelegate

-(BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
    [[ERNViewControllerAction actionWithTransitioner:[ERNWindowViewControllerTransitioner transitionerWithWindow:[self window]]
                                        configurator:[ERNDemoApplicationConfigurator configurator]]
     actionForUrl:[NSURL nullURL] mime:@""];
    [[self window] makeKeyAndVisible];
    return YES;
}

-(void)applicationDidEnterBackground:(UIApplication *)application
{
    UINavigationController *nav = (UINavigationController *)[[self window] rootViewController];
    UIViewController *vc = [[UIViewController alloc] init];
    [nav setViewControllers:@[vc]];
}

-(void)applicationWillEnterForeground:(UIApplication *)application
{
    [[ERNViewControllerAction actionWithTransitioner:[ERNWindowViewControllerTransitioner transitionerWithWindow:[self window]]
                                        configurator:[ERNDemoApplicationConfigurator configurator]]
     actionForUrl:[NSURL nullURL] mime:@""];
}

@end
