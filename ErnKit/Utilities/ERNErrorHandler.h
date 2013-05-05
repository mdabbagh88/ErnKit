#import <Foundation/Foundation.h>
#ifdef DEBUG
#define ERNNilParamErrorLog NSLog(@"ERNNilParamError:%s:%d",__FILE__,__LINE__)
#else
#define ERNNilParamErrorLog
#endif
#define ERNCheckNil(obj) do {ERNCheckNilAndReturn(obj, nil) } while (0)
#define ERNCheckNilAndReturn(obj, retObj) if (!obj){ERNNilParamErrorLog;return retObj;}
#define ERNCheckNilNoReturn(obj) if (!obj){ERNNilParamErrorLog;return;}
