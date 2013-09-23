#import "ERNNullResourceFactory.h"
#import "ERNNullResource.h"
#import "NSURL+ERNHelper.h"
#import "ERNErrorHandler.h"

@implementation ERNNullResourceFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
}

#pragma mark - ERNResourceFactory

-(ERNResource *)resourceForObject:(id<NSObject>)__unused object
{
    return [ERNNullResource create];
}

@end
