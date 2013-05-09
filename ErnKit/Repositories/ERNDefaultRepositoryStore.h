#import <Foundation/Foundation.h>
#import "ERNRepositoryStore.h"
#import "ERNRepositoryFactory.h"

@interface ERNDefaultRepositoryStore : NSObject <ERNRepositoryStore, ERNRepositoryFactory>
+(instancetype)create;
@end
