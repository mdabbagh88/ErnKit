#import "ERNStringResourceFactory.h"
#import "ERNResource.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

static ERNStringResourceFactory *immutableSingleton;

@implementation ERNStringResourceFactory {
}

#pragma mark - public

+(NSString *)mime
{
    return @"application/x-ern-string";
}

+(NSString *)scheme
{
    return @"string";
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
    return [string isKindOfClass:[NSString class]] ?
    [ERNResource createWithUrl:
     [NSURL URLWithString:[NSString stringWithFormat:@"%@:%@", [[self class] scheme], string]]
                          mime:[[self class] mime]] :
    [ERNResource createNull];
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
