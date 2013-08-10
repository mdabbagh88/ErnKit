#import <UIKit/UIKit.h>

@protocol ERNAction;
@class ERNResource;

@interface ERNViewController : UIViewController
+(instancetype)createWithResource:(ERNResource *)resource
                     appearAction:(id<ERNAction>)appearAction
                  disappearAction:(id<ERNAction>)disappearAction;
@end
