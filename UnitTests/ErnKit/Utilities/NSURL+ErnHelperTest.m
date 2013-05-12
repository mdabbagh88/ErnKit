#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "NSURL+ErnHelperTest.h"
#import "NSURL+ErnHelper.h"

@implementation NSURL_ErnHelperTest

-(void)testSingleton
{
    //given, when
    NSURL *url1 = [NSURL ERN_createNull];
    NSURL *url2 = [NSURL ERN_createNull];

    //then
    assertThat(url1, notNilValue());
    assertThat(url1, equalTo(url2));
}

@end
