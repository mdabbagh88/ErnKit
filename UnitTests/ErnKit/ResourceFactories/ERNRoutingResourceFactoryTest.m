#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNRoutingResourceFactoryTest.h"
#import "ERNRoutingResourceFactory.h"
#import "ERNResource.h"
#import "ERNResourceFactoryTest.h"

@implementation ERNRoutingResourceFactoryTest {
}

#pragma mark - ERNResourceFactory protocol tests

-(void)testResourceFactoryProtocolNilMappings
{
    [ERNResourceFactoryTest testResourceFactory:
     [ERNRoutingResourceFactory createWithMappings:nil]];
}

-(void)testResourceFactoryProtocolMappings
{

    id mockFactory = [OCMockObject niceMockForProtocol:@protocol(ERNResourceFactory)];
    NSDictionary *mappings = @{NSStringFromClass([NSObject class]) : mockFactory};

    [ERNResourceFactoryTest testResourceFactory:
     [ERNRoutingResourceFactory createWithMappings:mappings]];
}


-(void)testResourceFactoryProtocolNonMappings
{
    id mockObject = [OCMockObject mockForClass:[NSArray class]];
    NSDictionary *mappings = @{NSStringFromClass([mockObject class]) : @""};
    [ERNResourceFactoryTest testResourceFactory:
     [ERNRoutingResourceFactory createWithMappings:mappings]];
}

#pragma mark - class tests

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
    assertThat(resource, notNilValue());
    [mockObject verify];
    [mockFactory verify];
}

@end
