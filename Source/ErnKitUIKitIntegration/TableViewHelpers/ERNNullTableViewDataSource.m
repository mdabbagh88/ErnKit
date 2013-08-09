#import "ERNNullTableViewDataSource.h"
#import "ERNNullTableViewCell.h"

static ERNNullTableViewDataSource *immutableSingleton;

@implementation ERNNullTableViewDataSource {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return immutableSingleton;
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)__unused tableView
numberOfRowsInSection:(NSInteger)__unused section
{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)__unused tableView
        cellForRowAtIndexPath:(NSIndexPath *)__unused indexPath
{
    return [ERNNullTableViewCell create];
}

#pragma mark - NSObject

+(void)initialize
{
    immutableSingleton = [self new];
}

@end
