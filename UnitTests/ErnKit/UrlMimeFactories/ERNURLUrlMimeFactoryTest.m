#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNURLUrlMimeFactoryTest.h"
#import "ERNURLUrlMimeFactory.h"

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
    id<ERNUrlMimeFactory> factory1 = [ERNURLUrlMimeFactory create];
    id<ERNUrlMimeFactory> factory2 = [ERNURLUrlMimeFactory create];

    //then
    assertThat(factory1, equalTo(factory2));
}

-(void)testMimeNilObject
{
    //given
    id<ERNUrlMimeFactory> factory = [ERNURLUrlMimeFactory create];

    //when
    NSString *mime = [factory mimeForObject:nil];

    //then
    assertThat(mime, notNilValue());
}

-(void)testUrlNilObject
{
    //given
    id<ERNUrlMimeFactory> factory = [ERNURLUrlMimeFactory create];

    //when
    NSURL *url = [factory urlForObject:nil];

    //then
    assertThat(url, notNilValue());
}

-(void)testMimeObject
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNUrlMimeFactory> factory = [ERNURLUrlMimeFactory create];

    //when
    NSString *mime = [factory mimeForObject:mockObject];

    //then
    assertThat(mime, notNilValue());
    [mockObject verify];
}

-(void)testUrlObject
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNUrlMimeFactory> factory = [ERNURLUrlMimeFactory create];

    //when
    NSURL *url = [factory urlForObject:mockObject];

    //then
    assertThat(url, notNilValue());
    [mockObject verify];
}

-(void)testMimeURLObject
{
    //given
    NSURL *url = [NSURL URLWithString:@"url"];
    id<ERNUrlMimeFactory> factory = [ERNURLUrlMimeFactory create];

    //when
    NSString *mime = [factory mimeForObject:url];

    //then
    assertThat(mime, notNilValue());
}

-(void)testUrlURLObject
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    id<ERNUrlMimeFactory> factory = [ERNURLUrlMimeFactory create];

    //when
    NSURL *url = [factory urlForObject:expectedUrl];

    //then
    assertThat(url, equalTo(expectedUrl));
}

@end
