#import "ERNNullRepositoryPaginator.h"
#import "NSURL+ERNHelper.h"

static ERNNullRepositoryPaginator *immutableSingleton;

@implementation ERNNullRepositoryPaginator {
    NSNumber *_total;
    NSURL *_nextPage;
    NSURL *_previousPage;
    NSArray *_items;
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNRepositoryPaginator

-(NSNumber *)total
{
    return _total = _total ? _total : @0;
}

-(NSURL *)nextPage
{
    return _nextPage = _nextPage ? _nextPage : [NSURL ERN_createNull];
}

-(NSURL *)previousPage
{
    return _previousPage = _previousPage ? _previousPage : [NSURL ERN_createNull];
}

-(NSArray *)items
{
    return _items = _items ? _items : @[];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
