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
    [[ERNViewControllerAction createWithTransitioner:[ERNWindowViewControllerTransitioner createWithWindow:[self window]]
                                        configurator:[ERNDemoApplicationConfigurator configurator]]
     actionForUrl:[NSURL createNull] mime:@""];
    [[self window] makeKeyAndVisible];
    return YES;
}

-(void)applicationDidEnterBackground:(UIApplication *)application
{
    UINavigationController *nav = (UINavigationController *)[[self window] rootViewController];
    UIViewController *vc = [UIViewController new];
    [nav setViewControllers:@[vc]];
}

-(void)applicationWillEnterForeground:(UIApplication *)application
{
    [[ERNViewControllerAction createWithTransitioner:[ERNWindowViewControllerTransitioner createWithWindow:[self window]]
                                        configurator:[ERNDemoApplicationConfigurator configurator]]
     actionForUrl:[NSURL createNull] mime:@""];
}

@end
