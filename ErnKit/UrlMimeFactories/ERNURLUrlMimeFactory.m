#import "ERNURLUrlMimeFactory.h"

@implementation ERNURLUrlMimeFactory

static ERNURLUrlMimeFactory *factory;

+(NSString *)mime
{
    return @"application/x-ern-url";
}

-(NSURL *)urlForObject:(NSURL *)url
{
    return url;
}

-(NSString *)mimeForObject:(NSURL *)url
{
    return [[self class] mime];
}

+(instancetype)urlMimeFactory
{
    return factory;
}

+(void)initialize
{
    factory = [[self alloc] init];
}

@end
