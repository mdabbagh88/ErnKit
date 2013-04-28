#import "ERNNullUrlMimeFactory.h"

@implementation ERNNullUrlMimeFactory

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
    return [[self alloc] init];
}

@end
