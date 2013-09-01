#import "ERNNullActionSheetFactory.h"
#import <UIKit/UIKit.h>

static ERNNullActionSheetFactory *immutableSingleton;

@implementation ERNNullActionSheetFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNActionSheetFactory

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
