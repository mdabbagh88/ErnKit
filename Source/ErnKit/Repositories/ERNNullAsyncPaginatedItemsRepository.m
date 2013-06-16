#import "ERNNullAsyncPaginatedItemsRepository.h"

@implementation ERNNullAsyncPaginatedItemsRepository {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return [self new];
}

#pragma mark - ERNAsyncPaginatedItemsRepository

-(NSUInteger)total
{
    return 0;
}

-(NSUInteger)offset
{
    return 0;
}


-(BOOL)hasPrevious
{
    return NO;
}

-(BOOL)hasNext
{
    return NO;
}

-(void)fetchNext
{
}

-(void)fetchPrevious
{
}

@end
