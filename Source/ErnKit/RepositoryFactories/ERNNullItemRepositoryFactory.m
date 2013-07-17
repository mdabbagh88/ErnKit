#import "ERNNullItemRepositoryFactory.h"
#import "ERNNullAsyncItemRepository.h"

static ERNNullItemRepositoryFactory *immutableSingleton;

@implementation ERNNullItemRepositoryFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNRepositoryFactory

-(BOOL)hasItemRepositoryForResource:(ERNResource *)__unused resource
{
    return NO;
}

-(id<ERNAsyncItemRepository>)itemRepositoryForResource:(ERNResource *)__unused resource
{
    return [ERNNullAsyncItemRepository create];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}
@end
