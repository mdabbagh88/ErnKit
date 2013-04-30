#import "ERNStringUrlMimeFactory.h"
#import "NSObject+ERNHelper.h"
#import "NSURL+ERNHelper.h"

@implementation ERNStringUrlMimeFactory

static ERNStringUrlMimeFactory *factory;

+(NSString *)mime
{
    return @"application/x-ern-string";
}

-(NSURL *)urlForObject:(NSString *)string
{
    ERNCheckNilAndReturn(string, [NSURL nullURL]);
    return [NSURL URLWithString:[NSString stringWithFormat:@"string:%@", string]];
}

-(NSString *)mimeForObject:(NSString *)string
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
