#import "ERNNumberUrlMimeFactory.h"
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

#pragma mark - ERNUrlMimeFactory

-(NSURL *)urlForObject:(NSNumber *)number
{
    ERNCheckNilAndReturn(number, [NSURL ERN_createNull]);
    return [NSURL URLWithString:[NSString stringWithFormat:@"number:%@", number]];
}

-(NSString *)mimeForObject:(NSNumber *)number
{
    return [[self class] mime];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
