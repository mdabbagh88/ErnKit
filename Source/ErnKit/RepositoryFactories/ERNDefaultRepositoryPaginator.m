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

ERNLazyLoadGetter(NSNumber *, total, @UINT_MAX)

ERNLazyLoadGetter(NSURL *, nextPage, [NSURL ERN_createNull])

ERNLazyLoadGetter(NSURL *, previousPage, [NSURL ERN_createNull])

ERNLazyLoadGetter(NSArray *, items, @[])

@end
