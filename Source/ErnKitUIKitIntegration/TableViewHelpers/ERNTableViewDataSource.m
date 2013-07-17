#import "ERNTableViewDataSource.h"
#import "ERNTableViewManager.h"
#import "ERNErrorHandler.h"
#import "UITableViewCell+ERNHelper.h"
#import "ERNNullTableViewCell.h"
#import "ERNNullTableViewManager.h"

@interface ERNTableViewDataSource ()
@property (nonatomic, readonly) id<ERNTableViewManager> tableViewManager;
@end

@implementation ERNTableViewDataSource {
    id<ERNTableViewManager> _tableViewManager;
}

#pragma mark - public - constructors

+(instancetype)createWithTableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    return [[self alloc] initWithTableViewManager:tableViewManager];
}

#pragma mark - UITableViewDataSource

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ERNCheckNilAndReturn(tableView, [ERNNullTableViewCell create]);
    ERNCheckNilAndReturn(indexPath, [ERNNullTableViewCell create]);
    return [[self tableViewManager] cellForIndexPath:indexPath
                                          cellReuser:
            ^UITableViewCell *(NSString *identifier) {
                return [tableView dequeueReusableCellWithIdentifier:identifier];
            }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)__unused tableView
{
    return [[self tableViewManager] sections];
}

-(NSInteger)tableView:(UITableView *)__unused tableView
numberOfRowsInSection:(NSInteger)section
{
    return [[self tableViewManager] rowsInSection:section];
}

-(NSString *)tableView:(UITableView *)__unused tableView
titleForFooterInSection:(NSInteger)section
{
    return [self canHandleTitleForFooterInSection] ?
    [[self tableViewManager] titleForFooterInSection:section] :
    @"";
}

-(NSString *)tableView:(UITableView *)__unused tableView
titleForHeaderInSection:(NSInteger)section
{
    return [self canHandleTitleForHeaderInSection] ?
    [[self tableViewManager] titleForHeaderInSection:section] :
    @"";
}

#pragma mark - private

-(BOOL)canHandleTitleForFooterInSection
{
    return [[self tableViewManager] respondsToSelector:@selector(titleForFooterInSection:)];
}

-(BOOL)canHandleTitleForHeaderInSection
{
    return [[self tableViewManager] respondsToSelector:@selector(titleForHeaderInSection:)];
}

#pragma mark - private - accessors

-(id<ERNTableViewManager>)tableViewManager
{
    return _tableViewManager = _tableViewManager ? _tableViewManager :
    [ERNNullTableViewManager create];
}

#pragma mark - private - initializers

-(id)initWithTableViewManager:(id<ERNTableViewManager>)tableViewManager
{
    self = [super init];
    ERNCheckNil(self);
    _tableViewManager = tableViewManager;
    return self;
}

@end
