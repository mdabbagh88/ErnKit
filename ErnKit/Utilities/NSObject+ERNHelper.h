#import <Foundation/Foundation.h>

#define ERNCheckNil(object) if (!object){return nil;}

@interface NSObject (ERNHelper)
-(instancetype)guaranteeProtocolConformance:(Protocol *)protocol;
-(instancetype)guaranteeSelectorResponse:(SEL)selector;
@end
