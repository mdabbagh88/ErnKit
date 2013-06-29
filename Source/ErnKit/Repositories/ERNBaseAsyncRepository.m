#import "ERNBaseAsyncRepository.h"
#import "ERNErrorHandler.h"

@implementation ERNBaseAsyncRepository {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return [self new];
}

#pragma mark - ERNAsyncRepository

-(void)refresh
{
    [self notifyObservers];
}

@end
