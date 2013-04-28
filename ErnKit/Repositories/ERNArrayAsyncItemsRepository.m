#import "ERNArrayAsyncItemsRepository.h"
#import "NSObject+ERNHelper.h"

@implementation ERNArrayAsyncItemsRepository

@synthesize array = _array;

-(NSArray *)array
{
    _array = _array ? _array : @[];
    return _array;
}

-(void)setArray:(NSArray *)array
{
    _array = array;
    [self notifyObservers];
}

-(void)enumerateItemsUsingBlock:(void (^)(id<NSObject>, NSUInteger, BOOL *))block
{
    [[self array] enumerateObjectsUsingBlock:block];
}

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate
{
    return [[self array] filteredArrayUsingPredicate:predicate];
}

-(NSUInteger)count
{
    return [[self array] count];
}

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [self array][index];
}

-(id)initWithArray:(NSArray *)array
{
    self = [self init];
    ERNCheckNil(self);
    _array = array;
    return self;
}

+(instancetype)asyncItemsRepositoryWithArray:(NSArray *)array
{
    return [[self alloc] initWithArray:array];
}

+(instancetype)asyncItemsRepository
{
    return [[self alloc] init];
}

@end
