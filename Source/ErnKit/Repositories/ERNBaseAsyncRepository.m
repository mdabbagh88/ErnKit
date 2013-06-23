#import "ERNBaseAsyncRepository.h"
#import "ERNErrorHandler.h"

@implementation ERNBaseAsyncRepository {
}

#pragma mark - ERNAsyncRepository

-(void)refresh
{
    [self notifyObservers];
}

@end
