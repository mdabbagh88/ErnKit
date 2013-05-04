#import <Foundation/Foundation.h>

@class UIActionSheet;

@protocol ERNActionSheetTransitioner <NSObject>
-(void)transitionToActionSheet:(UIActionSheet *)actionSheet;
@end
