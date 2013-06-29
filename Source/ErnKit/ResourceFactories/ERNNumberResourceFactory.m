#import "ERNNumberResourceFactory.h"
#import "ERNResource.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

static ERNNumberResourceFactory *immutableSingleton;

@implementation ERNNumberResourceFactory {
}

#pragma mark - public

+(NSString *)mime
{
    return @"application/x-ern-number";
}

+(NSString *)scheme
{
    return @"number";
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
    return [number isKindOfClass:[NSNumber class]] ?
    [ERNResource createWithUrl:
            [NSURL URLWithString:[NSString stringWithFormat:@"%@:%@",
                                  [[self class] scheme], number]]
                          mime:[[self class] mime]] :
    [ERNResource createNull];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
