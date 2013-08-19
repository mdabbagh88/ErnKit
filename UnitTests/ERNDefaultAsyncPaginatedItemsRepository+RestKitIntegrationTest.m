#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <RestKit/RestKit.h>
#import "ERNDefaultAsyncPaginatedItemsRepository+RestKitIntegrationTest.h"
#import "ERNDefaultAsyncPaginatedItemsRepository+RestKitIntegration.h"
#import "ERNNullResource.h"

@implementation ERNDefaultAsyncPaginatedItemsRepository_RestKitIntegrationTest {
}

#pragma mark - class tests

-(void)testConstructorNilResourceNilDescriptor
{
    assertThat([ERNDefaultAsyncPaginatedItemsRepository createWithResource:nil
                                                        responseDescriptor:nil
                                                                windowSize:0], notNilValue());
}

-(void)testConstructorResourceNilDescriptor
{
    assertThat([ERNDefaultAsyncPaginatedItemsRepository createWithResource:[ERNNullResource create]
                                                        responseDescriptor:nil
                                                                windowSize:0], notNilValue());
}

-(void)testConstructorNilResourceDescriptor
{
    id mockResponseDescriptor = [OCMockObject mockForClass:[RKResponseDescriptor class]];
    assertThat([ERNDefaultAsyncPaginatedItemsRepository createWithResource:nil
                                                        responseDescriptor:mockResponseDescriptor
                                                                windowSize:0], notNilValue());
}

-(void)testConstructorResourceDescriptor
{
    id mockResponseDescriptor = [OCMockObject mockForClass:[RKResponseDescriptor class]];
    assertThat([ERNDefaultAsyncPaginatedItemsRepository createWithResource:[ERNNullResource create]
                                                        responseDescriptor:mockResponseDescriptor
                                                                windowSize:0], notNilValue());
}

@end
