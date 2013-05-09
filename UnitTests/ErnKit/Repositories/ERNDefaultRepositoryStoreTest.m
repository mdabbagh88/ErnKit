#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNDefaultRepositoryStoreTest.h"
#import "ERNDefaultRepositoryStore.h"
#import "ERNAsyncItemRepository.h"

@interface ERNDefaultRepositoryStore ()
-(NSMapTable *)repositories;
@end

@implementation ERNDefaultRepositoryStoreTest

-(void)testStoreNilUrlNilItem
{
    //given
    ERNDefaultRepositoryStore *store = [ERNDefaultRepositoryStore create];

    //when
    [store storeUrl:nil
            forItem:nil];
    assertThatUnsignedInteger([[store repositories] count], equalToUnsignedInteger(0));
}

-(void)testStoreUrlNilItem
{
    //given
    ERNDefaultRepositoryStore *store = [ERNDefaultRepositoryStore create];

    //when
    [store storeUrl:[NSURL URLWithString:@"url"]
            forItem:nil];

    //then
    assertThatUnsignedInteger([[store repositories] count], equalToUnsignedInteger(0));
}

-(void)testStoreNilUrlItem
{
    //given
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    ERNDefaultRepositoryStore *store = [ERNDefaultRepositoryStore create];

    //when
    [store storeUrl:nil
            forItem:mockItem];

    //then
    assertThatUnsignedInteger([[store repositories] count], equalToUnsignedInteger(0));
}

-(void)testStoreUrlItem
{
    //given
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    ERNDefaultRepositoryStore *store = [ERNDefaultRepositoryStore create];

    //when
    [store storeUrl:[NSURL URLWithString:@"url"]
            forItem:mockItem];

    //then
    assertThatUnsignedInteger([[store repositories] count], equalToUnsignedInteger(1));
    assertThat([[[store repositories] objectForKey:[NSURL URLWithString:@"url"]] item], equalTo(mockItem));
}

-(void)testRepositoryForNilUrl
{
    //given
    ERNDefaultRepositoryStore *store = [ERNDefaultRepositoryStore create];

    //when
    id<ERNAsyncItemRepository> repository = [store repositoryForUrl:nil];

    //then
    assertThat([[repository item] class], equalTo([NSNull class]));
}

-(void)testRepositoryForUrlNoMatch
{
    //given
    ERNDefaultRepositoryStore *store = [ERNDefaultRepositoryStore create];

    //when
    id<ERNAsyncItemRepository> repository = [store repositoryForUrl:[NSURL URLWithString:@"url"]];

    //then
    assertThat([[repository item] class], equalTo([NSNull class]));
}

-(void)testRepositoryForUrlMatch
{
    //given
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    ERNDefaultRepositoryStore *store = [ERNDefaultRepositoryStore create];
    [store storeUrl:[NSURL URLWithString:@"url"]
            forItem:mockItem];

    //when
    id<ERNAsyncItemRepository> repository = [store repositoryForUrl:[NSURL URLWithString:@"url"]];

    //then
    assertThat([repository item], equalTo(mockItem));
}

@end
