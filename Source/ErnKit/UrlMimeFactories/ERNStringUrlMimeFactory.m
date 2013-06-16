#import "ERNStringUrlMimeFactory.h"
#import "ERNResource.h"
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

#pragma mark - ERNResourceFactory

-(ERNResource *)resourceForObject:(NSString *)string
{
    ERNCheckNilAndReturn(string, [ERNResource createNull]);
    return [ERNResource createWithUrl:
            [NSURL URLWithString:[NSString stringWithFormat:@"string:%@", string]]
                                 mime:[[self class] mime]];
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
