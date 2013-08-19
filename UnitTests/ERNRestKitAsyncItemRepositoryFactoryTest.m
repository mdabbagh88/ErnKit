#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <RestKit/RestKit.h>
#import "ERNRestKitAsyncItemRepositoryFactoryTest.h"
#import "ERNRestKitAsyncItemRepositoryFactory.h"
#import "ERNRepositoryFactoryTest.h"

@implementation ERNRestKitAsyncItemRepositoryFactoryTest {
}

#pragma mark - ERNRepositoryFactory protocol tests

-(void)testRepositoryFactoryProtocolNilResponseDescriptor
{
    [ERNRepositoryFactoryTest testRepositoryFactory:
     [ERNRestKitAsyncItemRepositoryFactory createWithResponseDescriptor:nil]];
}

-(void)testRepositoryFactoryProtocolResponseDescriptor
{
    id mockResponseDescriptor = [OCMockObject mockForClass:[RKResponseDescriptor class]];
    [ERNRepositoryFactoryTest testRepositoryFactory:
     [ERNRestKitAsyncItemRepositoryFactory createWithResponseDescriptor:mockResponseDescriptor]];
}

@end
