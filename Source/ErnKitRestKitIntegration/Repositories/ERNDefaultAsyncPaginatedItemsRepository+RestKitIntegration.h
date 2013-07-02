#import "ERNDefaultAsyncPaginatedItemsRepository.h"

@class RKResponseDescriptor;

@interface ERNDefaultAsyncPaginatedItemsRepository (RestKitIntegration)
+(instancetype)createWithResource:(ERNResource *)resource
               responseDescriptor:(RKResponseDescriptor *)responseDescriptor
                       windowSize:(NSUInteger)windowSize;
@end
