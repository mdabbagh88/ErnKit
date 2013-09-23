#import "ERNNullAnnotation.h"
#import "ERNErrorHandler.h"

@implementation ERNNullAnnotation {
    CLLocationCoordinate2D _coordinate;
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
}

#pragma mark - public - accessors

-(CLLocationCoordinate2D)coordinate
{
    return _coordinate;
}

-(id)init
{
    self = [super init];
    ERNCheckNil(self);
    _coordinate = CLLocationCoordinate2DMake(0, 0);
    return self;
}

@end
