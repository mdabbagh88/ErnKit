#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNDefaultRepositoryManagerTest.h"
#import "ERNDefaultRepositoryManager.h"
#import "ERNAsyncItemRepository.h"
#import "ERNRepositoryManagerTest.h"

@interface ERNDefaultRepositoryManager ()
-(NSMapTable *)objects;
@end

@implementation ERNDefaultRepositoryManagerTest {
}

#pragma mark - ERNRepositoryManager protocol tests

-(void)testRepositoryManagerProtocol
{
    [ERNRepositoryManagerTest testRepositoryManager:[ERNDefaultRepositoryManager create]];
}

#pragma mark - class tests

-(void)testStoreNilUrlNilItem
{
    //given
    ERNDefaultRepositoryManager *store = [ERNDefaultRepositoryManager create];

    //when
    [store storeUrl:nil
            forItem:nil];
    assertThatUnsignedInteger([[store objects] count], equalToUnsignedInteger(0));
}

-(void)testStoreUrlNilItem
{
    //given
    ERNDefaultRepositoryManager *store = [ERNDefaultRepositoryManager create];

    //when
    [store storeUrl:[NSURL URLWithString:@"url"]
            forItem:nil];

    //then
    assertThatUnsignedInteger([[store objects] count], equalToUnsignedInteger(0));
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
    assertThatUnsignedInteger([[store objects] count], equalToUnsignedInteger(0));
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
    assertThatUnsignedInteger([[store objects] count], equalToUnsignedInteger(1));
    assertThat([[store objects] objectForKey:[NSURL URLWithString:@"url"]], equalTo(mockItem));
}

@end
