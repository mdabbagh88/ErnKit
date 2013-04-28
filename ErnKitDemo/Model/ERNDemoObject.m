#import "ERNDemoObject.h"
#import "NSObject+ERNHelper.h"

@implementation ERNDemoObject

@synthesize coordinate = _coordinate;

-(id)initWithTitle:(NSString *)title
              info:(NSString *)info
               url:(NSURL *)url
        coordinate:(CLLocationCoordinate2D)coordinate
{
    self = [self init];
    ERNCheckNil(self);
    _title = title;
    _info = info;
    _url = url;
    _doubleHeight = NO;
    _coordinate = coordinate;
    return self;
}

+(instancetype)objectWithTitle:(NSString *)title
                          info:(NSString *)info
                           url:(NSURL *)url
                    coordinate:(CLLocationCoordinate2D)coordinate
{
    return [[self alloc] initWithTitle:title
                                  info:info
                                   url:url
                            coordinate:coordinate];
}

-(id)initDoubleHeightWithTitle:(NSString *)title
                          info:(NSString *)info
                           url:(NSURL *)url
                    coordinate:(CLLocationCoordinate2D)coordinate
{
    self = [self initWithTitle:title
                          info:info
                           url:url
                    coordinate:coordinate];
    ERNCheckNil(self);
    _doubleHeight = YES;
    return self;
}

+(instancetype)doubleHeightObjectWithTitle:(NSString *)title
                                      info:(NSString *)info
                                       url:(NSURL *)url
                                coordinate:(CLLocationCoordinate2D)coordinate
{
    return [[self alloc] initDoubleHeightWithTitle:title
                                              info:info
                                               url:url
                                        coordinate:coordinate];
}
@end
