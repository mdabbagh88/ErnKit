#import "ERNDefaultUrlMimeFactory.h"
#import "NSURL+ERNHelper.h"

static ERNDefaultUrlMimeFactory *immutableSingleton;

@implementation ERNDefaultUrlMimeFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNUrlMimeFactory

-(NSURL *)urlForObject:(id<NSObject>)object
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"ernobject://%d", [object hash]]];
}

-(NSString *)mimeForObject:(id<NSObject>)object
{
    return @"";
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
