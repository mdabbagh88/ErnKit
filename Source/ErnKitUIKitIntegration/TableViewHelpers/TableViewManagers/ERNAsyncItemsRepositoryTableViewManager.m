#import <UIKit/UIKit.h>
#import "ERNAsyncItemsRepositoryTableViewManager.h"
#import "ERNAsyncPaginatedItemsRepository.h"
#import "ERNTableViewItemManager.h"
#import "ERNTableViewCellFactory.h"
#import "ERNErrorHandler.h"
#import "ERNNullTableViewCell.h"
#import "ERNNullTableViewItemManager.h"

@interface ERNAsyncItemsRepositoryTableViewManager ()
@property (nonatomic, readonly) id<ERNAsyncPaginatedItemsRepository> repository;
@property (nonatomic, readonly) id<ERNTableViewItemManager> itemManager;
@end

@implementation ERNAsyncItemsRepositoryTableViewManager {
    id<ERNTableViewCellFactory> _cellFactory;
    id<ERNTableViewItemManager> _itemManager;
}

#pragma mark - public - constructors

+(instancetype)createWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
                        itemManager:(id<ERNTableViewItemManager>)itemManager
{
    return [[self alloc] initWithRepository:repository
                                itemManager:itemManager];
}

#pragma mark - ERNTableViewManager

-(void)actionForIndexPath:(NSIndexPath *)indexPath
{
    ERNCheckNilNoReturn(indexPath);
    [[self itemManager] actionForObject:
     [[self repository] itemAtIndex:(NSUInteger)[indexPath row]]];
}

-(UITableViewCell *)cellForIndexPath:(NSIndexPath *)indexPath
                          cellReuser:(UITableViewCell *(^)(NSString *identifier))block
{
    ERNCheckNilAndReturn(indexPath, [ERNNullTableViewCell create]);
    [self handlePageFetchingForRow:[indexPath row]];
    return [[self itemManager] cellWithCellReuser:(UITableViewCell *(^)(NSString *identifier))block
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

#pragma mark - private

-(void)handlePageFetchingForRow:(NSInteger)row
{
    if ([self loadNextForIndex:row]) {
        [[self repository] fetchNext];
    }
    if ([self loadPreviousForIndex:row]) {
        [[self repository] fetchPrevious];
    }
}

-(BOOL)loadNextForIndex:(NSInteger)index
{
    return (index == (NSInteger)[[self repository] count] - 1) && [[self repository] hasNext];
}

-(BOOL)loadPreviousForIndex:(NSInteger)index
{
    return (index == 0) && [[self repository] hasPrevious];
}

#pragma mark - private - accessors

-(id<ERNTableViewItemManager>)itemManager
{
    return _itemManager = _itemManager ? _itemManager :
    [ERNNullTableViewItemManager create];
}

#pragma mark - private - initializers

-(id)initWithRepository:(id<ERNAsyncPaginatedItemsRepository>)repository
            itemManager:(id<ERNTableViewItemManager>)itemManager
{
    self = [super init];
    ERNCheckNil(self);
    _repository = repository;
    _itemManager = itemManager;
    return self;
}

@end
