#import "ERNNullUrlMimeFactory.h"
#import "ERNResource.h"
#import "NSURL+ERNHelper.h"

static ERNNullUrlMimeFactory *immutableSingleton;

@implementation ERNNullUrlMimeFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNResourceFactory

-(ERNResource *)resourceForObject:(id<NSObject>)object
{
    return [ERNResource createNull];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
