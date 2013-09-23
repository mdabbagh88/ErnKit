#import "ERNDefaultResourceFactory.h"
#import "ERNResource.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

@implementation ERNDefaultResourceFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
}

#pragma mark - ERNResourceFactory

-(ERNResource *)resourceForObject:(id<NSObject>)object
{
    return [ERNResource createWithUrl:
            [NSURL URLWithString:[NSString stringWithFormat:@"ernobject://%d", [object hash]]]
                                 mime:@""
                               object:object];
}

@end
