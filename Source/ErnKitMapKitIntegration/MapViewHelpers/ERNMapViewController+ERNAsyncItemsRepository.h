#import "ERNMapViewController.h"
#import "ERNAsyncPaginatedItemsRepository.h"
#import "ERNActionHandler.h"
#import "ERNMapViewAnnotationViewFactory.h"

@interface ERNMapViewController (ERNAsyncItemsRepository)
+(instancetype)createAutoZoomingWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                                 actionHandler:(id<ERNActionHandler>)actionHandler
                                   viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory;
+(instancetype)createWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                      actionHandler:(id<ERNActionHandler>)actionHandler
                       viewFactory:(id<ERNMapViewAnnotationViewFactory>)viewFactory;
@end
