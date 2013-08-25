#import <Foundation/Foundation.h>
#import "ERNObjectAction.h"

@protocol ERNAction;
@protocol ERNResourceFactory;

@interface ERNActionObjectAction : NSObject <ERNObjectAction>
+(instancetype)createWithAction:(id<ERNAction>)action
                resourceFactory:(id<ERNResourceFactory>)resourceFactory;
@end
