#import "ERNNullRepositoryPaginator.h"
#import "NSURL+ERNHelper.h"

static ERNNullRepositoryPaginator *immutableSingleton;

@implementation ERNNullRepositoryPaginator {
    NSURL *_nextPage;
    NSURL *_previousPage;
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNRepositoryPaginator

-(NSUInteger)count
{
    return 0;
}

-(NSURL *)nextPage
{
    return _nextPage = _nextPage ? _nextPage : [NSURL createNull];
}

-(NSURL *)previousPage
{
    return _previousPage = _previousPage ? _previousPage : [NSURL createNull];
}

-(NSArray *)items
{
    return @[];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
