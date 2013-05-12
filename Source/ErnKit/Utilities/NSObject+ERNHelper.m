#import "NSObject+ERNHelper.h"

@implementation NSObject (ERNHelper)

#pragma mark - public

-(instancetype)ERN_guaranteeSelectorResponse:(SEL)selector
{
    return [self respondsToSelector:selector] ? self : nil;
}

@end
