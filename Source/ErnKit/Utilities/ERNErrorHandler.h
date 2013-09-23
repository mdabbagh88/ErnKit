#import <Foundation/Foundation.h>
#ifdef DEBUG
#define ERNNilParamErrorLog NSLog(@"ERNNilParamError:%s:%d",__FILE__,__LINE__)
#else
#define ERNNilParamErrorLog
#endif
#define ERNCheckNil(obj) do {ERNCheckNilAndReturn(obj, nil) } while (0)
#define ERNCheckNilAndReturn(obj, retObj) if (!obj){ERNNilParamErrorLog;return retObj;}
#define ERNCheckNilNoReturn(obj) if (!obj){ERNNilParamErrorLog;return;}
#define ERNLazyLoadSingletonWithLoader(loader) ^{static id immutableSingleton;static dispatch_once_t pred;dispatch_once(&pred, ^{immutableSingleton = loader;});return immutableSingleton;}();
#define ERNLazyLoadSingleton() ERNLazyLoadSingletonWithLoader([self new]);
#define ERNLazyLoadGetter(type, member, loader) -(type)member { return _##member = _##member ? _##member : loader;}
