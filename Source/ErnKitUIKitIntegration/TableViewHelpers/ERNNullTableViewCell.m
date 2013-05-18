#import "ERNNullTableViewCell.h"
#import "ERNErrorHandler.h"

@implementation ERNNullTableViewCell {
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
    [[self textLabel] setText:[self reuseIdentifier]];
    return self;
}

@end
