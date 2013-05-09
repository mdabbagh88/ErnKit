#import <Foundation/Foundation.h>

@protocol ERNAsyncItemRepository;

@protocol ERNRepositoryFactory <NSObject>
-(id<ERNAsyncItemRepository>)repositoryForUrl:(NSURL *)url;
@end
