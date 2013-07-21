#import "ERNItemsToAsyncPaginatedItemsRepository.h"
#import "ERNErrorHandler.h"
#import "ERNNullAsyncItemsRepository.h"

@interface ERNItemsToAsyncPaginatedItemsRepository ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository> repository;
@end

@implementation ERNItemsToAsyncPaginatedItemsRepository {
    id<ERNAsyncItemsRepository> _repository;
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initWithItemsRepository:repository];
}

#pragma mark - public - accessors

-(id<NSObject>)item
{
    return [[self repository] item];
}

#pragma mark - ERNAsyncPaginatedItemsRepository

-(NSUInteger)total
{
    return [[self repository] count];
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

#pragma mark - ERNAsyncItemsRepository

-(NSUInteger)count
{
    return [[self repository] count];
}

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [[self repository] itemAtIndex:index];
}

-(void)enumerateItemsUsingBlock:(ERNRepositoryEnumerationBlock)block
{
    ERNCheckNilNoReturn(block);
    [[self repository] enumerateItemsUsingBlock:block];
}

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate
{
    ERNCheckNilAndReturn(predicate, @[]);
    return [[self repository] filteredArrayUsingPredicate:predicate];
}

#pragma mark - private - accessors

-(id<ERNAsyncItemsRepository>)repository
{
    return _repository = _repository ? _repository : [ERNNullAsyncItemsRepository create];
}

#pragma mark - private - initializers

-(id)initWithItemsRepository:(id<ERNAsyncItemsRepository>)repository
{
    self = [super initWithRepository:repository];
    ERNCheckNil(self);
    _repository = repository;
    return self;
}

@end
