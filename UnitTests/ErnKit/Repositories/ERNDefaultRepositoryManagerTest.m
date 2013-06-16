#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNDefaultRepositoryManagerTest.h"
#import "ERNDefaultRepositoryManager.h"
#import "ERNAsyncItemRepository.h"

@interface ERNDefaultRepositoryManager ()
-(NSMapTable *)repositories;
@end

@implementation ERNDefaultRepositoryManagerTest

-(void)testStoreNilUrlNilItem
{
    //given
    ERNDefaultRepositoryManager *store = [ERNDefaultRepositoryManager create];

    //when
    [store storeUrl:nil
            forItem:nil];
    assertThatUnsignedInteger([[store repositories] count], equalToUnsignedInteger(0));
}

-(void)testStoreUrlNilItem
{
    //given
    ERNDefaultRepositoryManager *store = [ERNDefaultRepositoryManager create];

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
    ERNDefaultRepositoryManager *store = [ERNDefaultRepositoryManager create];

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
    ERNDefaultRepositoryManager *store = [ERNDefaultRepositoryManager create];

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
    ERNDefaultRepositoryManager *store = [ERNDefaultRepositoryManager create];

    //when
    id<ERNAsyncRepository> repository = [store repositoryForUrl:nil
                                                           mime:nil];

    //then
    assertThat(repository, notNilValue());
}

-(void)testRepositoryForUrlNoMatch
{
    //given
    ERNDefaultRepositoryManager *store = [ERNDefaultRepositoryManager create];

    //when
    id<ERNAsyncRepository> repository = [store repositoryForUrl:[NSURL URLWithString:@"url"]
                                                               mime:nil];

    //then
    assertThat(repository, notNilValue());
}

-(void)testRepositoryForUrlMatch
{
    //given
    id mockItem = [OCMockObject mockForClass:[NSObject class]];
    ERNDefaultRepositoryManager *store = [ERNDefaultRepositoryManager create];
    [store storeUrl:[NSURL URLWithString:@"url"]
            forItem:mockItem];

    //when
    id<ERNAsyncRepository> repository = [store repositoryForUrl:[NSURL URLWithString:@"url"]
                                                           mime:nil];

    //then
    assertThat(repository, notNilValue());
}

@end
