#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNConverterAsyncRepositoryTest.h"
#import "ERNConverterAsyncRepository.h"

@implementation ERNConverterAsyncRepositoryTest

-(void)testConstructor
{
    assertThat([ERNConverterAsyncRepository new], notNilValue());
}

@end
