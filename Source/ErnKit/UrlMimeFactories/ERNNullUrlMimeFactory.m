#import "ERNNullUrlMimeFactory.h"
#import "NSURL+ERNHelper.h"

static ERNNullUrlMimeFactory *immutableSingleton;

@implementation ERNNullUrlMimeFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNUrlMimeFactory

-(NSURL *)urlForObject:(id<NSObject>)object
{
    return [NSURL createNull];
}

-(NSString *)mimeForObject:(id<NSObject>)object
{
    return @"";
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
