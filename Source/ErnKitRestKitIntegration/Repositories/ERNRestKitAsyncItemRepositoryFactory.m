#import "ERNRestKitAsyncItemRepositoryFactory.h"
#import "ERNRestKitAsyncItemsRepository.h"
#import "ERNItemsToAsyncPaginatedItemsRepository.h"
#import "ERNErrorHandler.h"

@interface ERNRestKitAsyncItemRepositoryFactory ()
@property (nonatomic, readonly) RKResponseDescriptor *responseDescriptor;
@end

@implementation ERNRestKitAsyncItemRepositoryFactory {
}

#pragma mark - public - constructors

+(instancetype)createWithResponseDescriptor:(RKResponseDescriptor *)responseDescriptor
{
    return [[self alloc] initWithResponseDescriptor:responseDescriptor];
}

#pragma mark - ERNItemRepositoryFactory

-(BOOL)hasRepositoryForResource:(ERNResource *) resource
{
    ERNCheckNilAndReturn(resource, NO);
    return YES;
}

-(id<ERNAsyncPaginatedItemsRepository>)repositoryForResource:(ERNResource *)resource
{
    return [ERNItemsToAsyncPaginatedItemsRepository createWithRepository:
            [ERNRestKitAsyncItemsRepository createWithResource:resource
                                            responseDescriptor:[self responseDescriptor]]];
}

#pragma mark - private - initializers

-(id)initWithResponseDescriptor:(RKResponseDescriptor *)responseDescriptor
{
    self = [super init];
    ERNCheckNil(self);
    _responseDescriptor = responseDescriptor;
    return self;
}

@end
