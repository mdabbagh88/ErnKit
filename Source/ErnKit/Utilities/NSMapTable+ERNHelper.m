#import "NSMapTable+ERNHelper.h"

@implementation NSMapTable (ERNHelper)

-(BOOL)ERN_hasObjectForKey:(id)key
{
    return [self objectForKey:key] != nil;
}

@end
