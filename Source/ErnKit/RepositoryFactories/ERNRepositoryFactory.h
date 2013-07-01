#import <Foundation/Foundation.h>

@protocol ERNAsyncRepository;
@protocol ERNAsyncItemRepository;
@protocol ERNAsyncItemsRepository;
@protocol ERNAsyncPaginatedItemsRepository;
@class ERNResource;

@protocol ERNRepositoryFactory <NSObject>
-(BOOL)hasRepositoryForResource:(ERNResource *)resource;
-(BOOL)hasItemRepositoryForResource:(ERNResource *)resource;
-(BOOL)hasItemsRepositoryForResource:(ERNResource *)resource;
-(BOOL)hasPaginatedItemsRepositoryForResource:(ERNResource *)resource;
-(id<ERNAsyncRepository>)repositoryForResource:(ERNResource *)resource;
-(id<ERNAsyncItemRepository>)itemRepositoryForResource:(ERNResource *)resource;
-(id<ERNAsyncItemsRepository>)itemsRepositoryForResource:(ERNResource *)resource;
-(id<ERNAsyncPaginatedItemsRepository>)paginatedItemsRepositoryForResource:(ERNResource *)resource;
@end
