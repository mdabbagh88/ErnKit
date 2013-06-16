#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNNumberResourceFactoryTest.h"
#import "ERNNumberResourceFactory.h"
#import "ERNResource.h"

@implementation ERNNumberResourceFactoryTest

-(void)testMime
{
    //given, when
    NSString *mime = [ERNNumberResourceFactory mime];
    
    //then
    assertThat(mime, notNilValue());
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

-(void)testResourceNilObject
{
    //given
    id<ERNResourceFactory> factory = [ERNNumberResourceFactory create];
    
    //when
    ERNResource *resource = [factory resourceForObject:nil];
    
    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
}

-(void)testResourceObject
{
    //given
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    id<ERNResourceFactory> factory = [ERNNumberResourceFactory create];
    
    //when
    ERNResource *resource = [factory resourceForObject:mockObject];
    
    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
    [mockObject verify];
}

@end
