#import <Foundation/Foundation.h>
#import "ERNRepositoryStore.h"
#import "ERNRepositoryFactory.h"

@protocol ERNRepositoryManager <ERNRepositoryStore, ERNRepositoryFactory>
@end
