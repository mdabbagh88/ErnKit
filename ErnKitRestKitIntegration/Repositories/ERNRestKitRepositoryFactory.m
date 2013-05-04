#import <RestKit/RestKit.h>
#import "ERNRestKitRepositoryFactory.h"

@interface ERNRestKitRepositoryFactory ()
@property (nonatomic, readonly) id<ERNRepositoryFactory>repositoryFactory;
@property (nonatomic, readonly) RKObjectManager *objectManager;
@end

@implementation ERNRestKitRepositoryFactory

-(id<ERNAsyncItemRepository>)repositoryForUrl:(NSURL *)url
{
}

@end
