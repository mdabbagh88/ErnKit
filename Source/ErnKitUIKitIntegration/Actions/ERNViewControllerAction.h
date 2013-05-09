#import <Foundation/Foundation.h>
#import "ERNAction.h"

@protocol ERNViewControllerConfigurator;
@protocol ERNViewControllerTransitioner;

@interface ERNViewControllerAction : NSObject <ERNAction>
+(instancetype)createWithTransitioner:(id<ERNViewControllerTransitioner>)transitioner
                         configurator:(id<ERNViewControllerConfigurator>)configurator;
@end
