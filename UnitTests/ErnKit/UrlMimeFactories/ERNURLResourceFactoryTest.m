#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNURLResourceFactoryTest.h"
#import "ERNURLResourceFactory.h"
#import "ERNResource.h"

@implementation ERNURLResourceFactoryTest

-(void)testMime
{
    //given, when
    NSString *mime = [ERNURLResourceFactory mime];

    //then
    assertThat(mime, notNilValue());
}

-(void)testSingleton
{
    //given, when
    id<ERNResourceFactory> factory1 = [ERNURLResourceFactory create];
    id<ERNResourceFactory> factory2 = [ERNURLResourceFactory create];

    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
}

-(void)testMimeNilObject
{
    //given
    id<ERNResourceFactory> factory = [ERNURLResourceFactory create];

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
    id<ERNResourceFactory> factory = [ERNURLResourceFactory create];

    //when
    ERNResource *resource = [factory resourceForObject:mockObject];

    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
    [mockObject verify];
}

-(void)testMimeURLObject
{
    //given
    NSURL *url = [NSURL URLWithString:@"url"];
    id<ERNResourceFactory> factory = [ERNURLResourceFactory create];

    //when
    ERNResource *resource = [factory resourceForObject:url];

    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
}

@end
