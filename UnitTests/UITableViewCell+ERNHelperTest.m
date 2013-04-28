#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "UITableViewCell+ERNHelperTest.h"
#import "UITableViewCell+ERNHelper.h"

@implementation UITableViewCell_ERNHelperTest

-(void)testConstructor
{
    [UITableViewCell cellForTableView:nil
                           identifier:nil
                                style:UITableViewCellStyleDefault];
}

@end
