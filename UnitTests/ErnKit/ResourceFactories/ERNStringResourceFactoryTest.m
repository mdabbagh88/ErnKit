#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNStringResourceFactoryTest.h"
#import "ERNStringResourceFactory.h"
#import "ERNNullResource.h"
#import "ERNResourceFactoryTest.h"

@implementation ERNStringResourceFactoryTest {
}

#pragma mark - ERNResourceFactory protocol tests

-(void)testResourceFactoryProtocol
{
    [ERNResourceFactoryTest testResourceFactory:[ERNStringResourceFactory create]];
}

#pragma mark - class tests

-(void)testMime
{
    assertThat([ERNStringResourceFactory mime], notNilValue());
}

-(void)testScheme
{
    assertThat([ERNStringResourceFactory scheme], notNilValue());
}

-(void)testSingleton
{
    //given, when
    id<ERNResourceFactory> factory1 = [ERNStringResourceFactory create];
    id<ERNResourceFactory> factory2 = [ERNStringResourceFactory create];
    
    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
}

-(void)testResourceForNonString
{
    id<ERNResourceFactory> factory = [ERNStringResourceFactory create];

    ERNResource *resource = [factory resourceForObject:@[]];

    assertThat(resource, instanceOf([ERNNullResource class]));
}

-(void)testResourceForString
{
    id<ERNResourceFactory> factory = [ERNStringResourceFactory create];

    ERNResource *resource = [factory resourceForObject:@"someString"];

    assertThat([[resource url] scheme], equalTo([ERNStringResourceFactory scheme]));
    assertThat([resource mime], equalTo([ERNStringResourceFactory mime]));
}

@end
