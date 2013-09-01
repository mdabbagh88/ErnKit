#import <Foundation/Foundation.h>
#import "ERNViewControllerFactory.h"

@interface ERNNullViewControllerFactory : NSObject <ERNViewControllerFactory>
+(instancetype)create;
@end
