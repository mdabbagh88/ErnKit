#import "ERNURLResourceFactory.h"
#import "ERNResource.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

static ERNURLResourceFactory *immutableSingleton;

@implementation ERNURLResourceFactory {
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

#pragma mark - ERNResourceFactory

-(ERNResource *)resourceForObject:(NSURL *)url
{
    ERNCheckNilAndReturn(url, [ERNResource createNull]);
    return [url isKindOfClass:[NSURL class]] ?
    [ERNResource createWithUrl:url
                          mime:[[self class] mime]] :
    [ERNResource createNull];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
