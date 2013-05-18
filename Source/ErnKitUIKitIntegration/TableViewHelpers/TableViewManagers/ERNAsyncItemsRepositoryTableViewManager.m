#import <UIKit/UIKit.h>
#import "ERNAsyncItemsRepositoryTableViewManager.h"
#import "ERNAsyncItemsRepository.h"
#import "ERNTableViewItemManager.h"
#import "ERNTableViewCellFactory.h"
#import "ERNErrorHandler.h"
#import "ERNNullTableViewCell.h"
#import "ERNNullTableViewItemManager.h"

@interface ERNAsyncItemsRepositoryTableViewManager ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository>repository;
@property (nonatomic, readonly) id<ERNTableViewItemManager>itemManager;
@end

@implementation ERNAsyncItemsRepositoryTableViewManager {
    id<ERNTableViewCellFactory> _cellFactory;
    id<ERNTableViewItemManager> _itemManager;
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                        itemManager:(id<ERNTableViewItemManager>)itemManager
{
    return [[self alloc] initWithRepository:repository
                                itemManager:itemManager];
}

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initWithRepository:repository
                                itemManager:nil];
}

#pragma mark - ERNTableViewManager

-(void)actionForIndexPath:(NSIndexPath *)indexPath
{
    ERNCheckNilNoReturn(indexPath);
    [[self itemManager] actionForObject:
     [[self repository] itemAtIndex:(NSUInteger)[indexPath row]]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
             cellForIndexPath:(NSIndexPath *)indexPath
{
    ERNCheckNilAndReturn(tableView, [ERNNullTableViewCell create]);
    ERNCheckNilAndReturn(indexPath, [ERNNullTableViewCell create]);
    return [[self itemManager] cellForTableView:tableView
                                     fromObject:[[self repository] itemAtIndex:
                                                 (NSUInteger)[indexPath row]]];
}

-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
                    defaultHeight:(CGFloat)defaultHeight
{
    ERNCheckNilAndReturn(indexPath, defaultHeight);
    return [[self itemManager] cellHeightForObject:[[self repository] itemAtIndex:
                                                    (NSUInteger)[indexPath row]]
                                     defaultHeight:defaultHeight];
}

-(NSInteger)sections
{
    return [self repository] ? 1 : 0;
}

-(NSInteger)rowsInSection:(NSInteger)section
{
    return (NSInteger)[[self repository] count];
}

#pragma mark - private - accessors

-(id<ERNTableViewItemManager>)itemManager
{
    return _itemManager = _itemManager ? _itemManager :
    [ERNNullTableViewItemManager create];
}

#pragma mark - private - initializers

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
            itemManager:(id<ERNTableViewItemManager>)itemManager
{
    self = [self init];
    ERNCheckNil(self);
    _repository = repository;
    _itemManager = itemManager;
    return self;
}

@end
