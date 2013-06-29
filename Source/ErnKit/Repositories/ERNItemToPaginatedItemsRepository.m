#import "ERNItemToPaginatedItemsRepository.h"
#import "ERNAsyncItemRepository.h"
#import "ERNErrorHandler.h"

@interface ERNItemToPaginatedItemsRepository ()
@property (nonatomic, readonly) id<ERNAsyncItemRepository>repository;
@end

@implementation ERNItemToPaginatedItemsRepository {
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncItemRepository>)repository
{
    return [[self alloc] initWithItemRepository:repository];
}

#pragma mark - ERNAsyncItemsRepository

-(void)enumerateItemsUsingBlock:(ERNRepositoryEnumerationBlock)block
{
    ERNCheckNilNoReturn(block);
    [[self itemToArray] enumerateObjectsUsingBlock:block];
}

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate
{
    ERNCheckNilAndReturn(predicate, @[]);
    return [[self itemToArray] filteredArrayUsingPredicate:predicate];
}

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [self validIndex:index] ?
    [self validItem:[[self repository] item]] :
    [NSNull null];
}

-(NSUInteger)count
{
    return 1;
}

#pragma mark - ERNAsyncPaginatedItemsRepository

-(NSUInteger)total
{
    return 1;
}

-(NSUInteger)offset
{
    return 0;
}

-(BOOL)hasPrevious
{
    return NO;
}

-(BOOL)hasNext
{
    return NO;
}

-(void)fetchNext
{
}

-(void)fetchPrevious
{
}

#pragma mark - private

-(BOOL)validIndex:(NSUInteger)index
{
    return index == 0;
}

-(id<NSObject>)validItem:(id<NSObject>)item
{
    return item ? item : [NSNull null];
}

-(NSArray *)itemToArray
{
    return @[[self validItem:[[self repository] item]]];
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