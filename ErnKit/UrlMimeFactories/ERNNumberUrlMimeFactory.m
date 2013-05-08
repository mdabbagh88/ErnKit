#import "ERNNumberUrlMimeFactory.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

static ERNNumberUrlMimeFactory *factory;

@implementation ERNNumberUrlMimeFactory {
}

#pragma mark - public

+(NSString *)mime
{
    return @"application/x-ern-number";
}

#pragma mark - public - constructors

+(instancetype)urlMimeFactory
{
    return factory;
}

#pragma mark - ERNUrlMimeFactory

-(NSURL *)urlForObject:(NSNumber *)number
{
    ERNCheckNilAndReturn(number, [NSURL nullURL]);
    return [NSURL URLWithString:[NSString stringWithFormat:@"number:%@", number]];
}

-(NSString *)mimeForObject:(NSNumber *)number
{
    return [[self class] mime];
}

#pragma mark - NSObject

+(void)initialize
{
    factory = [self new];
}

@end
