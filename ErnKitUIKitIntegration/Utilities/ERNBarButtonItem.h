#import <UIKit/UIKit.h>

@protocol ERNAction;

@interface ERNBarButtonItem : UIBarButtonItem
+(instancetype)barButtonItemWithCustomView:(UIView *)view
                                    action:(id<ERNAction>)action
                                       url:(NSURL *)url
                                      mime:(NSString *)mime;
+(instancetype)barButtonItemWithSystemItem:(UIBarButtonSystemItem)systemItem
                                    action:(id<ERNAction>)action
                                       url:(NSURL *)url
                                      mime:(NSString *)mime;
@end
