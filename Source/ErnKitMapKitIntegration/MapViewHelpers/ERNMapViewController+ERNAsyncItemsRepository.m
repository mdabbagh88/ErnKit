#import "ERNMapViewController+ERNAsyncItemsRepository.h"
#import "ERNMapViewDelegate.h"
#import "ERNMapViewRepositoryRefreshController.h"
#import "UIViewController+ERNHelper.h"

@implementation ERNMapViewController (ERNAsyncItemsRepository)

+(instancetype)createAutoZoomingWithRepository:(id<ERNAsyncItemsRepository>)repository
                                 actionHandler:(id<ERNActionHandler>)actionHandler
                                   viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory
{
    ERNMapViewController *mapViewController =
    [ERNMapViewController createWithMapViewDelegate:
     [ERNMapViewDelegate createWithActionHandler:actionHandler
                                     viewFactory:viewFactory]];
    ERNMapViewRepositoryRefreshController *controller =
    [ERNMapViewRepositoryRefreshController
     createAutoZoomingWithMapView:[mapViewController mapView]
     repository:repository];
     [mapViewController ERN_addMicroController:controller];
     return mapViewController;
}

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                      actionHandler:(id<ERNActionHandler>)actionHandler
                        viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory
{
    ERNMapViewController *mapViewController =
    [ERNMapViewController createWithMapViewDelegate:
     [ERNMapViewDelegate createWithActionHandler:actionHandler
                                     viewFactory:viewFactory]];
     ERNMapViewRepositoryRefreshController *controller =
    [ERNMapViewRepositoryRefreshController
     createWithMapView:[mapViewController mapView]
     repository:repository];
     [mapViewController ERN_addMicroController:controller];
     return mapViewController;}

@end
