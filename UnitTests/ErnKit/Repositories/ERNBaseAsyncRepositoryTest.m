#import "ERNBaseAsyncRepositoryTest.h"
#import "ERNBaseAsyncRepository.h"
#import "ERNAsyncRepositoryTest.h"

@implementation ERNBaseAsyncRepositoryTest {
}

#pragma mark - ERNAsyncRepository protocol tests

-(void)testAsyncRepositoryProtocol
{
    [ERNAsyncRepositoryTest testAsyncRepository:[ERNBaseAsyncRepository create]];
}

@end
