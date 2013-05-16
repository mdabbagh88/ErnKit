#import <Foundation/Foundation.h>

@class UIRefreshControl;
@protocol ERNAsyncRepository;

@interface ERNRefreshControlRepositoryRefreshController : NSObject
+(instancetype)createWithRefreshControl:(UIRefreshControl *)refreshControl
                             repository:(id<ERNAsyncRepository>)repository;
@end
