#import "ERNItemsToAsyncItemRepository.h"
#import "ERNAsyncItemsRepository.h"
#import "ERNErrorHandler.h"
#import "ERNNullAsyncItemsRepository.h"

@interface ERNItemsToAsyncItemRepository ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository>repository;
@end

@implementation ERNItemsToAsyncItemRepository {
    id<ERNAsyncItemsRepository> _repository;
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initWithItemsRepository:repository];
}

#pragma mark - ERNAsyncItemRepository

-(id<NSObject>)item
{
    return [[self repository] itemAtIndex:0];
}

#pragma mark - private - accessors

-(id<ERNAsyncItemsRepository>)repository
{
    return _repository = _repository ? _repository : [ERNNullAsyncItemsRepository create];
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
