#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNumberResourceFactoryTest.h"
#import "ERNNumberResourceFactory.h"
#import "ERNResource.h"
#import "ERNResourceFactoryTest.h"

@implementation ERNNumberResourceFactoryTest {
}

#pragma mark - ERNResourceFactory protocol tests

-(void)testResourceFactoryProtocol
{
    [ERNResourceFactoryTest testResourceFactory:[ERNNumberResourceFactory create]];
}

#pragma mark - class tests

-(void)testMime
{
    assertThat([ERNNumberResourceFactory mime], notNilValue());
}

-(void)testScheme
{
    assertThat([ERNNumberResourceFactory scheme], notNilValue());
}


-(void)testResourceForNonNumber
{
    id<ERNResourceFactory> factory = [ERNNumberResourceFactory create];

    ERNResource *resource = [factory resourceForObject:@[]];

    assertThat(resource, equalTo([ERNResource createNull]));
}

-(void)testResourceForNumber
{
    id<ERNResourceFactory> factory = [ERNNumberResourceFactory create];

    ERNResource *resource = [factory resourceForObject:@2];

    assertThat([[resource url] scheme], equalTo([ERNNumberResourceFactory scheme]));
    assertThat([resource mime], equalTo([ERNNumberResourceFactory mime]));
}

-(void)testSingleton
{
    //given, when
    id<ERNResourceFactory> factory1 = [ERNNumberResourceFactory create];
    id<ERNResourceFactory> factory2 = [ERNNumberResourceFactory create];
    
    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
}

@end
