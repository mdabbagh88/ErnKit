#import "ERNNullActionSheetTransitioner.h"
#import "ERNErrorHandler.h"

@implementation ERNNullActionSheetTransitioner {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
}

#pragma mark - ERNActionSheetTransitioner

-(void)transitionToActionSheet:(UIActionSheet *) __unused actionSheet
{
}

@end
