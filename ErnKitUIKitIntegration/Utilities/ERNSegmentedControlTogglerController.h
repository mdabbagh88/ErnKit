#import <Foundation/Foundation.h>

@class UISegmentedControl;
@protocol ERNToggler;

@interface ERNSegmentedControlTogglerController : NSObject

+(instancetype)controllerWithSegmentedControl:(UISegmentedControl *)segmentedControl
                                      toggler:(id<ERNToggler>)toggler
                                          url:(NSURL *)url
                                         mime:(NSString *)mime;
@end
