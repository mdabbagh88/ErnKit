#import "ERNRepositoryPaginatorTest.h"
#import "NSURL+ERNHelper.h"
#import "ERNDefaultRepositoryPaginatorTest.h"
#import "ERNDefaultRepositoryPaginator.h"

@implementation ERNDefaultRepositoryPaginatorTest {
}

#pragma mark - ERNRepositoryPaginator protocol tests

-(void)testRepositoryPaginatorProtocol
{
    [ERNRepositoryPaginatorTest testRepositoryPaginator:
     [ERNDefaultRepositoryPaginator create]];
}

@end
