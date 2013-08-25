#import "ERNDefaultRepositoryPaginator.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

@implementation ERNDefaultRepositoryPaginator {
    NSNumber *_total;
    NSURL *_nextPage;
    NSURL *_previousPage;
    NSArray *_items;
}

#pragma mark - public - constructors

+(instancetype)create
{
    return [self new];
}

#pragma mark - ERNRepositoryPaginator

-(NSNumber *)total
{
    return _total = _total ? _total : @UINT_MAX;
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

@end
