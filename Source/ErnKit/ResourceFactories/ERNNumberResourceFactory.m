#import "ERNNumberResourceFactory.h"
#import "ERNNullResource.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

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
    return ERNLazyLoadSingleton();
}

#pragma mark - ERNResourceFactory

-(ERNResource *)resourceForObject:(NSNumber *)number
{
    ERNCheckNilAndReturn(number, [ERNNullResource create]);
    return [number isKindOfClass:[NSNumber class]] ?
    [ERNResource createWithUrl:
            [NSURL URLWithString:[NSString stringWithFormat:@"%@:%@",
                                  [[self class] scheme], number]]
                          mime:[[self class] mime]] :
    [ERNNullResource create];
}

@end
