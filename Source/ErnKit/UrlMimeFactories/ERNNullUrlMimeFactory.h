#import <Foundation/Foundation.h>
#import "ERNResourceFactory.h"

@interface ERNNullUrlMimeFactory : NSObject <ERNResourceFactory>
+(instancetype)create;
@end
