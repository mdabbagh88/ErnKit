#import "ERNNumberUrlMimeFactory.h"
#import "NSObject+ERNHelper.h"
#import "NSURL+ERNHelper.h"

@implementation ERNNumberUrlMimeFactory

static ERNNumberUrlMimeFactory *factory;

+(NSString *)forClass
{
    return NSStringFromClass([@0 class]);
}

+(NSString *)mime
{
    return @"application/x-ern-number";
}

-(NSURL *)urlForObject:(NSNumber *)number
{
    ERNCheckNilAndReturn(number, [NSURL nullURL]);
    return [NSURL URLWithString:[NSString stringWithFormat:@"number:%@", number]];
}

-(NSString *)mimeForObject:(NSNumber *)number
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
