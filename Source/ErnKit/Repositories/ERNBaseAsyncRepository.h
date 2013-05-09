#import <Foundation/Foundation.h>
#import "ERNAsyncRepository.h"

@interface ERNBaseAsyncRepository : NSObject <ERNAsyncRepository>
-(void)notifyObservers;
@end
