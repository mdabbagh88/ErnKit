#import <Foundation/Foundation.h>

@class UIBarButtonItem;
@protocol ERNAction;

@interface ERNBarButtonItemActionController : NSObject
+(instancetype)controllerWithBarButtonItem:(UIBarButtonItem *)barButtonItem
                                    action:(id<ERNAction>)action
                                       url:(NSURL *)url
                                      mime:(NSString *)mime;
@end