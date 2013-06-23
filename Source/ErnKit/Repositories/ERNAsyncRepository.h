#import <Foundation/Foundation.h>
#import "ERNObservable.h"

@protocol ERNAsyncRepository <ERNObservable>
-(void)refresh;
@end
