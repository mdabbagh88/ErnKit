#import <SystemConfiguration/SystemConfiguration.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <RestKit/RestKit.h>
#import <ErnKit/RestKitIntegration.h>
#import "ERNDefaultAsyncPaginatedItemsRepository+ERNDemoTwitter.h"

// Tweet data model object, for mapping from json using RestKit
#import "ERNDemoTweet.h"

@implementation ERNDefaultAsyncPaginatedItemsRepository (ERNDemoTwitter)

#pragma mark - public - constructors

+(instancetype)createTwitterStatusesForUser:(NSString *)user
{
    // Setup a set for the status codes the mapping should apply to, in our case 200
    NSIndexSet *statusCodes = [NSIndexSet indexSetWithIndex:200];

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

    // Setup the RestKit paginating mapping
    NSDictionary *paginationMapping = @{
                                        @"paging.next" : @"nextPage",
                                        @"paging.previous" : @"previousPage"
                                        };
    RKObjectMapping *paginationObjectMapping =
    [RKObjectMapping mappingForClass:[ERNDefaultRepositoryPaginator class]];
    [paginationObjectMapping addAttributeMappingsFromDictionary:paginationMapping];

    [paginationObjectMapping addPropertyMapping:
     [RKRelationshipMapping relationshipMappingFromKeyPath:@"data"
                                                 toKeyPath:@"items"
                                               withMapping:objectMapping]];
    RKResponseDescriptor *paginationResponseDescriptor =
    [RKResponseDescriptor responseDescriptorWithMapping:paginationObjectMapping
                                                 method:RKRequestMethodAny
                                            pathPattern:nil
                                                keyPath:@""
                                            statusCodes:statusCodes];
    
    // Setup an async repository with the RestKit mapping for twitter and pagination
    return [self createWithResource:[ERNResource createWithUrl:url
                                                          mime:@""]
                 responseDescriptor:paginationResponseDescriptor
                         windowSize:20];
}

@end
