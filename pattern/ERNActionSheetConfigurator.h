#import <UIKit/UIKit.h>

@protocol ERNActionSheetConfigurator <NSObject>
-(UIActionSheet *)createActionSheetForUrl:(NSURL *)url
                                     mime:(NSString *)mime;
@end
