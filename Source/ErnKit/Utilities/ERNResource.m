#import "ERNResource.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

@implementation ERNResource {
    NSURL *_url;
    NSString *_mime;
}

#pragma mark - public - constructors

+(instancetype)createWithUrl:(NSURL *)url
                        mime:(NSString *)mime
{
    return [[self alloc] initWithUrl:url
                                mime:mime];
}

#pragma mark - private - accessors

-(NSURL *)url
{
    return _url = _url ? _url : [NSURL ERN_createNull];
}

-(NSString *)mime
{
    return _mime = _mime ? _mime : @"";
}

#pragma mark - private - initializers

-(id)initWithUrl:(NSURL *)url
            mime:(NSString *)mime
{
    self = [self init];
    _url = url;
    _mime = mime;
    return self;
}

@end
