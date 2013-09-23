#import "ERNNullTableViewDataSource.h"
#import "ERNNullTableViewCell.h"
#import "ERNErrorHandler.h"

@implementation ERNNullTableViewDataSource {
}

#pragma mark - public - constructors

+(instancetype)create
{
    return ERNLazyLoadSingleton();
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

@end
