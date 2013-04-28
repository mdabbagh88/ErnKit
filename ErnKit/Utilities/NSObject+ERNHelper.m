#import "NSObject+ERNHelper.h"

@implementation NSObject (ERNHelper)

-(instancetype)guaranteeProtocolConformance:(Protocol *)protocol
{
    return [self conformsToProtocol:protocol] ? self : nil;
}

-(instancetype)guaranteeSelectorResponse:(SEL)selector
{
    return [self respondsToSelector:selector] ? self : nil;
}

@end
