#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "NSObject+ERNHelperTest.h"
#import "NSObject+ERNHelper.h"

@implementation NSObject_ERNHelperTest {
}

#pragma mark - class tests

-(NSUInteger)count
{
    return 0;
}

-(void)testHasSelector
{
    //given
    NSArray *array = @[];

    //when
    NSArray *returnArray = [array ERN_guaranteeSelectorResponse:@selector(count)];

    //then
    assertThat(returnArray, equalTo(array));
}

-(void)testHasNotSelector
{
    //given
    NSArray *array = @[];

    //when
    NSArray *returnArray = [array ERN_guaranteeSelectorResponse:@selector(testHasNotSelector)];

    //then
    assertThat(returnArray, nilValue());
}

@end
