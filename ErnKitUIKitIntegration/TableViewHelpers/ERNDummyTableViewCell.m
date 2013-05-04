#import "ERNDummyTableViewCell.h"
#import "ERNErrorHandler.h"

@implementation ERNDummyTableViewCell {
}

#pragma mark - public - constructors

+(instancetype)dummyCell
{
    return [[self alloc] init];
}

#pragma mark - NSObject

-(id)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:NSStringFromClass([self class])];
    ERNCheckNil(self);
    [[self textLabel] setText:@"Dummy cell"];
    return self;
}

@end
