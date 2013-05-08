#import "ERNNullUrlMimeFactory.h"
#import "NSURL+ERNHelper.h"

static ERNNullUrlMimeFactory *factory;

@implementation ERNNullUrlMimeFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return factory;
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
    factory = [self new];
}

@end
