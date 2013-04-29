#import "ERNNullUrlMimeFactory.h"
#import "NSURL+ERNHelper.h"

@implementation ERNNullUrlMimeFactory

static ERNNullUrlMimeFactory *factory;

-(NSURL *)urlForObject:(id<NSObject>)object
{
    return [NSURL nullURL];
}

-(NSString *)mimeForObject:(id<NSObject>)object
{
    return @"";
}

+(instancetype)factory
{
    return factory;
}

+(void)initialize
{
    factory = [[self alloc] init];
}

@end
