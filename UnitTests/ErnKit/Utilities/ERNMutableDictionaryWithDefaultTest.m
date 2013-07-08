#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNMutableDictionaryWithDefaultTest.h"
#import "ERNMutableDictionaryWithDefault.h"

@implementation ERNMutableDictionaryWithDefaultTest {
}

#pragma mark - class tests

-(void)testCreateWithDefault
{
    NSString *defaultObject = @"defaultObject";
    NSMutableDictionary *dictionary =
    [ERNMutableDictionaryWithDefault createWithDefault:defaultObject];

    assertThat(dictionary, notNilValue());
}

-(void)testCreateWithNilDefault
{
    NSMutableDictionary *dictionary = [ERNMutableDictionaryWithDefault createWithDefault:nil];

    assertThat(dictionary, notNilValue());
}

-(void)testGetKeyWithoutObjectWithDefault
{
    NSString *defaultObject = @"defaultObject";
    NSMutableDictionary *dictionary =
    [ERNMutableDictionaryWithDefault createWithDefault:defaultObject];

    id object = [dictionary objectForKey:@"keyWithoutObject"];

    assertThat(object, equalTo(defaultObject));
}

-(void)testGetKeyWithObjectWithDefault
{
    NSString *defaultObject = @"defaultObject";
    NSMutableDictionary *dictionary =
    [ERNMutableDictionaryWithDefault createWithDefault:defaultObject];
    NSString *keyWithObject = @"keyWithObject";
    NSString *expectedObject = @"expectedObject";
    [dictionary setObject:expectedObject forKey:keyWithObject];

    id object = [dictionary objectForKey:keyWithObject];

    assertThat(object, equalTo(expectedObject));
}


-(void)testGetKeyWithoutObjectWithNilDefault
{
    NSString *defaultObject = nil;
    NSMutableDictionary *dictionary =
    [ERNMutableDictionaryWithDefault createWithDefault:defaultObject];

    id object = [dictionary objectForKey:@"keyWithoutObject"];

    assertThat(object, equalTo(defaultObject));
}

-(void)testGetKeyWithObjectWithNilDefault
{
    NSString *defaultObject = nil;
    NSMutableDictionary *dictionary =
    [ERNMutableDictionaryWithDefault createWithDefault:defaultObject];
    NSString *keyWithObject = @"keyWithObject";
    NSString *expectedObject = @"expectedObject";
    [dictionary setObject:expectedObject forKey:keyWithObject];

    id object = [dictionary objectForKey:keyWithObject];

    assertThat(object, equalTo(expectedObject));
}

-(void)testCount
{
    NSString *defaultObject = @"defaultObject";
    NSUInteger expectedCount = 2;
    NSMutableDictionary *dictionary =
    [ERNMutableDictionaryWithDefault createWithDefault:defaultObject];
    [dictionary setObject:@"object" forKey:@"key1"];
    [dictionary setObject:@"object" forKey:@"key2"];

    NSUInteger count = [dictionary count];

    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedCount));
}

-(void)testRemoveKeyWithObjectWithDefault
{
    NSString *defaultObject = @"defaultObject";
    NSMutableDictionary *dictionary =
    [ERNMutableDictionaryWithDefault createWithDefault:defaultObject];
    NSString *keyWithObject = @"keyWithObject";
    NSString *expectedObject = @"expectedObject";
    [dictionary setObject:expectedObject forKey:keyWithObject];
    [dictionary removeObjectForKey:keyWithObject];

    id object = [dictionary objectForKey:keyWithObject];

    assertThat(object, equalTo(defaultObject));
}

-(void)testEnumeration
{
    NSString *defaultObject = @"defaultObject";
    NSUInteger expectedCount = 2;
    NSMutableDictionary *dictionary =
    [ERNMutableDictionaryWithDefault createWithDefault:defaultObject];
    [dictionary setObject:@"object" forKey:@"key1"];
    [dictionary setObject:@"object" forKey:@"key2"];

    NSUInteger count = 0;
    for (NSString *object in dictionary) {
        ++count;
    }

    assertThatUnsignedInteger(count, equalToUnsignedInteger(expectedCount));
}

@end
