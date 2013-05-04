#import "ERNItemToAsyncItemsRepository.h"
#import "ERNAsyncItemRepository.h"
#import "ERNErrorHandler.h"

@interface ERNItemToAsyncItemsRepository ()
@property (nonatomic, readonly) id<ERNAsyncItemRepository>repository;
@end

@implementation ERNItemToAsyncItemsRepository {
}

#pragma mark - public - constructors

+(instancetype)asyncItemsRepositoryWithRepository:(id<ERNAsyncItemRepository>)repository
{
    return [[self alloc] initWithItemRepository:repository];
}

#pragma mark - ERNAsyncItemsRepository

-(void)enumerateItemsUsingBlock:(void (^)(id<NSObject>, NSUInteger, BOOL *))block
{
    ERNCheckNilNoReturn(block);
    [[self itemToArray] enumerateObjectsUsingBlock:block];
}

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate
{
    ERNCheckNilAndReturn(predicate, [self itemToArray]);
    return [[self itemToArray] filteredArrayUsingPredicate:predicate];
}

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [self validIndex:index] ? [[self repository] item] : [NSNull null];
}

-(NSUInteger)count
{
    return (NSUInteger)[self hasItem];
}

#pragma mark - private

-(BOOL)validIndex:(NSUInteger)index
{
    return index == 0;
}

-(NSArray *)itemToArray
{
    return [self hasItem] ? @[[[self repository] item]] : @[];
}

-(BOOL)hasItem
{
    return (BOOL)[[self repository] item];
}

#pragma mark - private - initializers

-(id)initWithItemRepository:(id<ERNAsyncItemRepository>)repository
{
    self = [self initWithRepository:repository];
    ERNCheckNil(self);
    _repository = repository;
    return self;
}

@end
