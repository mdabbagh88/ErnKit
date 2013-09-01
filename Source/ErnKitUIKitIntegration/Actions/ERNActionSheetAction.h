#import <Foundation/Foundation.h>
#import "ERNAction.h"

@protocol ERNActionSheetTransitioner;
@protocol ERNActionSheetFactory;

@interface ERNActionSheetAction : NSObject <ERNAction>
+(instancetype)createWithTransitioner:(id<ERNActionSheetTransitioner>)transitioner
                         factory:(id<ERNActionSheetFactory>)factory;
@end
