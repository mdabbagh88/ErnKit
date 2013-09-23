#import "ERNResource.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

@implementation ERNResource {
    NSURL *_url;
    NSString *_mime;
    id<NSObject> _object;
}

#pragma mark - public - constructors

+(instancetype)createWithUrl:(NSURL *)url
                        mime:(NSString *)mime
{
    return [[self alloc] initWithUrl:url
                                mime:mime
                              object:nil];
}

+(instancetype)createWithUrl:(NSURL *)url
                        mime:(NSString *)mime
                      object:(id<NSObject>)object
{
    return [[self alloc] initWithUrl:url
                                mime:mime
                              object:object];
}

#pragma mark - public - accessors

ERNLazyLoadGetter(NSURL *, url, [NSURL ERN_createNull])

ERNLazyLoadGetter(NSString *, mime, @"")

#pragma mark - private - initializers

-(id)initWithUrl:(NSURL *)url
            mime:(NSString *)mime
          object:(id<NSObject>)object
{
    self = [super init];
    _url = url;
    _mime = mime;
    _object = object;
    return self;
}

@end
