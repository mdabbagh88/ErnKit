#import "ERNStringResourceFactory.h"
#import "ERNNullResource.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

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
    return ERNLazyLoadSingleton();
}

#pragma mark - ERNResourceFactory

-(ERNResource *)resourceForObject:(NSString *)string
{
    ERNCheckNilAndReturn(string, [ERNNullResource create]);
    return [string isKindOfClass:[NSString class]] ?
    [ERNResource createWithUrl:
     [NSURL URLWithString:[NSString stringWithFormat:@"%@:%@", [[self class] scheme], string]]
                          mime:[[self class] mime]] :
    [ERNNullResource create];
}

@end
