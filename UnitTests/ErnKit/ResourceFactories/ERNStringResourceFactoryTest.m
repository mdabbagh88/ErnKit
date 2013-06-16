#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNStringResourceFactoryTest.h"
#import "ERNStringResourceFactory.h"
#import "ERNResource.h"

@implementation ERNStringResourceFactoryTest

-(void)testMime
{
    //given, when
    NSString *mime = [ERNStringResourceFactory mime];
    
    //then
    assertThat(mime, notNilValue());
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

-(void)testResourceNilObject
{
    //given
    id<ERNResourceFactory> factory = [ERNStringResourceFactory create];
    
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
    id<ERNResourceFactory> factory = [ERNStringResourceFactory create];
    
    //when
    ERNResource *resource = [factory resourceForObject:mockObject];
    
    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
    [mockObject verify];
}

-(void)testResourceStringObject
{
    //given
    id<ERNResourceFactory> factory = [ERNStringResourceFactory create];
    
    //when
    ERNResource *resource = [factory resourceForObject:@"string"];
    
    //then
    assertThat([resource mime], notNilValue());
    assertThat([resource url], notNilValue());
}

@end
