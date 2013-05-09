#import "NSObject+ERNHelper.h"

@implementation NSObject (ERNHelper)

#pragma mark - public

-(instancetype)guaranteeSelectorResponse:(SEL)selector
{
    return [self respondsToSelector:selector] ? self : nil;
}

@end
