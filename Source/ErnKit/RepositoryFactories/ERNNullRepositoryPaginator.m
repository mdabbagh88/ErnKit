#import "ERNNullRepositoryPaginator.h"
#import "ERNErrorHandler.h"
#import "NSURL+ERNHelper.h"

@implementation ERNNullRepositoryPaginator {
    NSNumber *_total;
    NSURL *_nextPage;
    NSURL *_previousPage;
    NSArray *_items;
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
}

#pragma mark - ERNRepositoryPaginator

ERNLazyLoadGetter(NSNumber *, total, @0)

ERNLazyLoadGetter(NSURL *, nextPage, [NSURL ERN_createNull])

ERNLazyLoadGetter(NSURL *, previousPage, [NSURL ERN_createNull])

ERNLazyLoadGetter(NSArray *, items, @[])

@end
