#import "ERNURLUrlMimeFactory.h"

@implementation ERNURLUrlMimeFactory

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
    return [[self alloc] init];
}

@end
