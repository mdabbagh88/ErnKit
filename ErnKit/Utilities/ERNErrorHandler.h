#import <Foundation/Foundation.h>
#ifdef DEBUG
#define ERNNilParamErrorLog NSLog(@"ERNNilParamError:%s:%d",__FILE__,__LINE__)
#else
#define ERNNilParamErrorLog
#endif
#define ERNCheckNil(object) do {ERNCheckNilAndReturn(object, nil) } while (0)
#define ERNCheckNilAndReturn(object, returnObject) if (!object){ERNNilParamErrorLog;return returnObject;}
#define ERNCheckNilNoReturn(object) if (!object){ERNNilParamErrorLog;return;}
