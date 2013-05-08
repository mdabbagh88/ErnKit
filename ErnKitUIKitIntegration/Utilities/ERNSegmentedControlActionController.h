#import <Foundation/Foundation.h>

@class UISegmentedControl;

@interface ERNSegmentedControlActionController : NSObject
+(instancetype)createWithSegmentedControl:(UISegmentedControl *)segmentedControl
                                  actions:(NSArray *)actions
                                      url:(NSURL *)url
                                     mime:(NSString *)mime;
@end
