#import "ERNAppDelegate.h"
#import "ERNWindowViewControllerTransitioner.h"
#import "ERNDemoRestKitApplicationConfigurator.h"
#import "ERNViewControllerAction.h"

@implementation ERNAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
    [[ERNViewControllerAction actionWithTransitioner:[ERNWindowViewControllerTransitioner transitionerWithWindow:[self window]]
                                        configurator:[ERNDemoRestKitApplicationConfigurator configurator]]
     actionForUrl:[NSURL URLWithString:@""] mime:@""];
    [[self window] makeKeyAndVisible];
    return YES;
}

@end
