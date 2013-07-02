#import "ERNDefaultAsyncPaginatedItemsRepository+RestKitIntegration.h"
#import "ERNRestKitAsyncItemsRepository.h"
#import "ERNRestKitAsyncItemRepositoryFactory.h"

@implementation ERNDefaultAsyncPaginatedItemsRepository (RestKitIntegration)

+(instancetype)createWithResource:(ERNResource *)resource
               responseDescriptor:(RKResponseDescriptor *)responseDescriptor
                       windowSize:(NSUInteger)windowSize
{
    return [self createWithResource:resource
              itemRepositoryFactory:[ERNRestKitAsyncItemRepositoryFactory
                                     createWithResponseDescriptor:responseDescriptor]
                         windowSize:windowSize];
}

@end
