#import "ERNDemoRestKitApplicationConfigurator.h"
#import "ERNDemoTweet.h"
#import "ERNRestKitAsyncItemsRepository.h"
#import "ERNRoutingMapViewAnnotationViewFactory.h"
#import "ERNDemoTweetMapViewAnnotationViewFactory.h"
#import "ERNMapViewController.h"
#import <RestKit/RestKit.h>

static NSURL *gTwitterUrl;
static NSDictionary *gTwitterMapping;

@implementation ERNDemoRestKitApplicationConfigurator

-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    id<ERNAsyncItemsRepository> repository = [self setupRepository:[self createRepository]];
    return [self setupViewController:[self createViewControllerWithRepository:repository]];
}

-(id<ERNAsyncItemsRepository>)createRepository
{
    RKObjectMapping *objectMapping = [self setupObjectMapping:[self createObjectMapping]];
    return [ERNRestKitAsyncItemsRepository asyncItemsRepositoryWithUrl:gTwitterUrl
                                                               keyPath:@""
                                                               mapping:objectMapping
                                                           statusCodes:[NSIndexSet indexSetWithIndex:200]];
}

-(RKObjectMapping *)createObjectMapping
{
    return [RKObjectMapping mappingForClass:[ERNDemoTweet class]];
}

-(RKObjectMapping *)setupObjectMapping:(RKObjectMapping *)objectMapping
{
    [objectMapping addAttributeMappingsFromDictionary:gTwitterMapping];
    return objectMapping;
}

-(id<ERNAsyncItemsRepository>)setupRepository:(id<ERNAsyncItemsRepository>)repository
{
    [repository refresh];
    return repository;
}

-(ERNMapViewController *)createViewControllerWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    return [ERNMapViewController autoZoomingViewControllerWithRepository:repository
                                                           actionHandler:nil
                                                             viewFactory:[ERNRoutingMapViewAnnotationViewFactory factoryWithMappings:[self annotationViewFactoryMapping]]];
}

-(NSDictionary *)annotationViewFactoryMapping
{
    return @{
             NSStringFromClass([ERNDemoTweet class]) :
                 [ERNDemoTweetMapViewAnnotationViewFactory annotationViewFactory]};
}

-(UIViewController *)setupViewController:(ERNMapViewController *)viewController
{
    [viewController setTitle:@"Twitter Map"];
    return viewController;
}

+(instancetype)configurator
{
    return [[self alloc] init];
}

+(void)initialize
{
    gTwitterUrl = [NSURL URLWithString:@"http://api.twitter.com/1/statuses/user_timeline/ernstsson.json?count=100"];
    gTwitterMapping = @{
                        @"text" : @"text",
                        @"coordinates.coordinates" : @"coordinates",
                        @"user.profile_image_url" : @"imageUrl"
                        };
}

@end
