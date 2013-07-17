#import "ERNNullResourceFactory.h"
#import "ERNNullResource.h"
#import "NSURL+ERNHelper.h"

static ERNNullResourceFactory *immutableSingleton;

@implementation ERNNullResourceFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNResourceFactory

-(ERNResource *)resourceForObject:(id<NSObject>)__unused object
{
    return [ERNNullResource create];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
