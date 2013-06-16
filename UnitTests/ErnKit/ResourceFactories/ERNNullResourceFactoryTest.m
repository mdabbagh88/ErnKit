#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullResourceFactoryTest.h"
#import "ERNResource.h"
#import "ERNNullResourceFactory.h"

@implementation ERNNullResourceFactoryTest

-(void)testSingleton
{
    //given, when
    id<ERNResourceFactory> factory1 = [ERNNullResourceFactory create];
    id<ERNResourceFactory> factory2 = [ERNNullResourceFactory create];

    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
}

-(void)testResourceNilObject
{
    //given
    id<ERNResourceFactory> factory = [ERNNullResourceFactory create];

    //when
    ERNResource *resource = [factory resourceForObject:nil];

    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
}

-(void)testResourceObject
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNResourceFactory> factory = [ERNNullResourceFactory create];

    //when
    ERNResource *resource = [factory resourceForObject:mockObject];

    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
    [mockObject verify];
}

@end
