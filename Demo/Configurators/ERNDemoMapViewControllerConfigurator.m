#import <ErnKit/ERNMapViewMicroController.h>
#import <ErnKit/ERNRefreshAsyncRepositoryAction.h>
#import <ErnKit/ERNBarButtonItemActionController.h>
#import <ErnKit/ERNSegmentedControlTogglerController.h>
#import <ErnKit/UIViewController+ERNHelper.h>
#import <ErnKit/ERNErrorHandler.h>
#import <ErnKit/ERNAsyncPaginatedItemsRepository.h>
#import "ERNDemoMapViewControllerConfigurator.h"
#import "ERNDemoTweetMapViewAnnotationViewFactory.h"
#import "ERNHideNavigationBarOnUncaughtTapController.h"
#import "UIViewController+ERNHelper.h"

@interface ERNDemoMapViewControllerConfigurator ()
@property (nonatomic, readonly) id<ERNAsyncPaginatedItemsRepository> repository;
@property (nonatomic, readonly) id<ERNToggler> toggler;
@end

@implementation ERNDemoMapViewControllerConfigurator {
    id<ERNAction> _refreshAction;
    UIBarButtonItem *_refreshButton;
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                            toggler:(id<ERNToggler>)toggler
{
    return [[self alloc] initWithRepository:repository
                                    toggler:toggler];
}

#pragma mark - ERNViewControllerConfigurator

-(UIViewController *)createViewControllerForResource:(ERNResource *)resource
                                           dismisser:(id<ERNViewControllerDismisser>)dismisser
{
    UIViewController *viewController = [UIViewController new];

    UISegmentedControl *feedSegmentedControl =
    [[UISegmentedControl alloc] initWithItems:@[@"Both", @"Demo", @"Demo Two"]];
    [feedSegmentedControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    [feedSegmentedControl setSelectedSegmentIndex:0];

    ERNSegmentedControlTogglerController *feedController =
    [ERNSegmentedControlTogglerController createWithSegmentedControl:feedSegmentedControl
                                                             toggler:[self toggler]];

    ERNMapViewMicroController *mapViewMicroController =
    [ERNMapViewMicroController createWithMapViewDelegate:
     [ERNMapViewDelegate createWithActionHandler:[ERNNullActionHandler create]
                                     viewFactory:[ERNDemoTweetMapViewAnnotationViewFactory create]]
                                               superView:[viewController view]];

    ERNMapViewRepositoryRefreshController *refreshActionController =
    [ERNMapViewRepositoryRefreshController createAutoZoomingWithMapView:[mapViewMicroController mapView]
                                                             repository:[self repository]];

    UIBarButtonItem *refreshButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                  target:nil
                                                  action:nil];
    id<ERNAction> refreshAction =
    [ERNRefreshAsyncRepositoryAction createWithRepository:[self repository]];

    ERNBarButtonItemActionController *refreshButtonController =
    [ERNBarButtonItemActionController createWithBarButtonItem:refreshButton
                                                       action:refreshAction
                                                     resource:resource];

    [[viewController navigationItem] setTitleView:feedSegmentedControl];
    [[viewController navigationItem] setRightBarButtonItem:refreshButton];
    [viewController ERN_addMicroController:feedController];
    [viewController ERN_addMicroController:refreshButtonController];
    [viewController ERN_addMicroController:refreshActionController];
    [viewController ERN_addMicroController:mapViewMicroController];
    ERNHideNavigationBarOnUncaughtTapController *tapController =
    [ERNHideNavigationBarOnUncaughtTapController createWithViewController:viewController];
    [viewController ERN_addMicroController:tapController];
    return viewController;
}
#pragma mark - private - initializers

-(id)initWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                toggler:(id<ERNToggler>)toggler
{
    self = [self init];
    ERNCheckNil(self);
    _repository = repository;
    _toggler = toggler;
    return self;
}

@end
