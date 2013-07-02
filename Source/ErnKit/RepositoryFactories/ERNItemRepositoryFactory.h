#import <Foundation/Foundation.h>

@protocol ERNAsyncItemRepository;
@class ERNResource;

@protocol ERNItemRepositoryFactory <NSObject>
-(BOOL)hasItemRepositoryForResource:(ERNResource *)resource;
-(id<ERNAsyncItemRepository>)itemRepositoryForResource:(ERNResource *)resource;
@end
