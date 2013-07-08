#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "NSURL+ErnHelperTest.h"
#import "NSURL+ErnHelper.h"

@implementation NSURL_ErnHelperTest {
}

#pragma mark - class tests

-(void)testNullSingleton
{
    //given, when
    NSURL *url1 = [NSURL ERN_createNull];
    NSURL *url2 = [NSURL ERN_createNull];

    //then
    assertThat(url1, notNilValue());
    assertThat(url1, equalTo(url2));
}

-(void)testHasValueWithoutValue
{
    //given
    NSURL *url = [NSURL ERN_createNull];

    //when
    BOOL urlHasValue = [url ERN_hasValue];

    //then
    assertThatBool(urlHasValue, equalToBool(NO));
}

-(void)testHasValueWithValue
{
    //given
    NSURL *url = [NSURL URLWithString:@"url"];

    //when
    BOOL urlHasValue = [url ERN_hasValue];
    
    //then
    assertThatBool(urlHasValue, equalToBool(YES));
}

@end
