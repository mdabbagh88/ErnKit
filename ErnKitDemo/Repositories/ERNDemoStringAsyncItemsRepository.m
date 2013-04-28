#import "ERNDemoStringAsyncItemsRepository.h"

@interface ERNDemoStringAsyncItemsRepository ()
@property (nonatomic, readwrite, copy) NSArray *items;
@end

@implementation ERNDemoStringAsyncItemsRepository

@synthesize items = _items;

static NSArray *gItems1;
static NSArray *gItems2;

-(void)refresh
{
    [self setItems:([self items] == gItems1 ? gItems2 : gItems1)];
    [self notifyObservers];
}

-(NSArray *)items
{
    _items = _items ? _items : gItems1;
    return _items;
}

-(void)enumerateItemsUsingBlock:(void (^)(id<NSObject>, NSUInteger, BOOL *))block
{
    [[self items] enumerateObjectsUsingBlock:block];
}

-(NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate
{
    return [[self items] filteredArrayUsingPredicate:predicate];
}

-(NSUInteger)count
{
    return [[self items] count];
}

-(id<NSObject>)itemAtIndex:(NSUInteger)index
{
    return [self items][index];
}

+(instancetype)asyncItemsRepository
{
    return [[self alloc] init];
}

+(void)initialize
{
    gItems1 = @[@"An item",
                @"Another item",
                @"Yet another item",
                @"Last item"];

    gItems2 = @[@"A refreshed item",
              @"Another refreshed item",
              @"Yet another item",
              @"Last item"];
}

@end
