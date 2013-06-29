#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullResourceFactoryTest.h"
#import "ERNResource.h"
#import "ERNNullResourceFactory.h"
#import "ERNResourceFactoryTest.h"

@implementation ERNNullResourceFactoryTest {
}

#pragma mark - ERNResourceFactory protocol tests

-(void)testResourceFactoryProtocol
{
    [ERNResourceFactoryTest testResourceFactory:[ERNNullResourceFactory create]];
}

#pragma mark - class tests

-(void)testSingleton
{
    //given, when
    id<ERNResourceFactory> factory1 = [ERNNullResourceFactory create];
    id<ERNResourceFactory> factory2 = [ERNNullResourceFactory create];

    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
}

@end
