#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNURLResourceFactoryTest.h"
#import "ERNURLResourceFactory.h"
#import "ERNResource.h"
#import "ERNResourceFactoryTest.h"

@implementation ERNURLResourceFactoryTest {
}

#pragma mark - ERNResourceFactory protocol tests

-(void)testResourceFactoryProtocol
{
    [ERNResourceFactoryTest testResourceFactory:[ERNURLResourceFactory create]];
}

#pragma mark - class tests

-(void)testMime
{
    assertThat([ERNURLResourceFactory mime], notNilValue());
}

-(void)testSingleton
{
    //given, when
    id<ERNResourceFactory> factory1 = [ERNURLResourceFactory create];
    id<ERNResourceFactory> factory2 = [ERNURLResourceFactory create];

    //then
    assertThat(factory1, notNilValue());
    assertThat(factory1, equalTo(factory2));
}

-(void)testResourceForUrl
{
    id<ERNResourceFactory> factory = [ERNURLResourceFactory create];
    NSURL *url = [NSURL URLWithString:@"url"];

    ERNResource *resource = [factory resourceForObject:url];

    assertThat([resource url], equalTo(url));
    assertThat([resource mime], equalTo([ERNURLResourceFactory mime]));
}

-(void)testResourceForNonUrl
{
    id<ERNResourceFactory> factory = [ERNURLResourceFactory create];

    ERNResource *resource = [factory resourceForObject:@[]];

    assertThat(resource, equalTo([ERNResource createNull]));
}

@end
