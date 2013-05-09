#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNStringUrlMimeFactoryTest.h"
#import "ERNStringUrlMimeFactory.h"

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
    id<ERNUrlMimeFactory> factory1 = [ERNStringUrlMimeFactory create];
    id<ERNUrlMimeFactory> factory2 = [ERNStringUrlMimeFactory create];

    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
}

-(void)testMimeNilObject
{
    //given
    id<ERNUrlMimeFactory> factory = [ERNStringUrlMimeFactory create];

    //when
    NSString *mime = [factory mimeForObject:nil];

    //then
    assertThat(mime, notNilValue());
}

-(void)testUrlNilObject
{
    //given
    id<ERNUrlMimeFactory> factory = [ERNStringUrlMimeFactory create];

    //when
    NSURL *url = [factory urlForObject:nil];

    //then
    assertThat(url, notNilValue());
}

-(void)testMimeObject
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNUrlMimeFactory> factory = [ERNStringUrlMimeFactory create];

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
    id<ERNUrlMimeFactory> factory = [ERNStringUrlMimeFactory create];

    //when
    NSURL *url = [factory urlForObject:mockObject];

    //then
    assertThat(url, notNilValue());
    [mockObject verify];
}

-(void)testMimeStringObject
{
    //given
    id<ERNUrlMimeFactory> factory = [ERNStringUrlMimeFactory create];

    //when
    NSString *mime = [factory mimeForObject:@"string"];

    //then
    assertThat(mime, notNilValue());
}

-(void)testUrlStringObject
{
    //given
    id<ERNUrlMimeFactory> factory = [ERNStringUrlMimeFactory create];

    //when
    NSURL *url = [factory urlForObject:@"string"];

    //then
    assertThat(url, notNilValue());
}

@end
