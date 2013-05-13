#import "ERNDemoApplicationConfigurator.h"

// RestKit repository fetching data from a Twitter statuses REST endpoint
#import "ERNRestKitAsyncItemsRepository+ERNDemoTwitter.h"

// Routing repository, sending requests to the first or the rest repository, based on index
#import "ERNMergingAsyncItemsRepository.h"

// Toggling repository, redirecting repository requests between sub-repositories, based on state
#import "ERNTogglingAsyncItemsRepository.h"

#import "ERNNavigationViewControllerTransitioner.h"

#import "ERNDemoMapViewControllerConfigurator.h"

#import "ERNDemoTableViewControllerConfigurator.h"

#import "ERNViewControllerAction.h"

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

    UINavigationController *navigationController1 = [UINavigationController new];
    id<ERNViewControllerTransitioner> navigationTransitioner1 =
    [ERNNavigationViewControllerTransitioner createWithNavigationController:navigationController1];

    UINavigationController *navigationController2 = [UINavigationController new];
    id<ERNViewControllerTransitioner> navigationTransitioner2 =
    [ERNNavigationViewControllerTransitioner createWithNavigationController:navigationController2];

    id<ERNViewControllerConfigurator> mapConfigurator =
    [ERNDemoMapViewControllerConfigurator createWithRepository:repository
                                                       toggler:repository];

    id<ERNViewControllerConfigurator> tableConfigurator =
    [ERNDemoTableViewControllerConfigurator createWithRepository:repository
                                                         toggler:repository];

    id<ERNAction> mapAction =
    [ERNViewControllerAction createWithTransitioner:navigationTransitioner1
                                       configurator:mapConfigurator];

    id<ERNAction> tableAction =
    [ERNViewControllerAction createWithTransitioner:navigationTransitioner2
                                       configurator:tableConfigurator];

    [mapAction actionForUrl:url
                       mime:mime];

    [tableAction actionForUrl:url
                         mime:mime];

    [navigationController1 setTitle:@"Map"];
    [navigationController2 setTitle:@"Table"];

    UITabBarController *tabBarController = [UITabBarController new];
    [tabBarController setViewControllers:@[navigationController1, navigationController2]];

    // Return the navigation controller to the system for transitioning
    return tabBarController;
}

@end
