#import "ERNDemoStringAsyncItemsRepository.h"

@interface ERNDemoStringAsyncItemsRepository ()
@property (nonatomic, readonly, copy) NSArray *items;
@end

@implementation ERNDemoStringAsyncItemsRepository

static NSArray *gItems;

-(id<NSFastEnumeration>)enumeration
{
    return [self items];
}

-(NSInteger)count
{
    return [[self items] count];
}

-(id<NSObject>)itemAtIndex:(NSInteger)index
{
    return [self items][index];
}

-(id)initWithItems:(NSArray *)items
{
    self = [super init];
    _items = items;
    return self;
}

-(id)init
{
    return [self initWithItems:gItems];
}

+(instancetype)asyncItemsRepository
{
    return [[self alloc] init];
}

+(instancetype)asyncItemsRepositoryWithItems:(NSArray *)items
{
    return [[self alloc] initWithItems:items];
}

+(void)initialize
{
    gItems = @[@"An item",
              @"Another item",
              @"Yet another item",
              @"Last item"];
}

@end
