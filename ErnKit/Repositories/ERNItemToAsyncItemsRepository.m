#import "ERNItemToAsyncItemsRepository.h"
#import "ERNAsyncItemRepository.h"
#import "NSObject+ERNHelper.h"

@interface ERNItemToAsyncItemsRepository ()
@property (nonatomic, readonly) id<ERNAsyncItemRepository>repository;
@end

@implementation ERNItemToAsyncItemsRepository

-(void)enumerateItemsUsingBlock:(void (^)(id<NSObject>, NSUInteger, BOOL *))block
{
    ERNCheckNil(block);
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

-(BOOL)validIndex:(NSUInteger)index
{
    return index == 0;
}

-(NSArray *)itemToArray
{
    return [self hasItem] ? @[[[self repository] item]] : @[];
}

-(NSUInteger)count
{
    return (NSUInteger)[self hasItem];
}

-(BOOL)hasItem
{
    return (BOOL)[[self repository] item];
}

-(id)initWithItemRepository:(id<ERNAsyncItemRepository>)repository
{
    self = [self initWithRepository:repository];
    ERNCheckNil(self);
    _repository = repository;
    return self;
}

+(instancetype)asyncItemsRepositoryWithRepository:(id<ERNAsyncItemRepository>)repository
{
    return [[self alloc] initWithItemRepository:repository];
}

@end
