#import "ERNNullActionSheetTransitioner.h"

static ERNNullActionSheetTransitioner *immutableSingleton;

@implementation ERNNullActionSheetTransitioner {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNActionSheetTransitioner

-(void)transitionToActionSheet:(UIActionSheet *) __unused actionSheet
{
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
