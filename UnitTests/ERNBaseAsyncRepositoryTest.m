#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNBaseAsyncRepositoryTest.h"
#import "ERNBaseAsyncRepository.h"

@implementation ERNBaseAsyncRepositoryTest

-(void)testConstructor
{
    assertThat([ERNBaseAsyncRepository new], notNilValue());
}

@end
