#import "ERNNullTableViewItemManager.h"
#import "ERNNullTableViewCell.h"
#import "ERNErrorHandler.h"

@implementation ERNNullTableViewItemManager {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
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

@end
