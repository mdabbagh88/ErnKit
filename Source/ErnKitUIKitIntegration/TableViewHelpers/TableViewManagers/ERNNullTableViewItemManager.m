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

-(void)actionForObject:(id<NSObject>)__unused object
{
}

-(CGFloat)cellHeightForObject:(id<NSObject>)__unused object
                defaultHeight:(CGFloat)__unused defaultHeight
{
    return defaultHeight;
}

-(UITableViewCell *)cellWithCellReuser:(UITableViewCell *(^)(__unused NSString *identifier))__unused block
                            fromObject:(id<NSObject>)__unused object
{
    return [ERNNullTableViewCell create];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
