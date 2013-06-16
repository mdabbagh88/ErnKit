#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullUrlMimeFactoryTest.h"
#import "ERNResource.h"
#import "ERNNullResourceFactory.h"

@implementation ERNNullUrlMimeFactoryTest

-(void)testSingleton
{
    //given, when
    id<ERNResourceFactory> factory1 = [ERNNullResourceFactory create];
    id<ERNResourceFactory> factory2 = [ERNNullResourceFactory create];

    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
}

-(void)testMimeNilObject
{
    //given
    id<ERNResourceFactory> factory = [ERNNullResourceFactory create];

    //when
    ERNResource *resource = [factory resourceForObject:nil];

    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
}

-(void)testMimeObject
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
