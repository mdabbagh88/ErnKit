#import "ERNItemsToAsyncItemRepository.h"
#import "ERNAsyncPaginatedItemsRepository.h"
#import "ERNErrorHandler.h"
#import "ERNNullAsyncPaginatedItemsRepository.h"

@interface ERNItemsToAsyncItemRepository ()
@property (nonatomic, readonly) id<ERNAsyncPaginatedItemsRepository>repository;
@end

@implementation ERNItemsToAsyncItemRepository {
    id<ERNAsyncPaginatedItemsRepository> _repository;
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
{
    return [[self alloc] initWithItemsRepository:repository];
}

#pragma mark - ERNAsyncItemRepository

-(id<NSObject>)item
{
    return [[self repository] itemAtIndex:0];
}

#pragma mark - private - accessors

-(id<ERNAsyncPaginatedItemsRepository>)repository
{
    return _repository = _repository ? _repository : [ERNNullAsyncPaginatedItemsRepository create];
}

#pragma mark - private - initializers

-(id)initWithItemsRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
{
    self = [self initWithRepository:repository];
    ERNCheckNil(self);
    _repository = repository;
    return self;
}

@end
