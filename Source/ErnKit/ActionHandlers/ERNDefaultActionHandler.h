#import <Foundation/Foundation.h>
#import "ERNActionHandler.h"

@protocol ERNAction;
@protocol ERNResourceFactory;
@protocol ERNRepositoryStore;

@interface ERNDefaultActionHandler : NSObject <ERNActionHandler>
+(instancetype)createWithAction:(id<ERNAction>)action
                 urlMimeFactory:(id<ERNResourceFactory>)urlMimeFactory
                repositoryStore:(id<ERNRepositoryStore>)repositoryStore;
@end
