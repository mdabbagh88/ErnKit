#import "ERNDummyTableViewCell.h"
#import "ERNErrorHandler.h"

@implementation ERNDummyTableViewCell {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return [self new];
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
