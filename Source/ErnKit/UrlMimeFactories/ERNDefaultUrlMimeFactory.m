#import "ERNDefaultUrlMimeFactory.h"
#import "ERNResource.h"
#import "NSURL+ERNHelper.h"

static ERNDefaultUrlMimeFactory *immutableSingleton;

@implementation ERNDefaultUrlMimeFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNResourceFactory

-(ERNResource *)resourceForObject:(id<NSObject>)object
{
    return [ERNResource createWithUrl:
            [NSURL URLWithString:[NSString stringWithFormat:@"ernobject://%d", [object hash]]]
                                 mime:@""];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
