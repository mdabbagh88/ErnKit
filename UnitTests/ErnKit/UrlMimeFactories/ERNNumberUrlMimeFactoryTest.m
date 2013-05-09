#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNumberUrlMimeFactoryTest.h"
#import "ERNNumberUrlMimeFactory.h"

@implementation ERNNumberUrlMimeFactoryTest

-(void)testMime
{
    //given, when
    NSString *mime = [ERNNumberUrlMimeFactory mime];

    //then
    assertThat(mime, notNilValue());
}

-(void)testSingleton
{
    //given, when
    id<ERNUrlMimeFactory> factory1 = [ERNNumberUrlMimeFactory create];
    id<ERNUrlMimeFactory> factory2 = [ERNNumberUrlMimeFactory create];

    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
}

-(void)testMimeNilObject
{
    //given
    id<ERNUrlMimeFactory> factory = [ERNNumberUrlMimeFactory create];

    //when
    NSString *mime = [factory mimeForObject:nil];

    //then
    assertThat(mime, notNilValue());
}

-(void)testUrlNilObject
{
    //given
    id<ERNUrlMimeFactory> factory = [ERNNumberUrlMimeFactory create];

    //when
    NSURL *url = [factory urlForObject:nil];

    //then
    assertThat(url, notNilValue());
}

-(void)testMimeObject
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNUrlMimeFactory> factory = [ERNNumberUrlMimeFactory create];

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
    id<ERNUrlMimeFactory> factory = [ERNNumberUrlMimeFactory create];

    //when
    NSURL *url = [factory urlForObject:mockObject];

    //then
    assertThat(url, notNilValue());
    [mockObject verify];
}

@end
