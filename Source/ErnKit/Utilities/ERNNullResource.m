#import "ERNNullResource.h"
#import "NSURL+ERNHelper.h"
#import "ERNErrorHandler.h"

@implementation ERNNullResource {
    NSString *_mime;
    NSURL *_url;
}

+(instancetype)create
{
    return ERNLazyLoadSingleton();
}

#pragma mark - public - accessors

ERNLazyLoadGetter(NSURL *, url, [NSURL ERN_createNull])

ERNLazyLoadGetter(NSString *, mime, @"")

@end
