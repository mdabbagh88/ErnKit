#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNRoutingUrlMimeFactoryTest.h"
#import "ERNRoutingUrlMimeFactory.h"

@implementation ERNRoutingUrlMimeFactoryTest

-(void)testMimeNilObjectNilMappings
{
    //given
    id<ERNResourceFactory> factory = [ERNRoutingUrlMimeFactory createWithMappings:nil];

    //when
    NSString *mime = [factory mimeForObject:nil];

    //then
    assertThat(mime, notNilValue());
}

-(void)testUrlNilObjectNilMappings
{
    //given
    id<ERNResourceFactory> factory = [ERNRoutingUrlMimeFactory createWithMappings:nil];

    //when
    NSURL *url = [factory urlForObject:nil];

    //then
    assertThat(url, notNilValue());
}

-(void)testMimeObjectNilMappings
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNResourceFactory> factory = [ERNRoutingUrlMimeFactory createWithMappings:nil];

    //when
    NSString *mime = [factory mimeForObject:mockObject];

    //then
    assertThat(mime, notNilValue());
    [mockObject verify];
}

-(void)testUrlObjectNilMappings
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNResourceFactory> factory = [ERNRoutingUrlMimeFactory createWithMappings:nil];

    //when
    NSURL *url = [factory urlForObject:mockObject];

    //then
    assertThat(url, notNilValue());
    [mockObject verify];
}

-(void)testMimeNilObjectMappings
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id mockFactory = [OCMockObject mockForProtocol:@protocol(ERNResourceFactory)];
    NSDictionary *mappings = @{NSStringFromClass([mockObject class]) : mockFactory};
    id<ERNResourceFactory> factory = [ERNRoutingUrlMimeFactory createWithMappings:mappings];

    //when
    NSString *mime = [factory mimeForObject:nil];

    //then
    assertThat(mime, notNilValue());
    [mockObject verify];
    [mockFactory verify];
}

-(void)testUrlNilObjectMappings
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id mockFactory = [OCMockObject mockForProtocol:@protocol(ERNResourceFactory)];
    NSDictionary *mappings = @{NSStringFromClass([mockObject class]) : mockFactory};
    id<ERNResourceFactory> factory = [ERNRoutingUrlMimeFactory createWithMappings:mappings];

    //when
    NSURL *url = [factory urlForObject:nil];

    //then
    assertThat(url, notNilValue());
}

-(void)testMimeObjectMappings
{
    //given
    NSString *expectedMime = @"mime";
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id mockFactory = [OCMockObject mockForProtocol:@protocol(ERNResourceFactory)];
    [[[mockFactory expect] andReturn:expectedMime] mimeForObject:mockObject];
    NSDictionary *mappings = @{NSStringFromClass([mockObject class]) : mockFactory};
    id<ERNResourceFactory> factory = [ERNRoutingUrlMimeFactory createWithMappings:mappings];

    //when
    NSString *mime = [factory mimeForObject:mockObject];

    //then
    assertThat(mime, equalTo(expectedMime));
    [mockObject verify];
    [mockFactory verify];
}

-(void)testUrlObjectMappings
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"url"];
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id mockFactory = [OCMockObject mockForProtocol:@protocol(ERNResourceFactory)];
    [[[mockFactory expect] andReturn:expectedUrl] urlForObject:mockObject];
    NSDictionary *mappings = @{NSStringFromClass([mockObject class]) : mockFactory};
    id<ERNResourceFactory> factory = [ERNRoutingUrlMimeFactory createWithMappings:mappings];

    //when
    NSURL *url = [factory urlForObject:mockObject];

    //then
    assertThat(url, equalTo(expectedUrl));
    [mockObject verify];
    [mockFactory verify];
}

-(void)testUrlObjectNotInMappings
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id mockFactory = [OCMockObject mockForProtocol:@protocol(ERNResourceFactory)];
    NSDictionary *mappings = @{@"classname" : mockFactory};
    id<ERNResourceFactory> factory = [ERNRoutingUrlMimeFactory createWithMappings:mappings];

    //when
    NSURL *url = [factory urlForObject:mockObject];

    //then
    assertThat(url, notNilValue());
    [mockObject verify];
    [mockFactory verify];
}

-(void)testMimeObjectNotInMappings
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id mockFactory = [OCMockObject mockForProtocol:@protocol(ERNResourceFactory)];
    NSDictionary *mappings = @{@"classname" : mockFactory};
    id<ERNResourceFactory> factory = [ERNRoutingUrlMimeFactory createWithMappings:mappings];

    //when
    NSString *mime = [factory mimeForObject:mockObject];

    //then
    assertThat(mime, notNilValue());
    [mockObject verify];
    [mockFactory verify];
}

-(void)testUrlObjectNonFactoryMappings
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    NSDictionary *mappings = @{NSStringFromClass([mockObject class]) : @""};
    id<ERNResourceFactory> factory = [ERNRoutingUrlMimeFactory createWithMappings:mappings];

    //when
    NSURL *url = [factory urlForObject:mockObject];

    //then
    assertThat(url, notNilValue());
    [mockObject verify];
}

-(void)testMimeObjectNonFactoryMappings
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    NSDictionary *mappings = @{NSStringFromClass([mockObject class]) : @""};
    id<ERNResourceFactory> factory = [ERNRoutingUrlMimeFactory createWithMappings:mappings];

    //when
    NSString *mime = [factory mimeForObject:mockObject];

    //then
    assertThat(mime, notNilValue());
    [mockObject verify];
}

@end
