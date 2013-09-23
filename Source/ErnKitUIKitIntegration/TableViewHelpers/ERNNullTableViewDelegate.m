#import "ERNNullTableViewDelegate.h"
#import "ERNErrorHandler.h"

@implementation ERNNullTableViewDelegate {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
}

@end
