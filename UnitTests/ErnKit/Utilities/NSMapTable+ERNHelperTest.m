#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "NSMapTable+ERNHelperTest.h"
#import "NSMapTable+ERNHelper.h"

@implementation NSMapTable_ERNHelperTest {
}

#pragma mark - class tests

-(void)testHasObjectForKey
{
    //given
    BOOL expectedHasObject = YES;
    NSString *key = @"key";
    NSMapTable *mapTable = [NSMapTable strongToStrongObjectsMapTable];
    [mapTable setObject:@"object" forKey:key];

    //when
    BOOL hasObject = [mapTable ERN_hasObjectForKey:key];

    assertThatBool(hasObject, equalToBool(expectedHasObject));
}

-(void)testHasNoObjectForKey
{
    //given
    BOOL expectedHasObject = NO;
    NSString *key = @"key";
    NSString *keyWithoutObject = @"keyWithoutObject";
    NSMapTable *mapTable = [NSMapTable strongToStrongObjectsMapTable];
    [mapTable setObject:@"object" forKey:key];

    //when
    BOOL hasObject = [mapTable ERN_hasObjectForKey:keyWithoutObject];

    assertThatBool(hasObject, equalToBool(expectedHasObject));
}

@end
