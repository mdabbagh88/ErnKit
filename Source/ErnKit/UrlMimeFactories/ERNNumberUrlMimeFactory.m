#import "ERNNumberUrlMimeFactory.h"
#import "ERNResource.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

static ERNNumberUrlMimeFactory *immutableSingleton;

@implementation ERNNumberUrlMimeFactory {
}

#pragma mark - public

+(NSString *)mime
{
    return @"application/x-ern-number";
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNResourceFactory

-(ERNResource *)resourceForObject:(NSNumber *)number
{
    ERNCheckNilAndReturn(number, [ERNResource createNull]);
    return [ERNResource createWithUrl:
            [NSURL URLWithString:[NSString stringWithFormat:@"number:%@", number]]
                                 mime:[[self class] mime]];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
