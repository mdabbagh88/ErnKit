#import "ERNDemoRestKitApplicationConfigurator.h"

// Tweet data model object, for mapping from json using RestKit
#import "ERNDemoTweet.h"

// RestKit repository fetching data from a REST endpoint
#import "ERNRestKitAsyncItemsRepository.h"

// Routing repository, sending requests to the first or the rest repository, based on index
#import "ERNRoutingAsyncItemsRepository.h"

// Toggling repository, redirecting repository requests between sub-repositories, based on state
#import "ERNTogglingAsyncItemsRepository.h"

// Map view annotation view factory, creating annotation views for the map based on tweet objects
#import "ERNDemoTweetMapViewAnnotationViewFactory.h"

// Map view controller showing annotations from an items repository on the screen
#import "ERNMapViewController.h"

// Refresh repository action, refreshing a repository when invoked
#import "ERNRefreshAsyncRepositoryAction.h"

// Bar button item action controller, calling its action when its button is tapped
#import "ERNBarButtonItemActionController.h"

// Segmented control toggler controller, calling its toggler with indexes as its segments are tapped
#import "ERNSegmentedControlTogglerController.h"

// RestKit itself
#import <RestKit/RestKit.h>

// A configurator that sets up a map view controller showing the data from two twitter feeds
// on the map. The controller also has a refresh button, refreshing the feeds, as well as a
// feed toggler, toggling between showing feed one, feed two and both feeds at the same time.

static NSString *url1 = @"http://api.twitter.com/1/statuses/user_timeline/ernstsson.json?count=100";
static NSString *url2 = @"http://api.twitter.com/1/statuses/user_timeline/jgumbley.json?count=100";

@implementation ERNDemoRestKitApplicationConfigurator {
}

#pragma mark - public - constructors

+(instancetype)configurator
{
    return [self new];
}

#pragma mark - ERNViewControllerConfigurator

-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    // Setup the two Twitter feed REST urls
    NSURL *twitterUrl1 = [NSURL URLWithString:url1];
    NSURL *twitterUrl2 = [NSURL URLWithString:url2];

    // Setup the RestKit object mapping for the feed data to the class ERNDemoTweet
    NSDictionary *twitterMapping = @{
                                     @"text" : @"text",
                                     @"coordinates.coordinates" : @"coordinates",
                                     @"user.profile_image_url" : @"imageUrl"
                                     };
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[ERNDemoTweet class]];
    [objectMapping addAttributeMappingsFromDictionary:twitterMapping];

    // Setup a set for the status codes the mapping should apply to, in our case 200
    NSIndexSet *statusCodes = [NSIndexSet indexSetWithIndex:200];

    // Setup an async repository with the RestKit mapping for each of the feeds
    // First feed
    id<ERNAsyncItemsRepository> repositoryFirstFeed =
    [ERNRestKitAsyncItemsRepository asyncItemsRepositoryWithUrl:twitterUrl1
                                                        keyPath:@""
                                                        mapping:objectMapping
                                                    statusCodes:statusCodes];
    // Second feed
    id<ERNAsyncItemsRepository> repositorySecondFeed =
    [ERNRestKitAsyncItemsRepository asyncItemsRepositoryWithUrl:twitterUrl2
                                                        keyPath:@""
                                                        mapping:objectMapping
                                                    statusCodes:statusCodes];
    
    // Setup an async repository containing both of the feeds
    id<ERNAsyncItemsRepository> repositoryBothFeeds =
    [ERNRoutingAsyncItemsRepository repositoryWithFirstRepository:repositoryFirstFeed
                                                   restRepository:repositorySecondFeed];

    // Setup a toggling repository that can toggle between both, first and second
    NSArray *repositories = @[repositoryBothFeeds, repositoryFirstFeed, repositorySecondFeed];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository repositoryWithRepositories:repositories];


    // Refresh repository to ensure data when the view controller is loaded
    [repository refresh];

    // Setup an annotation view factory creating map annotations for the map view controller
    id<ERNMapViewAnnotationViewFactory> annotationViewFactory =
    [ERNDemoTweetMapViewAnnotationViewFactory annotationViewFactory];

    // Setup the map view controller with the RestKit repository and the annotation view factory
    ERNViewController *viewController =
    [ERNMapViewController autoZoomingViewControllerWithRepository:repository
                                                    actionHandler:nil
                                                      viewFactory:annotationViewFactory];

    // Set a title on the view controller
    [viewController setTitle:@"Twitter Map"];

    // Setup a refresh action
    id<ERNAction> refreshAction = [ERNRefreshAsyncRepositoryAction actionWithRepository:repository];


    // Setup a refresh button for the toolbar and wire it up with the refresh action
    UIBarButtonItem *refreshButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                  target:nil
                                                  action:nil];

    // Wire the refresh action with the refresh button using a bar button action controller
    ERNBarButtonItemActionController *refreshController =
    [ERNBarButtonItemActionController controllerWithBarButtonItem:refreshButton
                                                           action:refreshAction
                                                              url:url
                                                             mime:mime];

    // Setup a segmented control used to select what feed to show
    UISegmentedControl *feedSegmentedControl =
    [[UISegmentedControl alloc] initWithItems:@[@"Both", @"Magnus", @"Jim"]];
    [feedSegmentedControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    [feedSegmentedControl setSelectedSegmentIndex:0];

    // Wire the toggling repository with the segmented control using a segmented control toggler
    // controller
    ERNSegmentedControlTogglerController *feedController =
    [ERNSegmentedControlTogglerController controllerWithSegmentedControl:feedSegmentedControl
                                                                 toggler:repository
                                                                     url:url
                                                                    mime:mime];

    // Setup the needed bar button items for the toolbar, with left and right spacing to center the
    // segmented control, as well as the segmented control itself
    // Left spacing
    UIBarButtonItem *leftSpace =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                  target:nil
                                                  action:nil];

    // Right spacing
    UIBarButtonItem *rightSpace =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                  target:nil
                                                  action:nil];

    // The centered segmented control button
    UIBarButtonItem *segmentedButtonItem =
    [[UIBarButtonItem alloc] initWithCustomView:feedSegmentedControl];

    // Setup the toolbar in the view controller, left space, segmented control, right space
    [viewController setToolbarItems:@[leftSpace, segmentedButtonItem, rightSpace]];

    // Setup the navigation bar in the view controller, the refresh button
    [[viewController navigationItem] setRightBarButtonItem:refreshButton];

    // Save the refresh and feed toggler controllers to the view controller so that they are
    // appropriately retained and released by ARC
    [viewController setSubControllers:@[refreshController, feedController]];

    // Setup a navigation controller with our view controller as root view controller
    // so that the navigation bar and toolbar is visible
    UINavigationController *navigationController =
    [[UINavigationController alloc] initWithRootViewController:viewController];
    [navigationController setToolbarHidden:NO];

    // Return the navigation controller to the system for transitioning
    return navigationController;
}

@end
