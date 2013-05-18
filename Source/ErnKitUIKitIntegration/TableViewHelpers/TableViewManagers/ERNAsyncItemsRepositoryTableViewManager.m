#import <UIKit/UIKit.h>
#import "ERNAsyncItemsRepositoryTableViewManager.h"
#import "ERNAsyncItemsRepository.h"
#import "ERNTableViewItemManager.h"
#import "ERNDefaultTableViewItemManager.h"
#import "ERNErrorHandler.h"
#import "ERNDummyTableViewCell.h"

@interface ERNAsyncItemsRepositoryTableViewManager ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository>repository;
@property (nonatomic, readonly) id<ERNTableViewItemManager>itemManager;
@end

@implementation ERNAsyncItemsRepositoryTableViewManager {
    id<ERNTableViewCellFactory> _cellFactory;
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                        cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                      actionHandler:(id<ERNActionHandler>)actionHandler
{
    return [[self alloc] initWithRepository:repository
                                itemManager:[ERNDefaultTableViewItemManager
                                             createWithCellFactory:cellFactory
                                             actionHandler:actionHandler]];
}

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                      actionHandler:(id<ERNActionHandler>)actionHandler
{
    return [[self alloc] initWithRepository:repository
                                itemManager:[ERNDefaultTableViewItemManager
                                             createWithActionHandler:actionHandler]];
}

+(instancetype)createWithRepository:(id<ERNAsyncItemsRepository>)repository
                        cellFactory:(id<ERNTableViewCellFactory>)cellFactory
{
    return [[self alloc] initWithRepository:repository
                                itemManager:[ERNDefaultTableViewItemManager
                                             createWithCellFactory:cellFactory]];
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
    ERNCheckNilAndReturn(tableView, [ERNDummyTableViewCell create]);
    ERNCheckNilAndReturn(indexPath, [ERNDummyTableViewCell create]);
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
