#import "ERNNullMapViewDelegate.h"
#import "ERNErrorHandler.h"

@implementation ERNNullMapViewDelegate

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
}

@end
