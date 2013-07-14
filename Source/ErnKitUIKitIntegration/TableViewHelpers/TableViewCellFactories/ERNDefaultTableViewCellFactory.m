#import "ERNDefaultTableViewCellFactory.h"
#import "UITableViewCell+ERNHelper.h"
#import "ERNErrorHandler.h"
#import "ERNNullTableViewCell.h"

static ERNDefaultTableViewCellFactory *immutableSingleton;

@implementation ERNDefaultTableViewCellFactory {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNTableViewCellFactory

-(UITableViewCell *)cellWithCellReuser:(UITableViewCell *(^)(NSString *identifier))block
                            fromObject:(id<NSObject>)object
{
    ERNCheckNilAndReturn(object, [ERNNullTableViewCell create]);
    ERNCheckNilAndReturn(block, createTableViewCellFromObject(object));
    return createTableViewCellWithCellReuser(block, object);
}

-(CGFloat)cellHeightForObject:(id<NSObject>)object
                defaultHeight:(CGFloat)defaultHeight
{
    return defaultHeight;
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

#pragma mark - private

static UITableViewCell *createTableViewCellFromObject(id<NSObject>object)
{
    return setupCell([UITableViewCell createWithCellReuser:
                            ^UITableViewCell *(NSString *identifier) {
                                return nil;
                            }
                                                     style:UITableViewCellStyleDefault],
                    object);
}

static UITableViewCell *
createTableViewCellWithCellReuser(UITableViewCell *(^block)(NSString *identifier),
                                  id<NSObject>object)
{
    return setupCell([UITableViewCell createWithCellReuser:block
                                                           style:UITableViewCellStyleDefault],
                     object);
}

static UITableViewCell *setupCell(UITableViewCell *cell, id<NSObject>object)
{
    [[cell textLabel] setText:[object description]];
    return cell;
}

@end
