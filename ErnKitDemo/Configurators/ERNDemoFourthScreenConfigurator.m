#import "ERNDemoFourthScreenConfigurator.h"
#import "ERNArrayAsyncItemsRepository.h"
#import "ERNMapViewController.h"
#import "ERNActionHandlerImpl.h"
#import "ERNRoutingMapViewAnnotationViewFactory.h"
#import "ERNDemoObjectMapViewAnnotationViewFactory.h"
#import "ERNDemoObject.h"
#import "ERNDemoObject2.h"
#import "NSObject+ERNHelper.h"

@interface ERNDemoFourthScreenConfigurator ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository>repository;
@end

@implementation ERNDemoFourthScreenConfigurator
-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    return [self setupViewController:[ERNMapViewController autoZoomingViewControllerWithRepository:[self repository]
                                                                                                       actionHandler:[self actionHandler]
                                                                                                         viewFactory:[ERNRoutingMapViewAnnotationViewFactory factoryWithMappings:@{
                                                                                                                      NSStringFromClass([ERNDemoObject class]) : [ERNDemoObjectMapViewAnnotationViewFactory annotationViewFactory]}]]];
}

-(UIViewController *)setupViewController:(ERNMapViewController *)viewController
{
    [[viewController mapView] setShowsUserLocation:TRUE];
    [viewController setTitle:@"Fourth Screen"];
    return viewController;
}

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    self = [self init];
    ERNCheckNil(self);
    _repository = repository;
    return self;
}

+(instancetype)configuratorWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initWithRepository:repository];
}

@end
