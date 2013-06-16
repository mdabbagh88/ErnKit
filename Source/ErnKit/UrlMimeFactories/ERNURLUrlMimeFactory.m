#import "ERNURLUrlMimeFactory.h"
#import "ERNResource.h"
#import "ERNErrorHandler.h"
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

#pragma mark - ERNResourceFactory

-(ERNResource *)resourceForObject:(NSURL *)url
{
    ERNCheckNilAndReturn(url, [ERNResource createNull]);
    return [ERNResource createWithUrl:url
                                 mime:[[self class] mime]];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
