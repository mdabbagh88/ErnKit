#import <UIKit/UIKit.h>

@protocol ERNActionSheetTransitioner <NSObject>
-(void)transitionToActionSheet:(UIActionSheet *)actionSheet;
@end
