#import "ERNDemoObjectAsyncItemsRepository.h"
#import "ERNDemoObject.h"

@interface ERNDemoObjectAsyncItemsRepository ()
@property (nonatomic, readonly, copy) NSArray *items;
@end

@implementation ERNDemoObjectAsyncItemsRepository

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

+(void)initialize
{
    gItems = @[[ERNDemoObject objectWithTitle:@"Ernstsson.net"
                                         info:@"Blog on software"
                                          url:[NSURL URLWithString:@"http://ernstsson.net"]],
               [ERNDemoObject objectWithTitle:@"ThoughtWorks"
                                         info:@"Software company"
                                          url:[NSURL URLWithString:@"http://thoughtworks.com"]],
               [ERNDemoObject objectWithTitle:@"Google"
                                         info:@"Search engine"
                                          url:[NSURL URLWithString:@"http://google.com"]]];
}
@end
