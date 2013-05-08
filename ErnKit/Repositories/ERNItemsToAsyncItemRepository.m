#import "ERNItemsToAsyncItemRepository.h"
#import "ERNAsyncItemsRepository.h"
#import "ERNErrorHandler.h"

@interface ERNItemsToAsyncItemRepository ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository>repository;
@end

@implementation ERNItemsToAsyncItemRepository {
}

#pragma mark - public - constructors

+(instancetype)asyncItemRepositoryWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initWithItemsRepository:repository];
}

#pragma mark - ERNAsyncItemRepository

-(id<NSObject>)item
{
    return [[self repository] count] ? [self repository][0] : [NSNull null];
}

#pragma mark - private - initializers

-(id)initWithItemsRepository:(id<ERNAsyncItemsRepository>)repository
{
    self = [self initWithRepository:repository];
    ERNCheckNil(self);
    _repository = repository;
    return self;
}

@end
