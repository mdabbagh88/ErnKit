#import "ERNItemsToAsyncItemRepository.h"
#import "ERNAsyncItemsRepository.h"
#import "NSObject+ERNHelper.h"

@interface ERNItemsToAsyncItemRepository ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository>repository;
@end

@implementation ERNItemsToAsyncItemRepository

-(id<NSObject>)item
{
    return [[self repository] count] ? [[self repository] itemAtIndex:0] : [NSNull null];
}

-(id)initWithItemsRepository:(id<ERNAsyncItemsRepository>)repository
{
    self = [self initWithRepository:repository];
    ERNCheckNil(self);
    _repository = repository;
    return self;
}

+(instancetype)asyncItemRepositoryWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initWithItemsRepository:repository];
}

@end
