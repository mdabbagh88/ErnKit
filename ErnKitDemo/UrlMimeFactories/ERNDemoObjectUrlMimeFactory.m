#import "ERNDemoObjectUrlMimeFactory.h"
#import "ERNDemoObject.h"

@implementation ERNDemoObjectUrlMimeFactory

+(NSString *)mime
{
    return @"application/x-demoobject";
}

-(NSURL *)urlForObject:(ERNDemoObject *)demoObject
{
    return [demoObject url];
}

-(NSString *)mimeForObject:(ERNDemoObject *)demoObject
{
    return [[self class] mime];
}

+(instancetype)urlMimeFactory
{
    return [self new];
}

@end
