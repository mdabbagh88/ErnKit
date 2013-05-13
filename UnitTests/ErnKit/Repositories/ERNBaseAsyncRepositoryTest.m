#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNBaseAsyncRepositoryTest.h"
#import "ERNBaseAsyncRepository.h"

@interface ERNBaseAsyncRepository (ErnTestHelper)
-(void)testHelperChangeNotificationCenter:(NSNotificationCenter *)notificationCenter;
-(NSNotificationCenter *)notificationCenter;
@end

@implementation ERNBaseAsyncRepositoryTest

-(void)testNotificationCenter
{
    ERNBaseAsyncRepository *repository = [ERNBaseAsyncRepository new];
    NSNotificationCenter *notificationCenter = [repository notificationCenter];

    assertThat(notificationCenter, notNilValue());
}

-(void)testNotifyObservers
{
    //given
    ERNBaseAsyncRepository *repository = [ERNBaseAsyncRepository new];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY
                                                   object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository notifyObservers];

    //then
    [mockNotificationCenter verify];
}

-(void)testRefresh
{
    //given
    ERNBaseAsyncRepository *repository = [ERNBaseAsyncRepository new];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] postNotificationName:OCMOCK_ANY
                                                   object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository refresh];

    //then
    [mockNotificationCenter verify];
}

-(void)testAddObserver
{
    //given
    id mockObserver = [OCMockObject mockForClass:[NSObject class]];
    ERNBaseAsyncRepository *repository = [ERNBaseAsyncRepository new];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] addObserver:mockObserver
                                        selector:@selector(testAddObserver)
                                            name:OCMOCK_ANY object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository addObserver:mockObserver selector:@selector(testAddObserver)];

    //then
    [mockNotificationCenter verify];
}

-(void)testRemoveObserver
{
    //given
    id mockObserver = [OCMockObject mockForClass:[NSObject class]];
    ERNBaseAsyncRepository *repository = [ERNBaseAsyncRepository new];
    id mockNotificationCenter = [OCMockObject mockForClass:[NSNotificationCenter class]];
    [[mockNotificationCenter expect] removeObserver:mockObserver
                                               name:OCMOCK_ANY
                                             object:repository];
    [repository testHelperChangeNotificationCenter:mockNotificationCenter];

    //when
    [repository removeObserver:mockObserver];

    //then
    [mockNotificationCenter verify];
}

@end
