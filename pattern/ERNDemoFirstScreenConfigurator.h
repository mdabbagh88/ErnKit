#import <Foundation/Foundation.h>
#import "ERNViewControllerConfigurator.h"

@protocol ERNAction;
@protocol ERNUrlMimeFactory;

@interface ERNDemoFirstScreenConfigurator : NSObject <ERNViewControllerConfigurator>
+ (instancetype)configuratorWithItemAction:(id<ERNAction>)action
                            urlMimeFactory:(id<ERNUrlMimeFactory>)urlMimeFactory;
@end
