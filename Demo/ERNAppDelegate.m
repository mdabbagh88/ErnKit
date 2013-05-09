#import "ERNAppDelegate.h"
#import "ERNWindowViewControllerTransitioner.h"
#import "ERNDemoRestKitApplicationConfigurator.h"
#import "ERNViewControllerAction.h"
#import "NSURL+ERNHelper.h"

@implementation ERNAppDelegate {
}

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Create a window for the application
    CGRect frame = [[UIScreen mainScreen] bounds];
    UIWindow *window = [UIWindow new];
    [window setFrame:frame];

    // Create the app transitioner, that will push the view controller to the window
    id<ERNViewControllerTransitioner> transitioner =
    [ERNWindowViewControllerTransitioner createWithWindow:window];

    // Create the app configurator
    id<ERNViewControllerConfigurator> configurator =
    [ERNDemoRestKitApplicationConfigurator create];

    // Create the first action, with the transitioner and configurator
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:transitioner
                                                              configurator:configurator];

    // Run the application action, creating the app root view controller, pushing it to the window
    [action actionForUrl:[NSURL createNull]
                    mime:@""];

    // Show the window
    [self setWindow:window];
    [[self window] makeKeyAndVisible];
    return YES;
}

@end
