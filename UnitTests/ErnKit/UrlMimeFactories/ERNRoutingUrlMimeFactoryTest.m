#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNRoutingUrlMimeFactoryTest.h"
#import "ERNRoutingResourceFactory.h"
#import "ERNResource.h"

@implementation ERNRoutingUrlMimeFactoryTest

-(void)testResourceNilObjectNilMappings
{
    //given
    id<ERNResourceFactory> factory = [ERNRoutingResourceFactory createWithMappings:nil];

    //when
    ERNResource *resource = [factory resourceForObject:nil];

    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
}

-(void)testResourecObjectNilMappings
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNResourceFactory> factory = [ERNRoutingResourceFactory createWithMappings:nil];

    //when
    ERNResource *resource = [factory resourceForObject:mockObject];

    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
    [mockObject verify];
}

-(void)testResourceNilObjectMappings
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id mockFactory = [OCMockObject mockForProtocol:@protocol(ERNResourceFactory)];
    NSDictionary *mappings = @{NSStringFromClass([mockObject class]) : mockFactory};
    id<ERNResourceFactory> factory = [ERNRoutingResourceFactory createWithMappings:mappings];

    //when
    ERNResource *resource = [factory resourceForObject:nil];

    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
    [mockObject verify];
    [mockFactory verify];
}

-(void)testResourceObjectMappings
{
    //given
    NSURL *expectedUrl = [NSURL URLWithString:@"expectedURL"];
    NSString *expectedMime = @"expectedMime";
    ERNResource *expectedResource = [ERNResource createWithUrl:expectedUrl
                                                          mime:expectedMime];
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id mockFactory = [OCMockObject mockForProtocol:@protocol(ERNResourceFactory)];
    [[[mockFactory expect] andReturn:expectedResource] resourceForObject:mockObject];
    NSDictionary *mappings = @{NSStringFromClass([mockObject class]) : mockFactory};
    id<ERNResourceFactory> factory = [ERNRoutingResourceFactory createWithMappings:mappings];

    //when
    ERNResource *resource = [factory resourceForObject:mockObject];

    //then
    assertThat(resource, equalTo(expectedResource));
    [mockObject verify];
    [mockFactory verify];
}

-(void)testResourceObjectNotInMappings
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    id mockFactory = [OCMockObject mockForProtocol:@protocol(ERNResourceFactory)];
    NSDictionary *mappings = @{@"classname" : mockFactory};
    id<ERNResourceFactory> factory = [ERNRoutingResourceFactory createWithMappings:mappings];

    //when
    ERNResource *resource = [factory resourceForObject:mockObject];

    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
    [mockObject verify];
    [mockFactory verify];
}

-(void)testResourceObjectNonFactoryMappings
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    NSDictionary *mappings = @{NSStringFromClass([mockObject class]) : @""};
    id<ERNResourceFactory> factory = [ERNRoutingResourceFactory createWithMappings:mappings];

    //when
    ERNResource *resource = [factory resourceForObject:mockObject];

    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
    [mockObject verify];
}

@end
