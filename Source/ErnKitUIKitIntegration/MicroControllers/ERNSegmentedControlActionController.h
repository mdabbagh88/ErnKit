#import <Foundation/Foundation.h>

@class UISegmentedControl;
@class ERNResource;

@interface ERNSegmentedControlActionController : NSObject
+(instancetype)createWithSegmentedControl:(UISegmentedControl *)segmentedControl
                                  actions:(NSArray *)actions
                                 resource:(ERNResource *)resource;
@end
