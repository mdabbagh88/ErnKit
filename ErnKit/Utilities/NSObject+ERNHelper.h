#import <Foundation/Foundation.h>

@interface NSObject (ERNHelper)
-(instancetype)guaranteeProtocolConformance:(Protocol *)protocol;
-(instancetype)guaranteeSelectorResponse:(SEL)selector;
@end
