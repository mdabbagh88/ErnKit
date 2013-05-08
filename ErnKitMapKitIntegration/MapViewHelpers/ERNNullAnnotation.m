#import "ERNNullAnnotation.h"
#import "ERNErrorHandler.h"

static ERNNullAnnotation *annotation;

@implementation ERNNullAnnotation {
    CLLocationCoordinate2D _coordinate;
}

#pragma mark - public - constructors

+(instancetype)create
{
    return annotation;
}

#pragma mark - NSObject

+(void)initialize
{
    annotation = [self new];
}

-(id)init
{
    self = [super init];
    ERNCheckNil(self);
    _coordinate = CLLocationCoordinate2DMake(0, 0);
    return self;
}

@end
