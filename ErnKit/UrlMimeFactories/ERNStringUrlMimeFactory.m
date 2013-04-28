#import "ERNStringUrlMimeFactory.h"

@implementation ERNStringUrlMimeFactory

+(NSString *)mime
{
    return @"application/x-ern-string";
}

-(NSURL *)urlForObject:(NSString *)string
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"string:%@", string]];
}

-(NSString *)mimeForObject:(NSString *)string
{
    return [[self class] mime];
}

+(instancetype)urlMimeFactory
{
    return [[self alloc] init];
}

@end
