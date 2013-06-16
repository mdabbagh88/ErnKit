#import <Foundation/Foundation.h>
#import "ERNActionHandler.h"

@protocol ERNAction;
@protocol ERNResourceFactory;
@protocol ERNRepositoryStore;

@interface ERNDefaultActionHandler : NSObject <ERNActionHandler>
+(instancetype)createWithAction:(id<ERNAction>)action
                 resourceFactory:(id<ERNResourceFactory>)resourceFactory
                repositoryStore:(id<ERNRepositoryStore>)repositoryStore;
@end
