#import "ERNNullActionSheetFactory.h"
#import "ERNErrorHandler.h"
#import <UIKit/UIKit.h>

@implementation ERNNullActionSheetFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
}

#pragma mark - ERNActionSheetFactory

-(UIActionSheet *)createActionSheetForResource:(ERNResource *) __unused resource
{
    return [UIActionSheet new];
}

@end
