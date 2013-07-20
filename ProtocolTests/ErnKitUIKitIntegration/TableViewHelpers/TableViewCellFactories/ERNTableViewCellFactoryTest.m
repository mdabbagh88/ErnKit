#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import <UIKit/UIKit.h>
#import "ERNTableViewCellFactoryTest.h"

@implementation ERNTableViewCellFactoryTest {
}

#pragma mark - ERNTableViewCellFactory protocol tests

+(void)testTableViewCellFactory:(id<ERNTableViewCellFactory>)tableViewCellFactory
{
    [self testCellWithNilCellReuserFromNilObject:tableViewCellFactory];
    [self testCellWithCellReuserFromNilObject:tableViewCellFactory];
    [self testCellWithNilCellReuserFromObject:tableViewCellFactory];
    [self testCellWithCellReuserFromObject:tableViewCellFactory];
    [self testCellHeightForNilObject:tableViewCellFactory];
    [self testCellHeightForObject:tableViewCellFactory];
}

+(void)testCellWithNilCellReuserFromNilObject:(id<ERNTableViewCellFactory>)tableViewCellFactory
{
    assertThat([tableViewCellFactory cellWithCellReuser:nil
                                             fromObject:nil],
               instanceOf([UITableViewCell class]));
}

+(void)testCellWithCellReuserFromNilObject:(id<ERNTableViewCellFactory>)tableViewCellFactory
{
    assertThat([tableViewCellFactory cellWithCellReuser:
     ^UITableViewCell *(NSString *identifier) {
        return nil;
    }
                                  fromObject:nil], instanceOf([UITableViewCell class]));
}

+(void)testCellWithCellReuserFromObject:(id<ERNTableViewCellFactory>)tableViewCellFactory
{
    id mockObject = [OCMockObject niceMockForClass:[NSObject class]];
    assertThat([tableViewCellFactory cellWithCellReuser:
                ^UITableViewCell *(NSString *identifier) {
                    return nil;
                }
                                             fromObject:mockObject],
               instanceOf([UITableViewCell class]));
}

+(void)testCellWithNilCellReuserFromObject:(id<ERNTableViewCellFactory>)tableViewCellFactory
{
    id mockObject = [OCMockObject niceMockForClass:[NSObject class]];
    assertThat([tableViewCellFactory cellWithCellReuser:nil
                                             fromObject:mockObject],
               instanceOf([UITableViewCell class]));
}

+(void)testCellHeightForNilObject:(id<ERNTableViewCellFactory>)tableViewCellFactory
{
    [tableViewCellFactory cellHeightForObject:nil
                                defaultHeight:0];
}

+(void)testCellHeightForObject:(id<ERNTableViewCellFactory>)tableViewCellFactory
{
    id mockObject = [OCMockObject niceMockForClass:[NSObject class]];
    [tableViewCellFactory cellHeightForObject:mockObject
                                defaultHeight:0];
}

@end
