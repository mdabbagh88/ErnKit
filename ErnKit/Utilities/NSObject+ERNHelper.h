#import <Foundation/Foundation.h>

#ifdef DEBUG
#define ERNNilParamErrorLog NSLog(@"ERNNilParamError:%s:%d",__FILE__,__LINE__)
#else
#define ERNNilParamErrorLog
#endif
#define ERNCheckNil(object) do {ERNCheckNilAndReturn(object, nil) } while (0)
#define ERNCheckNilAndReturn(object, returnObject) if (!object){ERNNilParamErrorLog;return returnObject;}

@interface NSObject (ERNHelper)
-(instancetype)guaranteeProtocolConformance:(Protocol *)protocol;
-(instancetype)guaranteeSelectorResponse:(SEL)selector;
@end
