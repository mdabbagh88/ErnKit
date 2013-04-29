#import <Foundation/Foundation.h>

#define ERNCheckNil(object) if (!object){return nil;}
#define ERNCheckNilAndReturn(object, returnObject) if (!object){return returnObject;}

@interface NSObject (ERNHelper)
-(instancetype)guaranteeProtocolConformance:(Protocol *)protocol;
-(instancetype)guaranteeSelectorResponse:(SEL)selector;
@end
