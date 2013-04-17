#import "ERNDemoObjectUrlMimeFactory.h"
#import "ERNDemoObject.h"

@implementation ERNDemoObjectUrlMimeFactory

+(NSString *)mime
{
    return @"application/x-demoobject";
}

-(NSURL *)urlForObject:(id<NSObject>)object
{
    NSURL *url = nil;
    if ([object isKindOfClass:[ERNDemoObject class]]) {
        ERNDemoObject *demoObject = object;
        url = [demoObject url];
    }
    return url;
}

-(NSString *)mimeForObject:(id<NSObject>)object
{
    return [[self class] mime];
}

+(instancetype)urlMimeFactory
{
    return [[self alloc] init];
}

@end
