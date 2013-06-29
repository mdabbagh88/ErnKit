#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNResourceFactoryTest.h"
#import "ERNResourceFactory.h"
#import "ERNResource.h"

@interface ERNResourceFactoryTestFactorylessObject : NSObject
@end

@implementation ERNResourceFactoryTestFactorylessObject
@end

@implementation ERNResourceFactoryTest {
}

#pragma mark - ERNResourceFactory protocol tests

+(void)testResourceFactory:(id<ERNResourceFactory>)resourceFactory
{
    [self testResourceForNilObject:resourceFactory];
    [self testResourceForObject:resourceFactory];
    [self testResourceForFactorylessObject:resourceFactory];
}

+(void)testResourceForNilObject:(id<ERNResourceFactory>)resourceFactory
{
    ERNResource *resource = [resourceFactory resourceForObject:nil];
    assertThat(resource, notNilValue());
}

+(void)testResourceForObject:(id<ERNResourceFactory>)resourceFactory
{
    id mockObject = [OCMockObject mockForClass:[NSObject class]];
    ERNResource *resource = [resourceFactory resourceForObject:mockObject];
    assertThat(resource, notNilValue());
}

+(void)testResourceForFactorylessObject:(id<ERNResourceFactory>)resourceFactory
{
    ERNResource *expectedResource = [ERNResource createNull];
    ERNResource *resource = [resourceFactory resourceForObject:
                             [ERNResourceFactoryTestFactorylessObject new]];
    assertThat(resource, equalTo(expectedResource));
}

@end
