#import "ERNItemToAsyncItemsRepository.h"
#import "ERNAsyncItemRepository.h"
#import "NSObject+ERNHelper.h"

@interface ERNItemToAsyncItemsRepository ()
@property (nonatomic, readonly) id<ERNAsyncItemRepository>repository;
@end

@implementation ERNItemToAsyncItemsRepository

-(void)enumerateItemsUsingBlock:(void (^)(id<NSObject>, NSUInteger, BOOL *))block
{
    [[self itemToArray] enumerateObjectsUsingBlock:block];
}

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate
{
    return [[self itemToArray] filteredArrayUsingPredicate:predicate];
}

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [[self repository] item];
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
