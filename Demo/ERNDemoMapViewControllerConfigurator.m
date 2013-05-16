#import "ERNDemoMapViewControllerConfigurator.h"
#import "ERNDemoTweetMapViewAnnotationViewFactory.h"
#import "ERNMapViewController.h"
#import "ERNRefreshAsyncRepositoryAction.h"
#import "ERNBarButtonItemActionController.h"
#import "ERNSegmentedControlTogglerController.h"
#import "UIViewController+ERNHelper.h"
#import "ERNErrorHandler.h"
#import "ERNAsyncItemsRepository.h"


@interface ERNDemoMapViewControllerConfigurator ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository> repository;
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
    [[self feedSegmentedControl] setSegmentedControlStyle:UISegmentedControlStyleBar];
    [[self feedSegmentedControl] setSelectedSegmentIndex:0];

    [[[self mapViewController] navigationItem] setTitleView:[self feedSegmentedControl]];
    [[[self mapViewController] navigationItem] setRightBarButtonItem:[self refreshButton]];
    [[self mapViewController] ERN_addMicroController:[self feedController]];
    [[self mapViewController] ERN_addMicroController:[self createRefreshControllerFromUrl:url
                                                                                     mime:mime]];
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
    [[UISegmentedControl alloc] initWithItems:@[@"Both", @"Magnus", @"Jim"]];
}

-(ERNSegmentedControlTogglerController *)feedController
{
    return _feedController = _feedController ?
    _feedController :
    [ERNSegmentedControlTogglerController createWithSegmentedControl:[self feedSegmentedControl]
                                                             toggler:[self toggler]];
}

-(ERNBarButtonItemActionController *)createRefreshControllerFromUrl:(NSURL *)url
                                                               mime:(NSString *)mime
{
    return [ERNBarButtonItemActionController createWithBarButtonItem:[self refreshButton]
                                                              action:[self refreshAction]
                                                                 url:url
                                                                mime:mime];
}

#pragma mark - private - initializers

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
