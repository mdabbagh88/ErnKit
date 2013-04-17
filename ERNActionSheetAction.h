#import <Foundation/Foundation.h>
#import "ERNAction.h"

@protocol ERNActionSheetTransitioner;
@protocol ERNActionSheetConfigurator;

@interface ERNActionSheetAction : NSObject <ERNAction>
+(instancetype)actionWithTransitioner:(id<ERNActionSheetTransitioner>)transitioner
                         configurator:(id<ERNActionSheetConfigurator>)configurator;
@end
