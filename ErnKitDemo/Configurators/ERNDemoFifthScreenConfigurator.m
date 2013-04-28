#import "ERNDemoFifthScreenConfigurator.h"
#import "ERNRestKitAsyncItemsRepository.h"
#import "ERNMapViewController.h"
#import "ERNDemoTweet.h"

@implementation ERNDemoFifthScreenConfigurator
-(UIViewController *)createViewControllerForUrl:(NSURL *)url
                                           mime:(NSString *)mime
{
    NSURL *twitterUrl = [NSURL URLWithString:@"https://twitter.com/status/user_timeline/ernstsson?format=json"];
    RKObjectMapping *statusMapping = [RKObjectMapping mappingForClass:[ERNDemoTweet class]];
    [statusMapping addAttributeMappingsFromDictionary:@{
     @"id" : @"statusID",
     @"created_at" : @"createdAt",
     @"text" : @"text",
     @"url" : @"urlString",
     @"in_reply_to_screen_name" : @"inReplyToScreenName",
     @"favorited" : @"isFavorited",
     @"coordinates.coordinates" :@"coordinates"
     }];

    id<ERNAsyncItemsRepository> repository = [ERNRestKitAsyncItemsRepository asyncItemsRepositoryWithUrl:twitterUrl
                                                                                                 keyPath:nil
                                                                                                 mapping:statusMapping
                                                                                             statusCodes:[NSIndexSet indexSetWithIndex:200]];
    [repository refresh];
    return [self setupViewController:[ERNMapViewController autoZoomingViewControllerWithRepository:repository]];
}

-(UIViewController *)setupViewController:(ERNMapViewController *)viewController
{
    [viewController setTitle:@"Fifth Screen"];
    return viewController;
}

+(instancetype)configurator
{
    return [[self alloc] init];
}

@end
