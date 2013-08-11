#import <UIKit/UIKit.h>
#import "ERNDefaultAsyncPaginatedItemsRepository+ERNDemoTwitter.h"
#import "ERNDemoApplicationConfigurator.h"
#import "ERNDemoMapViewControllerConfigurator.h"
#import "ERNDemoTableViewControllerConfigurator.h"
#import "ERNResource.h"

@implementation ERNDemoApplicationConfigurator {
    id<ERNAsyncPaginatedItemsRepository> _repositorySecondFeed;
}

#pragma mark - public - constructors

+(instancetype)create
{
    return [self new];
}

#pragma mark - ERNViewControllerConfigurator

-(UIViewController *)createViewControllerForResource:(ERNResource *)resource
                                           dismisser:(id<ERNViewControllerDismisser>)dismisser
{
    UINavigationController *navigationControllerMapTab = [UINavigationController new];
    UINavigationController *navigationControllerTableTab = [UINavigationController new];

    UITabBarController *tabBarController = [UITabBarController new];
    [tabBarController setViewControllers:@[navigationControllerMapTab,
                                           navigationControllerTableTab]];

    id<ERNAsyncPaginatedItemsRepository> repositoryFirstFeed =
    [ERNDefaultAsyncPaginatedItemsRepository createTwitterStatusesForUser:@"demo"];

    id<ERNAsyncPaginatedItemsRepository>repositorySecondFeed =
    [ERNDefaultAsyncPaginatedItemsRepository createTwitterStatusesForUser:@"demotwo"];

    id<ERNAsyncPaginatedItemsRepository> repositoryBothFeeds =
    [ERNMergingAsyncPaginatedItemsRepository createWithFirstRepository:repositoryFirstFeed
                                                        restRepository:repositorySecondFeed];

    NSArray *repositories = @[repositoryBothFeeds,
                              repositoryFirstFeed,
                              repositorySecondFeed];

    ERNTogglingAsyncPaginatedItemsRepository *repository =
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:repositories];

    id<ERNViewControllerConfigurator> tableConfigurator =
    [ERNDemoTableViewControllerConfigurator createWithRepository:repository
                                                         toggler:repository];

    id<ERNViewControllerTransitioner> navigationTransitionerTableTab =
    [ERNNavigationViewControllerTransitioner createWithNavigationController:
     navigationControllerTableTab];

    id<ERNAction> tableAction =
    [ERNViewControllerAction createWithTransitioner:navigationTransitionerTableTab
                                       configurator:tableConfigurator];

    id<ERNViewControllerConfigurator> mapConfigurator =
    [ERNDemoMapViewControllerConfigurator createWithRepository:repository
                                                       toggler:repository];

    id<ERNViewControllerTransitioner> navigationTransitionerMapTab =
    [ERNNavigationViewControllerTransitioner createWithNavigationController:navigationControllerMapTab];

    id<ERNAction> mapAction =
    [ERNViewControllerAction createWithTransitioner:navigationTransitionerMapTab
                                       configurator:mapConfigurator];

    [mapAction actionForResource:resource];
    [tableAction actionForResource:resource];
    [navigationControllerMapTab setTitle:@"Map"];
    [navigationControllerTableTab setTitle:@"Table"];
    [repository refresh];
    return tabBarController;
}

@end
