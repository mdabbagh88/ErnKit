#import "ERNNullTableViewManager.h"
#import "ERNNullTableViewCell.h"

static ERNNullTableViewManager *immutableSingleton;

@implementation ERNNullTableViewManager {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - ERNTableViewManager

-(UITableViewCell *)cellForIndexPath:(NSIndexPath *)indexPath
                          cellReuser:(UITableViewCell *(^)(NSString *identifier))block
{
    return [ERNNullTableViewCell create];
}

-(NSInteger)sections
{
    return 0;
}

-(NSInteger)rowsInSection:(NSInteger)section
{
    return 0;
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
