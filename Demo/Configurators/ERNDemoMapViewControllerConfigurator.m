#import <ErnKit/ERNMapViewController.h>
#import <ErnKit/ERNMapViewController+ERNAsyncItemsRepository.h>
#import <ErnKit/ERNRefreshAsyncRepositoryAction.h>
#import <ErnKit/ERNBarButtonItemActionController.h>
#import <ErnKit/ERNSegmentedControlTogglerController.h>
#import <ErnKit/UIViewController+ERNHelper.h>
#import <ErnKit/ERNErrorHandler.h>
#import <ErnKit/ERNAsyncPaginatedItemsRepository.h>
#import "ERNDemoMapViewControllerConfigurator.h"
#import "ERNDemoTweetMapViewAnnotationViewFactory.h"

@interface ERNDemoMapViewControllerConfigurator ()
@property (nonatomic, readonly) id<ERNAsyncPaginatedItemsRepository> repository;
@property (nonatomic, readonly) id<ERNToggler> toggler;
@end

@implementation ERNDemoMapViewControllerConfigurator {
    id<ERNMapViewAnnotationViewFactory> _annotationViewFactory;
    UIViewController *_mapViewController;
    id<ERNAction> _refreshAction;
    UIBarButtonItem *_refreshButton;
    UISegmentedControl *_feedSegmentedControl;
    ERNSegmentedControlTogglerController *_feedController;
    ERNBarButtonItemActionController *_refreshController;
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
    [[self feedSegmentedControl] setSegmentedControlStyle:UISegmentedControlStyleBar];
    [[self feedSegmentedControl] setSelectedSegmentIndex:0];
    
    [[[self mapViewController] navigationItem] setTitleView:[self feedSegmentedControl]];
    [[[self mapViewController] navigationItem] setRightBarButtonItem:[self refreshButton]];
    [[self mapViewController] ERN_addMicroController:[self feedController]];
    [[self mapViewController] ERN_addMicroController:
     [self createRefreshControllerFromResource:resource]];
    return [self mapViewController];
}

#pragma mark - private - accessors

-(id<ERNMapViewAnnotationViewFactory>)annotationViewFactory
{
    return _annotationViewFactory = _annotationViewFactory ?
    _annotationViewFactory :
    [ERNDemoTweetMapViewAnnotationViewFactory create];
}

-(UIViewController *)mapViewController
{
    return _mapViewController = _mapViewController ?
    _mapViewController :
    [ERNMapViewController createAutoZoomingWithRepository:[self repository]
                                            actionHandler:nil
                                              viewFactory:[self annotationViewFactory]];
}

-(id<ERNAction>)refreshAction
{
    return _refreshAction = _refreshAction ?
    _refreshAction :
    [ERNRefreshAsyncRepositoryAction createWithRepository:[self repository]];
}

-(UIBarButtonItem *)refreshButton
{
    return _refreshButton = _refreshButton ?
    _refreshButton :
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                  target:nil
                                                  action:nil];
}

-(UISegmentedControl *)feedSegmentedControl
{
    return _feedSegmentedControl = _feedSegmentedControl ?
    _feedSegmentedControl :
    [[UISegmentedControl alloc] initWithItems:@[@"Both", @"Demo", @"Demo Two"]];
}

-(ERNSegmentedControlTogglerController *)feedController
{
    return _feedController = _feedController ?
    _feedController :
    [ERNSegmentedControlTogglerController createWithSegmentedControl:[self feedSegmentedControl]
                                                             toggler:[self toggler]];
}

-(ERNBarButtonItemActionController *)createRefreshControllerFromResource:(ERNResource *)resource
{
    return [ERNBarButtonItemActionController createWithBarButtonItem:[self refreshButton]
                                                              action:[self refreshAction]
                                                            resource:resource];
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
