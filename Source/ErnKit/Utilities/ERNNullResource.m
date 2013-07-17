#import "ERNNullResource.h"
#import "NSURL+ERNHelper.h"

static ERNNullResource *immutableSingleton;

@implementation ERNNullResource {
    NSString *_mime;
    NSURL *_url;
}

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - public - accessors

-(NSURL *)url
{
    return _url = _url ? _url : [NSURL ERN_createNull];
}

-(NSString *)mime
{
    return _mime = _mime ? _mime : @"";
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
