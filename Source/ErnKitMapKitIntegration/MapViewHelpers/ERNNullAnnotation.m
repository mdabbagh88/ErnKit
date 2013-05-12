#import "ERNNullAnnotation.h"
#import "ERNErrorHandler.h"

static ERNNullAnnotation *immutableSingleton;

@implementation ERNNullAnnotation {
    CLLocationCoordinate2D _coordinate;
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - public - accessors

-(CLLocationCoordinate2D)coordinate
{
    return _coordinate;
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

-(id)init
{
    self = [super init];
    ERNCheckNil(self);
    _coordinate = CLLocationCoordinate2DMake(0, 0);
    return self;
}

@end
