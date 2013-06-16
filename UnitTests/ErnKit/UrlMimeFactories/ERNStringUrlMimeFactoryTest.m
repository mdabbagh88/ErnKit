#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNStringUrlMimeFactoryTest.h"
#import "ERNStringUrlMimeFactory.h"
#import "ERNResource.h"

@implementation ERNStringUrlMimeFactoryTest

-(void)testMime
{
    //given, when
    NSString *mime = [ERNStringUrlMimeFactory mime];

    //then
    assertThat(mime, notNilValue());
}

-(void)testSingleton
{
    //given, when
    id<ERNResourceFactory> factory1 = [ERNStringUrlMimeFactory create];
    id<ERNResourceFactory> factory2 = [ERNStringUrlMimeFactory create];

    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
}

-(void)testResourceNilObject
{
    //given
    id<ERNResourceFactory> factory = [ERNStringUrlMimeFactory create];

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
    id<ERNResourceFactory> factory = [ERNStringUrlMimeFactory create];

    //when
    ERNResource *resource = [factory resourceForObject:mockObject];

    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
    [mockObject verify];
}

-(void)testMimeStringObject
{
    //given
    id<ERNResourceFactory> factory = [ERNStringUrlMimeFactory create];

    //when
    ERNResource *resource = [factory resourceForObject:@"string"];

    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
}

@end
