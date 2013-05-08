#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "ERNTableViewControllerTest.h"
#import "ERNTableViewController.h"

@implementation ERNTableViewControllerTest

-(void)testConstructor
{
    [ERNTableViewController createWithRepository:nil
                                             cellFactory:nil];
}

-(void)testActionHandlerConstructor
{
    [ERNTableViewController createWithRepository:nil
                                             cellFactory:nil
                                           actionHandler:nil];
}

@end
