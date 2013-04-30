#import "ERNDummyTableViewCell.h"
#import "NSObject+ERNHelper.h"

@implementation ERNDummyTableViewCell

-(id)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:NSStringFromClass([self class])];
    ERNCheckNil(self);
    [[self textLabel] setText:@"Dummy cell"];
    return self;
}

+(instancetype)dummyCell
{
    return [[self alloc] init];
}
@end
