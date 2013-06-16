#import <Foundation/Foundation.h>

@class UIBarButtonItem;
@protocol ERNAction;
@class ERNResource;

@interface ERNBarButtonItemActionController : NSObject
+(instancetype)createWithBarButtonItem:(UIBarButtonItem *)barButtonItem
                                action:(id<ERNAction>)action
                              resource:(ERNResource *)resource;
@end
