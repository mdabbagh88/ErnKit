#import "ERNDemoObject2.h"
#import "NSObject+ERNHelper.h"

@implementation ERNDemoObject2

@synthesize title = _title;
@synthesize coordinate = _coordinate;

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ (custom desc)", [self title]];
}

-(id)initWithTitle:(NSString *)title
        coordinate:(CLLocationCoordinate2D)coordinate
{
    self = [self init];
    ERNCheckNil(self);
    _title = title;
    _coordinate = coordinate;
    return self;
}

+(instancetype)objectWithTitle:(NSString *)title
                    coordinate:(CLLocationCoordinate2D)coordinate
{
    return [[self alloc] initWithTitle:title
                            coordinate:coordinate];
}

@end
