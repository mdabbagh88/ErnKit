#import "ERNDemoApplicationConfigurator.h"

// RestKit repository fetching data from a Twitter statuses REST endpoint
#import "ERNRestKitAsyncItemsRepository+ERNDemoTwitter.h"

// Routing repository, sending requests to the first or the rest repository, based on index
#import "ERNMergingAsyncItemsRepository.h"

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

// A configurator that sets up a map view controller showing the data from two twitter feeds
// on the map. The controller also has a refresh button, refreshing the feeds, as well as a
// feed toggler, toggling between showing feed one, feed two and both feeds at the same time.

@implementation ERNDemoApplicationConfigurator {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return [self new];
}

#pragma mark - ERNViewControllerConfigurator

-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    // First feed
    id<ERNAsyncItemsRepository> repositoryFirstFeed =
    [ERNRestKitAsyncItemsRepository createTwitterStatusesForUser:@"ernstsson"];
    // Second feed
    id<ERNAsyncItemsRepository> repositorySecondFeed =
    [ERNRestKitAsyncItemsRepository createTwitterStatusesForUser:@"jgumbley"];
    
    // Setup an async repository containing both of the feeds
    id<ERNAsyncItemsRepository> repositoryBothFeeds =
    [ERNMergingAsyncItemsRepository createWithFirstRepository:repositoryFirstFeed
                                               restRepository:repositorySecondFeed];
    
    // Setup a toggling repository that can toggle between both, first and second
    NSArray *repositories = @[repositoryBothFeeds, repositoryFirstFeed, repositorySecondFeed];
    ERNTogglingAsyncItemsRepository *repository =
    [ERNTogglingAsyncItemsRepository createWithRepositories:repositories];
    
    
    // Refresh repository to ensure data when the view controller is loaded
    [repository refresh];
    
    // Setup an annotation view factory creating map annotations for the map view controller
    id<ERNMapViewAnnotationViewFactory> annotationViewFactory =
    [ERNDemoTweetMapViewAnnotationViewFactory create];
    
    // Setup the map view controller with the RestKit repository and the annotation view factory
    ERNViewController *viewController =
    [ERNMapViewController createAutoZoomingWithRepository:repository
                                            actionHandler:nil
                                              viewFactory:annotationViewFactory];
    
    // Set a title on the view controller
    [viewController setTitle:@"Twitter Map"];
    
    // Setup a refresh action
    id<ERNAction> refreshAction = [ERNRefreshAsyncRepositoryAction createWithRepository:repository];
    
    
    // Setup a refresh button for the toolbar and wire it up with the refresh action
    UIBarButtonItem *refreshButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                  target:nil
                                                  action:nil];
    
    // Wire the refresh action with the refresh button using a bar button action controller
    ERNBarButtonItemActionController *refreshController =
    [ERNBarButtonItemActionController createWithBarButtonItem:refreshButton
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
    [ERNSegmentedControlTogglerController createWithSegmentedControl:feedSegmentedControl
                                                             toggler:repository];

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
