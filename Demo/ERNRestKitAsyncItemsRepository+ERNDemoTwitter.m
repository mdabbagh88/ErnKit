#import "ERNRestKitAsyncItemsRepository+ERNDemoTwitter.h"

// Tweet data model object, for mapping from json using RestKit
#import "ERNDemoTweet.h"

// RestKit itself
#import <RestKit/RestKit.h>

@implementation ERNRestKitAsyncItemsRepository (ERNDemoTwitter)

#pragma mark - public - constructors

+(instancetype)createTwitterStatusesForUser:(NSString *)user
{
    // Setup a url for accessing twitter statuses
    NSString *urlFormat = @"http://localhost:3333/%@/%@";
    NSString *urlString = [NSString stringWithFormat:urlFormat, user, user];
    NSURL *url = [NSURL URLWithString:urlString];
    
    // Setup the RestKit object mapping for the feed data to the class ERNDemoTweet
    NSDictionary *twitterMapping = @{
                                     @"text" : @"text",
                                     @"coordinates.coordinates" : @"coordinates",
                                     @"user.profile_image_url" : @"imageUrl"
                                     };
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[ERNDemoTweet class]];
    [objectMapping addAttributeMappingsFromDictionary:twitterMapping];
    
    // Setup a set for the status codes the mapping should apply to, in our case 200
    NSIndexSet *statusCodes = [NSIndexSet indexSetWithIndex:200];
    
    // Setup an async repository with the RestKit mapping for twitter
    return [ERNRestKitAsyncItemsRepository createWithUrl:url
                                                 keyPath:@"data"
                                                 mapping:objectMapping
                                             statusCodes:statusCodes];
}

@end
