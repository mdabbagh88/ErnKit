#import <Foundation/Foundation.h>
#import "ERNUrlMimeFactory.h"

@interface ERNNullUrlMimeFactory : NSObject <ERNUrlMimeFactory>
+(instancetype)create;
@end