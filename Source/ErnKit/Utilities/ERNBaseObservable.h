#import <Foundation/Foundation.h>
#import "ERNObservable.h"

@interface ERNBaseObservable : NSObject <ERNObservable>
-(void)notifyObservers;
@end
