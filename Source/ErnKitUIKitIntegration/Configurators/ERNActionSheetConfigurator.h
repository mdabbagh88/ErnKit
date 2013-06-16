#import <Foundation/Foundation.h>

@class UIActionSheet;
@class ERNResource;

@protocol ERNActionSheetConfigurator <NSObject>
-(UIActionSheet *)createActionSheetForResource:(ERNResource *)resource;
@end
