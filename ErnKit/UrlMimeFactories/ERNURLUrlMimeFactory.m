#import "ERNURLUrlMimeFactory.h"
#import "NSURL+ERNHelper.h"

static ERNURLUrlMimeFactory *factory;

@implementation ERNURLUrlMimeFactory {
}

#pragma mark - public

+(NSString *)mime
{
    return @"application/x-ern-url";
}

#pragma mark - public - constructors

+(instancetype)create
{
    return factory;
}

#pragma mark - ERNUrlMimeFactory

-(NSURL *)urlForObject:(NSURL *)url
{
    return url ? url : [NSURL createNull];
}

-(NSString *)mimeForObject:(NSURL *)url
{
    return [[self class] mime];
}

#pragma mark - NSObject

+(void)initialize
{
    factory = [self new];
}

@end
