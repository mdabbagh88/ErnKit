#import <Foundation/Foundation.h>

@class UIActionSheet;
@class ERNResource;

@protocol ERNActionSheetFactory <NSObject>
-(UIActionSheet *)createActionSheetForResource:(ERNResource *)resource;
@end
