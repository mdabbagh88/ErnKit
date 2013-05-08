#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNullUrlMimeFactoryTest.h"
#import "ERNNullUrlMimeFactory.h"

@implementation ERNNullUrlMimeFactoryTest

-(void)testSingleton
{
    //given, when
    id<ERNUrlMimeFactory> factory1 = [ERNNullUrlMimeFactory create];
    id<ERNUrlMimeFactory> factory2 = [ERNNullUrlMimeFactory create];

    //then
    assertThat(factory1, equalTo(factory2));
}

-(void)testMimeNilObject
{
    //given
    id<ERNUrlMimeFactory> factory = [ERNNullUrlMimeFactory create];

    //when
    NSString *mime = [factory mimeForObject:nil];

    //then
    assertThat(mime, notNilValue());
}

-(void)testUrlNilObject
{
    //given
    id<ERNUrlMimeFactory> factory = [ERNNullUrlMimeFactory create];

    //when
    NSURL *url = [factory urlForObject:nil];

    //then
    assertThat(url, notNilValue());
}

-(void)testMimeObject
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNUrlMimeFactory> factory = [ERNNullUrlMimeFactory create];

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
    id<ERNUrlMimeFactory> factory = [ERNNullUrlMimeFactory create];

    //when
    NSURL *url = [factory urlForObject:mockObject];

    //then
    assertThat(url, notNilValue());
    [mockObject verify];
}

@end
