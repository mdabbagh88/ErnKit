#import "ERNDemoRestKitApplicationConfigurator.h"
#import "ERNDemoTweet.h"
#import "ERNRestKitAsyncItemsRepository.h"
#import "ERNRoutingMapViewAnnotationViewFactory.h"
#import "ERNDemoTweetMapViewAnnotationViewFactory.h"
#import "ERNMapViewController.h"
#import "ERNAction.h"
#import "ERNRefreshAsyncRepositoryAction.h"
#import "ERNBarButtonItemActionController.h"
#import "ERNTogglingRepository.h"
#import "ERNRoutingAsyncItemsRepository.h"
#import "ERNSegmentedControlTogglerController.h"
#import <RestKit/RestKit.h>

@implementation ERNDemoRestKitApplicationConfigurator

-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    // REST url
    NSURL *twitterUrl1 = [NSURL URLWithString:@"http://api.twitter.com/1/statuses/user_timeline/ernstsson.json?count=100"];
    NSURL *twitterUrl2 = [NSURL URLWithString:@"http://api.twitter.com/1/statuses/user_timeline/jgumbley.json?count=100"];

    // RestKit object mapping
    NSDictionary *twitterMapping = @{
                                     @"text" : @"text",
                                     @"coordinates.coordinates" : @"coordinates",
                                     @"user.profile_image_url" : @"imageUrl"
                                     };
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[ERNDemoTweet class]];
    [objectMapping addAttributeMappingsFromDictionary:twitterMapping];

    // RestKit status codes
    NSIndexSet *statusCodes = [NSIndexSet indexSetWithIndex:200];

    // Setup an async repository with RestKit data
    id<ERNAsyncItemsRepository> repository1 = [ERNRestKitAsyncItemsRepository asyncItemsRepositoryWithUrl:twitterUrl1
                                                                                                  keyPath:@""
                                                                                                  mapping:objectMapping
                                                                                              statusCodes:statusCodes];

    id<ERNAsyncItemsRepository> repository2 = [ERNRestKitAsyncItemsRepository asyncItemsRepositoryWithUrl:twitterUrl2
                                                                                                  keyPath:@""
                                                                                                  mapping:objectMapping
                                                                                              statusCodes:statusCodes];
    id<ERNAsyncItemsRepository> repository3 = [ERNRoutingAsyncItemsRepository repositoryWithFirstRepository:repository1
                                                                                             restRepository:repository2];

    // Refresh repository to ensure data when the view controller is loaded

    NSArray *repositories = @[repository1, repository2, repository3];
    ERNTogglingRepository *repository = [ERNTogglingRepository repositoryWithRepositories:repositories];

    [repository refresh];

    // Setup an annotation view factory creating map annotations for the map view controller
    id<ERNMapViewAnnotationViewFactory> annotationViewFactory = [ERNDemoTweetMapViewAnnotationViewFactory annotationViewFactory];

    // Setup the map view controller with the RestKit repository and the annotation view factory
    ERNViewController *viewController = [ERNMapViewController autoZoomingViewControllerWithRepository:repository
                                                                                        actionHandler:nil
                                                                                          viewFactory:annotationViewFactory];
    [viewController setTitle:@"Twitter Map"];

    // Setup a refresh action for the screen
    id<ERNAction> refreshAction = [ERNRefreshAsyncRepositoryAction actionWithRepository:repository];


    // Setup a button for the toolbar and wire it up with the refresh action
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                           target:nil
                                                                                           action:nil];
    ERNBarButtonItemActionController *refreshController = [ERNBarButtonItemActionController controllerWithBarButtonItem:refreshButton
                                                           action:refreshAction
                                                              url:url
                                                             mime:mime];

    UISegmentedControl *feedSegmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Magnus", @"Jim", @"Both"]];
    [feedSegmentedControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    [feedSegmentedControl setSelectedSegmentIndex:0];
    ERNSegmentedControlTogglerController *feedController = [ERNSegmentedControlTogglerController controllerWithSegmentedControl:feedSegmentedControl
                                                                                                                        toggler:repository
                                                                                                                            url:url
                                                                                                                           mime:mime];
    UIBarButtonItem *leftSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *rightSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *segmentedButtonItem = [[UIBarButtonItem alloc] initWithCustomView:feedSegmentedControl];

    [viewController setToolbarItems:@[leftSpace, segmentedButtonItem, rightSpace]];
    [[viewController navigationItem] setRightBarButtonItem:refreshButton];
    [viewController setSubControllers:@[refreshController, feedController]];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [navigationController setToolbarHidden:NO];
    return navigationController;
}

+(instancetype)configurator
{
    return [[self alloc] init];
}

@end
