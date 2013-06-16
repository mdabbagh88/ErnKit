#import <Foundation/Foundation.h>

@interface ERNMutableDictionaryWithDefault : NSMutableDictionary
+(instancetype)createWithDefault:(id)defaultValue;
@end
