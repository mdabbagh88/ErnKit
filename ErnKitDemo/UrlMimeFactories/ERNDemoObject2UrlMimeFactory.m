#import "ERNDemoObject2UrlMimeFactory.h"
#import "ERNDemoObject2.h"

@implementation ERNDemoObject2UrlMimeFactory

+(NSString *)mime
{
    return @"application/x-demoobject2";
}

-(NSURL *)urlForObject:(ERNDemoObject2 *)demoObject
{
    return [NSURL URLWithString:[demoObject title]];
}

-(NSString *)mimeForObject:(ERNDemoObject2 *)demoObject
{
    return [[self class] mime];
}

+(instancetype)urlMimeFactory
{
    return [self new];
}

@end
