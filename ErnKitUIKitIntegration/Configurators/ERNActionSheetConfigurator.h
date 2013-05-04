#import <Foundation/Foundation.h>

@class UIActionSheet;

@protocol ERNActionSheetConfigurator <NSObject>
-(UIActionSheet *)createActionSheetForUrl:(NSURL *)url
                                     mime:(NSString *)mime;
@end
