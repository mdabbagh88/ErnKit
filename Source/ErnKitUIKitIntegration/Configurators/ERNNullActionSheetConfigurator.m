#import "ERNNullActionSheetConfigurator.h"
#import <UIKit/UIKit.h>

static ERNNullActionSheetConfigurator *immutableSingleton;

@implementation ERNNullActionSheetConfigurator {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNActionSheetConfigurator

-(UIActionSheet *)createActionSheetForResource:(ERNResource *) __unused resource
{
    return [UIActionSheet new];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
