#import "NSMapTable+ERNHelper.h"

@implementation NSMapTable (ERNHelper)

-(BOOL)hasObjectForKey:(id)key
{
    return [self objectForKey:key] != nil;
}

@end
