#import <Foundation/Foundation.h>

@protocol ERNAsyncPaginatedItemsRepository;
@class ERNResource;

@protocol ERNRepositoryFactory <NSObject>
-(BOOL)hasRepositoryForResource:(ERNResource *)resource;
-(id<ERNAsyncPaginatedItemsRepository>)repositoryForResource:(ERNResource *)resource;
@end
