#import "ERNDemoRestKitApplicationConfigurator.h"
#import "ERNDemoTweet.h"
#import "ERNRestKitAsyncItemsRepository.h"
#import "ERNRoutingMapViewAnnotationViewFactory.h"
#import "ERNDemoTweetMapViewAnnotationViewFactory.h"
#import "ERNMapViewController.h"
#import "ERNAction.h"
#import "ERNRefreshAsyncRepositoryAction.h"
#import "ERNBarButtonItem.h"
#import <RestKit/RestKit.h>

@implementation ERNDemoRestKitApplicationConfigurator

-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    // REST url
    NSURL *twitterUrl = [NSURL URLWithString:@"http://api.twitter.com/1/statuses/user_timeline/ernstsson.json?count=100"];

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
    id<ERNAsyncItemsRepository> repository = [ERNRestKitAsyncItemsRepository asyncItemsRepositoryWithUrl:twitterUrl
                                                                                                 keyPath:@""
                                                                                                 mapping:objectMapping
                                                                                             statusCodes:statusCodes];

    // Refresh repository to ensure data when the view controller is loaded
    [repository refresh];

    // Setup an annotation view factory creating map annotations for the map view controller
    id<ERNMapViewAnnotationViewFactory> annotationViewFactory = [ERNDemoTweetMapViewAnnotationViewFactory annotationViewFactory];

    // Setup the map view controller with the RestKit repository and the annotation view factory
    UIViewController *viewController = [ERNMapViewController autoZoomingViewControllerWithRepository:repository
                                                                                       actionHandler:nil
                                                                                         viewFactory:annotationViewFactory];
    [viewController setTitle:@"Twitter Map"];

    // Setup a refresh action for the screen
    id<ERNAction> refreshAction = [ERNRefreshAsyncRepositoryAction actionWithRepository:repository];


    // Setup a button for the toolbar and wire it up with the refresh action
    ERNBarButtonItem *refreshButton = [ERNBarButtonItem barButtonItemWithSystemItem:UIBarButtonSystemItemRefresh
                                                                             action:refreshAction
                                                                                url:url
                                                                               mime:mime];
    [viewController setToolbarItems:@[refreshButton]];
    ERNBarButtonItem *refreshButton2 = [ERNBarButtonItem barButtonItemWithSystemItem:UIBarButtonSystemItemRefresh
                                                                              action:refreshAction
                                                                                 url:url
                                                                                mime:mime];
    [[viewController navigationItem] setRightBarButtonItem:refreshButton2];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [navigationController setToolbarHidden:NO];
    return navigationController;
}

+(instancetype)configurator
{
    return [[self alloc] init];
}

@end
