#import <UIKit/UIKit.h>
#import "ERNDefaultAsyncPaginatedItemsRepository+ERNDemoTwitter.h"
#import "ERNDemoApplicationConfigurator.h"
#import "ERNDemoMapViewControllerConfigurator.h"
#import "ERNDemoTableViewControllerConfigurator.h"
#import "ERNResource.h"

@implementation ERNDemoApplicationConfigurator {
    id<ERNAsyncPaginatedItemsRepository> _repositoryFirstFeed;
    id<ERNAsyncPaginatedItemsRepository> _repositorySecondFeed;
    id<ERNAsyncPaginatedItemsRepository> _repositoryBothFeeds;
    ERNTogglingAsyncPaginatedItemsRepository *_repository;
    UINavigationController *_navigationControllerMapTab;
    UINavigationController *_navigationControllerTableTab;
    UITabBarController *_tabBarController;
    id<ERNViewControllerTransitioner> _navigationTransitionerMapTab;
    id<ERNViewControllerTransitioner> _navigationTransitionerTableTab;
    id<ERNViewControllerConfigurator> _configuratorMap;
    id<ERNViewControllerConfigurator> _configuratorTable;
    id<ERNAction> _actionMap;
    id<ERNAction> _actionTable;
    NSArray *_repositories;
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
    [[self repository] refresh];

    [[self actionMap] actionForResource:resource];

    [[self actionTable] actionForResource:resource];

    [[self navigationControllerMapTab] setTitle:@"Map"];
    [[self navigationControllerTableTab] setTitle:@"Table"];

    [[self tabBarController] setViewControllers:@[
    [self navigationControllerMapTab],
     [self navigationControllerTableTab]]
     ];

   return [self tabBarController];
}

#pragma mark - private - accessors

-(id<ERNAsyncPaginatedItemsRepository>)repositoryFirstFeed
{
    return _repositoryFirstFeed = _repositoryFirstFeed ?
    _repositoryFirstFeed : [ERNDefaultAsyncPaginatedItemsRepository
                            createTwitterStatusesForUser:@"demo"];
}

-(id<ERNAsyncPaginatedItemsRepository>)repositorySecondFeed
{
    return _repositorySecondFeed = _repositorySecondFeed ?
    _repositorySecondFeed :[ERNDefaultAsyncPaginatedItemsRepository
                            createTwitterStatusesForUser:@"demotwo"];
}

-(id<ERNAsyncPaginatedItemsRepository>)repositoryBothFeeds
{
    return _repositoryBothFeeds = _repositoryBothFeeds ?
    _repositoryBothFeeds :
    [ERNMergingAsyncPaginatedItemsRepository createWithFirstRepository:[self repositoryFirstFeed]
                                               restRepository:[self repositorySecondFeed]];
}

-(NSArray *)repositories
{
    return _repositories = _repositories ?
    _repositories :
    @[[self repositoryBothFeeds],
      [self repositoryFirstFeed],
      [self repositorySecondFeed]];
}

-(ERNTogglingAsyncPaginatedItemsRepository *)repository
{
    return _repository = _repository ?
    _repository :
    [ERNTogglingAsyncPaginatedItemsRepository createWithRepositories:[self repositories]];
}

-(UINavigationController *)navigationControllerMapTab
{
   return _navigationControllerMapTab = _navigationControllerMapTab ?
    _navigationControllerMapTab :
    [UINavigationController new];
}

-(UINavigationController *)navigationControllerTableTab
{
   return _navigationControllerTableTab = _navigationControllerTableTab ?
    _navigationControllerTableTab :
    [UINavigationController new];
}

-(id<ERNViewControllerTransitioner>)navigationTransitionerMapTab
{
   return _navigationTransitionerMapTab = _navigationTransitionerMapTab ?
    _navigationTransitionerMapTab :
    [ERNNavigationViewControllerTransitioner
     createWithNavigationController:[self navigationControllerMapTab]];
}

-(id<ERNViewControllerTransitioner>)navigationTransitionerTableTab
{
   return _navigationTransitionerTableTab = _navigationTransitionerTableTab ?
    _navigationTransitionerTableTab :
    [ERNNavigationViewControllerTransitioner
     createWithNavigationController:[self navigationControllerTableTab]];
}

-(id<ERNViewControllerConfigurator>)configuratorMap
{
   return _configuratorMap = _configuratorMap ?
    _configuratorMap :
    [ERNDemoMapViewControllerConfigurator createWithRepository:[self repository]
                                                       toggler:[self repository]];
}

-(id<ERNViewControllerConfigurator>)configuratorTable
{
   return _configuratorTable = _configuratorTable ?
    _configuratorTable :
    [ERNDemoTableViewControllerConfigurator createWithRepository:[self repository]
                                                         toggler:[self repository]];
}

-(id<ERNAction>)actionMap
{
   return _actionMap = _actionMap ?
    _actionMap :
    [ERNViewControllerAction createWithTransitioner:[self navigationTransitionerMapTab]
                                       configurator:[self configuratorMap]];
}

-(id<ERNAction>)actionTable
{
   return _actionTable = _actionTable ?
    _actionTable :
    [ERNViewControllerAction createWithTransitioner:[self navigationTransitionerTableTab]
                                       configurator:[self configuratorTable]];
}

-(UITabBarController *)tabBarController
{
    return _tabBarController = _tabBarController ?
    _tabBarController :
    [UITabBarController new];
}

@end
