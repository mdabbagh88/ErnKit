#import "ERNDemoObject.h"

@implementation ERNDemoObject


-(id)initWithTitle:(NSString *)title
              info:(NSString *)info
               url:(NSURL *)url
{
    self = [super init];
    _title = title;
    _info = info;
    _url = url;
    return self;
}

+(instancetype)objectWithTitle:(NSString *)title
                          info:(NSString *)info
                           url:(NSURL *)url
{
    return [[self alloc] initWithTitle:title
                                  info:info
                                   url:url];
}

@end
