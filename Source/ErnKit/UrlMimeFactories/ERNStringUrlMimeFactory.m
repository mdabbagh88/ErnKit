#import "ERNStringUrlMimeFactory.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

static ERNStringUrlMimeFactory *immutableSingleton;

@implementation ERNStringUrlMimeFactory {
}

#pragma mark - public

+(NSString *)mime
{
    return @"application/x-ern-string";
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNUrlMimeFactory

-(NSURL *)urlForObject:(NSString *)string
{
    ERNCheckNilAndReturn(string, [NSURL createNull]);
    return [NSURL URLWithString:[NSString stringWithFormat:@"string:%@", string]];
}

-(NSString *)mimeForObject:(NSString *)string
{
    return [[self class] mime];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end