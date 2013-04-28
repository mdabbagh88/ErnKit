#import "ERNDemoApplicationDelegate.h"
#import "ERNViewControllerConfigurator.h"
#import "ERNViewControllerTransitioner.h"
#import "ERNWindowViewControllerTransitioner.h"
#import "ERNDemoApplicationConfigurator.h"
#import "ERNAction.h"
#import "ERNViewControllerAction.h"

@implementation ERNDemoApplicationDelegate

-(BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setWindow:[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]];
    [[ERNViewControllerAction actionWithTransitioner:[ERNWindowViewControllerTransitioner transitionerWithWindow:[self window]]
                                        configurator:[ERNDemoApplicationConfigurator configurator]]
     actionForUrl:[NSURL URLWithString:@""] mime:@""];
    [[self window] makeKeyAndVisible];
    return YES;
}

@end
