#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNTableViewControllerTest.h"
#import "ERNTableViewController.h"

@implementation ERNTableViewControllerTest

-(void)testConstructor
{
    [ERNTableViewController viewControllerWithRepository:nil
                                             cellFactory:nil];
}

-(void)testActionHandlerConstructor
{
    [ERNTableViewController viewControllerWithRepository:nil
                                             cellFactory:nil
                                           actionHandler:nil];
}

@end
