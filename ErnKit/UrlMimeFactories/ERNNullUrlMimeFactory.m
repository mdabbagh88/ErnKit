#import "ERNNullUrlMimeFactory.h"
#import "NSURL+ERNHelper.h"

static ERNNullUrlMimeFactory *factory;

@implementation ERNNullUrlMimeFactory {
}

#pragma mark - public - constructors

+(instancetype)factory
{
    return factory;
}

#pragma mark - ERNUrlMimeFactory

-(NSURL *)urlForObject:(id<NSObject>)object
{
    return [NSURL nullURL];
}

-(NSString *)mimeForObject:(id<NSObject>)object
{
    return @"";
}

#pragma mark - NSObject

+(void)initialize
{
    factory = [[self alloc] init];
}

@end
