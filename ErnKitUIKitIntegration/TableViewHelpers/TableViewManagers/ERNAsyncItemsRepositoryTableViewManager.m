#import <UIKit/UIKit.h>
#import "ERNAsyncItemsRepositoryTableViewManager.h"
#import "ERNAsyncItemsRepository.h"
#import "ERNTableViewCellFactory.h"
#import "ERNNullTableViewCellFactory.h"
#import "ERNActionHandler.h"
#import "ERNErrorHandler.h"

@interface ERNAsyncItemsRepositoryTableViewManager ()
@property (nonatomic, readonly) id<ERNAsyncItemsRepository>repository;
@property (nonatomic, readonly) id<ERNTableViewCellFactory>cellFactory;
@property (nonatomic, readonly) id<ERNActionHandler>actionHandler;
@end

@implementation ERNAsyncItemsRepositoryTableViewManager {
    id<ERNTableViewCellFactory> _cellFactory;
}

#pragma mark - public - constructors

+(instancetype)tableViewManagerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                  cellFactory:(id<ERNTableViewCellFactory>)cellFactory
                                actionHandler:(id<ERNActionHandler>)actionHandler
{
    return [[self alloc] initWithRepository:repository
                                cellFactory:cellFactory
                              actionHandler:actionHandler];
}

+(instancetype)tableViewManagerWithRepository:(id<ERNAsyncItemsRepository>)repository
                                  cellFactory:(id<ERNTableViewCellFactory>)cellFactory
{
    return [[self alloc] initWithRepository:repository
                                cellFactory:cellFactory];
}

+(instancetype)tableViewManagerWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    return [[self alloc] initWithRepository:repository];
}

#pragma mark - ERNTableViewManager

-(void)actionForIndexPath:(NSIndexPath *)indexPath
{
    ERNCheckNilNoReturn(indexPath);
    [[self actionHandler] actionForObject:[[self repository] itemAtIndex:(NSUInteger)[indexPath row]]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView
             cellForIndexPath:(NSIndexPath *)indexPath
{
    return [[self cellFactory] cellForTableView:tableView
                                     fromObject:[[self repository] itemAtIndex:(NSUInteger)[indexPath row]]];
}

-(CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath
                    defaultHeight:(CGFloat)defaultHeight
{
    return [[self cellFactory] cellHeightForObject:[[self repository] itemAtIndex:(NSUInteger)[indexPath row]]
                                     defaultHeight:defaultHeight];
}

-(NSInteger)sections
{
    return 1;
}

-(NSInteger)rowsInSection:(NSInteger)section
{
    return (NSInteger)[[self repository] count];
}

#pragma mark - private - accessors

-(id<ERNTableViewCellFactory>)cellFactory
{
    _cellFactory = _cellFactory ? _cellFactory : [ERNNullTableViewCellFactory tableViewCellFactory];
    return _cellFactory;
}

#pragma mark - private - initializers

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
{
    self = [self init];
    ERNCheckNil(self);
    _repository = repository;
    return self;
}

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
            cellFactory:(id<ERNTableViewCellFactory>)cellFactory
{
    self = [self initWithRepository:repository];
    ERNCheckNil(self);
    _cellFactory = cellFactory;
    return self;
}

-(id)initWithRepository:(id<ERNAsyncItemsRepository>)repository
            cellFactory:(id<ERNTableViewCellFactory>)cellFactory
          actionHandler:(id<ERNActionHandler>)actionHandler
{
    self = [self initWithRepository:repository
                        cellFactory:cellFactory];
    ERNCheckNil(self);
    _actionHandler = actionHandler;
    return self;
}

@end
