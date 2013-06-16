#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNURLUrlMimeFactoryTest.h"
#import "ERNURLUrlMimeFactory.h"
#import "ERNResource.h"

@implementation ERNURLUrlMimeFactoryTest

-(void)testMime
{
    //given, when
    NSString *mime = [ERNURLUrlMimeFactory mime];

    //then
    assertThat(mime, notNilValue());
}

-(void)testSingleton
{
    //given, when
    id<ERNResourceFactory> factory1 = [ERNURLUrlMimeFactory create];
    id<ERNResourceFactory> factory2 = [ERNURLUrlMimeFactory create];

    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
}

-(void)testMimeNilObject
{
    //given
    id<ERNResourceFactory> factory = [ERNURLUrlMimeFactory create];

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
    id<ERNResourceFactory> factory = [ERNURLUrlMimeFactory create];

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
    id<ERNResourceFactory> factory = [ERNURLUrlMimeFactory create];

    //when
    ERNResource *resource = [factory resourceForObject:url];

    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
}

@end
