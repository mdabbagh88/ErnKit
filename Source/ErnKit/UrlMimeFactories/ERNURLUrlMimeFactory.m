#import "ERNURLUrlMimeFactory.h"
#import "NSURL+ERNHelper.h"

static ERNURLUrlMimeFactory *immutableSingleton;

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
    return immutableSingleton;
}

#pragma mark - ERNUrlMimeFactory

-(NSURL *)urlForObject:(NSURL *)url
{
    return url ? url : [NSURL ERN_createNull];
}

-(NSString *)mimeForObject:(NSURL *)url
{
    return [[self class] mime];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
