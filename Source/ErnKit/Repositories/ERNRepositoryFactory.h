#import <Foundation/Foundation.h>

@protocol ERNAsyncRepository;
@protocol ERNAsyncItemRepository;
@protocol ERNAsyncItemsRepository;
@protocol ERNAsyncPaginatedItemsRepository;

@protocol ERNRepositoryFactory <NSObject>
-(id<ERNAsyncRepository>)repositoryForUrl:(NSURL *)url
                                     mime:(NSString *)mime;
-(id<ERNAsyncItemRepository>)itemRepositoryForUrl:(NSURL *)url
                                             mime:(NSString *)mime;
-(id<ERNAsyncItemsRepository>)itemsRepositoryForUrl:(NSURL *)url
                                               mime:(NSString *)mime;
-(id<ERNAsyncPaginatedItemsRepository>)paginatedItemsRepositoryForUrl:(NSURL *)url
                                                                 mime:(NSString *)mime;
@end
