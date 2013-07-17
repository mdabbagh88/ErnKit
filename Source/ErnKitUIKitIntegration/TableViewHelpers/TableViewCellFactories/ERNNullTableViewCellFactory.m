#import "ERNNullTableViewCellFactory.h"
#import "ERNNullTableViewCell.h"

static ERNNullTableViewCellFactory *immutableSingleton;

@implementation ERNNullTableViewCellFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNNullTableViewCellFactory

-(UITableViewCell *)cellWithCellReuser:(UITableViewCell *(^)(NSString *identifier))__unused block
                            fromObject:(id<NSObject>)__unused object
{
    return [ERNNullTableViewCell create];
}

-(CGFloat)cellHeightForObject:(id<NSObject>)__unused object
                defaultHeight:(CGFloat)defaultHeight
{
    return defaultHeight;
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
