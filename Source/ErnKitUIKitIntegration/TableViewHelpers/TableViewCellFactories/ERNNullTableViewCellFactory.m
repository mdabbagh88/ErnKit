#import "ERNNullTableViewCellFactory.h"
#import "ERNNullTableViewCell.h"
#import "ERNErrorHandler.h"

@implementation ERNNullTableViewCellFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
}

#pragma mark - ERNTableViewCellFactory

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

@end
