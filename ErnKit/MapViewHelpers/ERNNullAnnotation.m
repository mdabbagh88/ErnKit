#import "ERNNullAnnotation.h"
#import "NSObject+ERNHelper.h"

@implementation ERNNullAnnotation

@synthesize coordinate = _coordinate;

static ERNNullAnnotation *annotation;

-(id)init
{
    self = [super init];
    ERNCheckNil(self);
    _coordinate = CLLocationCoordinate2DMake(0, 0);
    return self;
}

+(instancetype)annotation
{
    return annotation;
}

+(void)initialize
{
    annotation = [[self alloc] init];
}

@end
