#import "ERNDemoMapViewControllerConfigurator.h"

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

// Category declaring the UIViewController method to retain sub controllers
#import "UIViewController+ERNHelper.h"

// Error handler
#import "ERNErrorHandler.h"

#import "ERNAsyncItemsRepository.h"


@interface ERNDemoMapViewControllerConfigurator ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository> repository;
@property (nonatomic, readonly) id<ERNToggler> toggler;
@end

@implementation ERNDemoMapViewControllerConfigurator {
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                            toggler:(id<ERNToggler>)toggler
{
    return [[self alloc] initWithRepository:repository
                                    toggler:toggler];
}

#pragma mark - ERNViewControllerConfigurator

-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    // Setup an annotation view factory creating map annotations for the map view controller
    id<ERNMapViewAnnotationViewFactory> annotationViewFactory =
    [ERNDemoTweetMapViewAnnotationViewFactory create];

    // Setup the map view controller with the RestKit repository and the annotation view factory
    UIViewController *mapViewController =
    [ERNMapViewController createAutoZoomingWithRepository:[self repository]
                                            actionHandler:nil
                                              viewFactory:annotationViewFactory];

    // Setup a refresh action
    id<ERNAction> refreshAction =
    [ERNRefreshAsyncRepositoryAction createWithRepository:[self repository]];


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
                                                             toggler:[self toggler]];

    // Setup the toolbar in the view controller, left space, segmented control, right space
    [[mapViewController navigationItem] setTitleView:feedSegmentedControl];

    // Setup the navigation bar in the view controller, the refresh button
    [[mapViewController navigationItem] setRightBarButtonItem:refreshButton];

    // Save the refresh and feed toggler controllers to the view controller so that they are
    // appropriately retained and released by ARC
    [mapViewController ERN_addSubController:refreshController];
    [mapViewController ERN_addSubController:feedController];

    // Return the navigation controller to the system for transitioning
    return mapViewController;
}

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
                toggler:(id<ERNToggler>)toggler
{
    self = [self init];
    ERNCheckNil(self);
    _repository = repository;
    _toggler = toggler;
    return self;
}

@end
