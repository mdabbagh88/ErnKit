#import "ERNArrayAsyncItemsRepository.h"
#import "ERNErrorHandler.h"

@implementation ERNArrayAsyncItemsRepository {
    NSArray *_array;
}

#pragma mark - public - constructors

+(instancetype)asyncItemsRepository
{
    return [[self alloc] init];
}

+(instancetype)asyncItemsRepositoryWithArray:(NSArray *)array
{
    return [[self alloc] initWithArray:array];
}

#pragma mark - public - accessors

-(NSArray *)array
{
    return _array = _array ? _array : @[];
}

-(void)setArray:(NSArray *)array
{
    _array = array;
    [self notifyObservers];
}

#pragma mark - ERNAsyncItemsRepository

-(void)enumerateItemsUsingBlock:(ERNRepositoryEnumerationBlock)block
{
    ERNCheckNilNoReturn(block);
    [[self array] enumerateObjectsUsingBlock:block];
}

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate
{
    ERNCheckNilAndReturn(predicate, [self array]);
    return [[self array] filteredArrayUsingPredicate:predicate];
}

-(NSUInteger)count
{
    return [[self array] count];
}

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [self validIndex:index] ? [self array][index] : [NSNull null];
}

#pragma mark - private

-(BOOL)validIndex:(NSUInteger)index
{
    return index < [[self array] count];
}

#pragma mark - private - initializers

-(id)initWithArray:(NSArray *)array
{
    self = [self init];
    ERNCheckNil(self);
    _array = array;
    return self;
}

@end
