#import "ERNDemoFifthScreenConfigurator.h"
#import "ERNRestKitAsyncItemsRepository.h"
#import "ERNRoutingMapViewAnnotationViewFactory.h"
#import "ERNDemoTweetMapViewAnnotationViewFactory.h"
#import "ERNMapViewController.h"
#import "ERNDemoTweet.h"
#import <RestKit/RestKit.h>

@implementation ERNDemoFifthScreenConfigurator
-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    NSURL *twitterUrl = [NSURL URLWithString:@"http://api.twitter.com/1/statuses/user_timeline/ernstsson.json?count=100"];
    RKObjectMapping *statusMapping = [RKObjectMapping mappingForClass:[ERNDemoTweet class]];
    [statusMapping addAttributeMappingsFromDictionary:@{
     @"text" : @"text",
     @"coordinates.coordinates" : @"coordinates",
     @"user.profile_image_url" : @"imageUrl"
     }];

    id<ERNAsyncItemsRepository> repository = [ERNRestKitAsyncItemsRepository asyncItemsRepositoryWithUrl:twitterUrl
                                                                                                 keyPath:@""
                                                                                                 mapping:statusMapping
                                                                                             statusCodes:[NSIndexSet indexSetWithIndex:200]];
    [repository refresh];
    return [self setupViewController:[ERNMapViewController autoZoomingViewControllerWithRepository:repository
                                      actionHandler:nil
                                                                                       viewFactory:[ERNRoutingMapViewAnnotationViewFactory factoryWithMappings:@{NSStringFromClass([ERNDemoTweet class]) : [ERNDemoTweetMapViewAnnotationViewFactory annotationViewFactory]}]]];
}

-(UIViewController *)setupViewController:(ERNMapViewController *)viewController
{
    [viewController setTitle:@"Fifth Screen"];
    return viewController;
}

+(instancetype)configurator
{
    return [self new];
}

@end
