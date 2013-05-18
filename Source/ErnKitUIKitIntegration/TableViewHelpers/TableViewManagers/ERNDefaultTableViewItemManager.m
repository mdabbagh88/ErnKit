#import "ERNDefaultTableViewItemManager.h"
#import "ERNErrorHandler.h"
#import "ERNActionHandler.h"
#import "ERNTableViewCellFactory.h"
#import "ERNNullTableViewCellFactory.h"
#import "ERNDummyTableViewCell.h"

@interface ERNDefaultTableViewItemManager ()
@property (nonatomic, readonly) id<ERNActionHandler> actionHandler;
@property (nonatomic, readonly) id<ERNTableViewCellFactory> cellFactory;
@end

@implementation ERNDefaultTableViewItemManager {
    id<ERNTableViewCellFactory> _cellFactory;
}

#pragma mark - public - constructors

+(instancetype)createWithCellFactory:(id<ERNTableViewCellFactory>)cellFactory
                       actionHandler:(id<ERNActionHandler>)actionHandler
{
    return [[self alloc] initWithCellFactory:cellFactory
                               actionHandler:actionHandler];
}

+(instancetype)createWithActionHandler:(id<ERNActionHandler>)actionHandler
{
    return [[self alloc] initWithCellFactory:nil
                               actionHandler:actionHandler];
}

+(instancetype)createWithCellFactory:(id<ERNTableViewCellFactory>)cellFactory
{
    return [[self alloc] initWithCellFactory:cellFactory
                               actionHandler:nil];
}

#pragma mark - ERNTableViewItemManager

-(void)actionForObject:(id<NSObject>)object
{
    ERNCheckNilNoReturn(object);
    [[self actionHandler] actionForObject:object];
}

-(UITableViewCell *)cellForTableView:(UITableView *)tableView
                          fromObject:(id<NSObject>)object
{
    ERNCheckNilAndReturn(tableView, [ERNDummyTableViewCell create]);
    ERNCheckNilAndReturn(object, [ERNDummyTableViewCell create]);
    return [[self cellFactory] cellForTableView:tableView
                                     fromObject:object];
}

-(CGFloat)cellHeightForObject:(id<NSObject>)object
                defaultHeight:(CGFloat)defaultHeight
{
    ERNCheckNilAndReturn(object, defaultHeight);
    return [[self cellFactory] cellHeightForObject:object
                                     defaultHeight:defaultHeight];
}

#pragma mark - private - accessors

-(id<ERNTableViewCellFactory>)cellFactory
{
    return _cellFactory = _cellFactory ?
    _cellFactory :
    [ERNNullTableViewCellFactory create];
}

#pragma mark - private - initializers

-(id)initWithCellFactory:(id<ERNTableViewCellFactory>)cellFactory
           actionHandler:(id<ERNActionHandler>)actionHandler
{
    self = [self init];
    ERNCheckNil(self);
    _cellFactory = cellFactory;
    _actionHandler = actionHandler;
    return self;
}

@end