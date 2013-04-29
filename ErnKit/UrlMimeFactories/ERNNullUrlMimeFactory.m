#import "ERNNullUrlMimeFactory.h"

@implementation ERNNullUrlMimeFactory

static ERNNullUrlMimeFactory *factory;

-(NSURL *)urlForObject:(id<NSObject>)object
{
    return [NSURL URLWithString:@""];
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
