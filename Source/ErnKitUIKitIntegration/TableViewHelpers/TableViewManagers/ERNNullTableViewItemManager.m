#import "ERNNullTableViewItemManager.h"
#import "ERNNullTableViewCell.h"

static ERNNullTableViewItemManager *immutableSingleton;

@implementation ERNNullTableViewItemManager {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNTableViewItemManager

-(void)actionForObject:(id<NSObject>)object
{
}

-(CGFloat)cellHeightForObject:(id<NSObject>)object
                defaultHeight:(CGFloat)defaultHeight
{
    return defaultHeight;
}

-(UITableViewCell *)cellWithCellReuser:(UITableViewCell *(^)(NSString *identifier))block
                            fromObject:(id<NSObject>)object
{
    return [ERNNullTableViewCell create];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
