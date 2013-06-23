#import <Foundation/Foundation.h>

@protocol ERNAction;

@interface ERNBaseUrlRoutingAction : NSObject
+(instancetype)createWithActions:(NSDictionary *)actions;
-(id<ERNAction>)validActionForRouting:(NSString *)routing;
-(id)initWithActions:(NSDictionary *)actions;
@end
