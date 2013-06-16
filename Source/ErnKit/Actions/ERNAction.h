#import <Foundation/Foundation.h>
#import "ERNResource.h"

@protocol ERNAction <NSObject>
-(void)actionForResource:(ERNResource *)resource;
@end
