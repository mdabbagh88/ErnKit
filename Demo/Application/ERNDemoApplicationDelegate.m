#import <ErnKit/ErnKit.h>
#import <ErnKit/UIKitIntegration.h>
#import "ERNDemoApplicationDelegate.h"
#import "ERNDemoApplicationFactory.h"

@implementation ERNDemoApplicationDelegate {
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

    // Create the app factory
    id<ERNViewControllerFactory> factory =
    [ERNDemoApplicationFactory create];

    // Create the first action, with the transitioner and factory
    id<ERNAction> action = [ERNViewControllerAction createWithTransitioner:transitioner
                                                              factory:factory];

    // Run the application action, creating the app root view controller, pushing it to the window
    [action actionForResource:[ERNResource createWithUrl:[NSURL ERN_createNull]
                                                    mime:@""]];

    // Show the window
    [self setWindow:window];
    [[self window] makeKeyAndVisible];
    return YES;
}

@end
