#import "ERNNullRepositoryPaginator.h"
#import "NSURL+ERNHelper.h"

static ERNNullRepositoryPaginator *paginator;

@implementation ERNNullRepositoryPaginator {
    NSURL *_nextPage;
    NSURL *_previousPage;
}

#pragma mark - public - constructors

+(instancetype)paginator
{
    return paginator;
}

#pragma mark - ERNRepositoryPaginator

-(NSUInteger)count
{
    return 0;
}

-(NSURL *)nextPage
{
    return _nextPage = _nextPage ? _nextPage : [NSURL nullURL];
}

-(NSURL *)previousPage
{
    return _previousPage = _previousPage ? _previousPage : [NSURL nullURL];
}

-(NSArray *)items
{
    return @[];
}

#pragma mark - NSObject

+(void)initialize
{
    paginator = [self new];
}

@end
